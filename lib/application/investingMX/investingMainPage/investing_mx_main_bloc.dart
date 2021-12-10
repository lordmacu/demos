import 'dart:math';

import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/goal_item.dart';

part 'investing_mx_main_bloc.freezed.dart';
part 'investing_mx_main_event.dart';
part 'investing_mx_main_state.dart';

@injectable
class InvestingMxMainBloc
    extends Bloc<InvestingMxMainEvent, InvestingMxMainState> {
  final IInvestingRepository _investingRepository;

  InvestingMxMainBloc(this._investingRepository);

  @override
  get initialState => InvestingMxMainState.initial();

  @override
  Stream<InvestingMxMainState> mapEventToState(
      InvestingMxMainEvent event) async* {
    yield* event.map(
      //Update initial date
      updateInitialDate: (data) async* {
        bool isAvailable = true;
        bool isAvailableDateValidation = true;

        //DateTime selectedDateValid = DateTime.now().add(new Duration(days: 2));
        // DateTime selectedDateValid = DateTime.now();
        DateTime selectedDateValid =
            DateTime.now().add(Duration(days: 4));

        // int deserializationDateValid = int.parse(
        //     selectedDateValid.year.toString() +
        //         validLenghtDate(selectedDateValid.month.toString()) +
        //         validLenghtDate(selectedDateValid.day.toString()));

        // int deserializationInitialDate = int.parse(
        //     data.newInitialDate.year.toString() +
        //         validLenghtDate(data.newInitialDate.month.toString()) +
        //         validLenghtDate(data.newInitialDate.day.toString()));

        //Validar que la fecha no sea en un día festivo
        if (data.newInitialDate != null) {
          isAvailable = await _investingRepository
              .getHolidayAvailable(data.newInitialDate);
        }

        List<DashboardGoal> newGoals = [];
        for (int i = 0; i < state.newGoals.length; i++) {
          newGoals.add(state.newGoals[i].copyWith(
            created: data.newInitialDate,
          ));
        }

        //Validar que la fecha sea posterior a la fecha actual 2 días.
        if (data.newInitialDate.isBefore(selectedDateValid)) {
          isAvailableDateValidation = true;
        } else {
          isAvailableDateValidation = false;
        }
        // if (deserializationInitialDate <= deserializationDateValid) {
        //   isAvailableDateValidation = true;
        // } else {
        //   isAvailableDateValidation = false;
        // }
        if (isAvailable == null) isAvailable = false;

        yield state.copyWith(
            initialDate: data.newInitialDate,
            isAvailableDate: isAvailable,
            isAvailableDateValidation: isAvailableDateValidation,
            newGoals: newGoals,
            goal: state.goal.copyWith(
              created: data.newInitialDate,
            ));
      },
      //Force Show Dialog
      forceShowDialog: (_) async* {
        yield state.copyWith(
          showDialog: (state.goal.numMonths != state.oldMonths),
        );
      },
      //Accept Change
      acceptChange: (e) async* {
        if (e.multiple) {
          yield state.copyWith(
            showDialog: false,
            oldGoals: state.newGoals,
            oldmultiplePeriodicity: state.multiplePeriodicity,
          );
        } else {
          yield state.copyWith(
            showDialog: false,
            oldFee: state.goal.fee,
            oldPeriodicity: state.goal.periodicity,
            oldMonths: recalculate(state),
          );
        }
      },
      //Undo Change con el boton del dialog
      undoChange: (e) async* {
        if (e.multiple) {
          var newGoals = state.oldGoals;
          yield state.copyWith(
            showDialog: false,
            newGoals: newGoals,
            multiplePeriodicity: state.oldmultiplePeriodicity,
          );
        } else {
          yield state.copyWith(
              showDialog: false,
              goal: state.goal.copyWith(
                fee: state.oldFee,
                periodicity: state.oldPeriodicity,
              ));
        }
      },
      //Update Periodicity
      updatePeriodicity: (data) async* {
        if (data.multiple) {
          List<DashboardGoal> newGoalsTemp = [];
          bool showDialog = true;
          int newMonths = 0;
          DashboardGoal newGoal;
          for (int i = 0; i < state.oldGoals.length; i++) {
            if (state.oldGoals[i].periodicity == data.newPeriodicity) {
              showDialog = false;
              break;
            }
            newGoal = DashboardGoal.empty().copyWith(
              created: state.oldGoals[i].created,
              currentAmt: state.oldGoals[i].currentAmt,
              emoji: state.oldGoals[i].emoji,
              fee: state.oldGoals[i].fee,
              goalAmt: state.oldGoals[i].goalAmt,
              goalBalance: state.oldGoals[i].goalBalance,
              goalTransactions: state.oldGoals[i].goalTransactions,
              id: state.oldGoals[i].id,
              name: state.oldGoals[i].name,
              numMonths: state.oldGoals[i].numMonths,
              percentComplete: state.oldGoals[i].percentComplete,
              periodicity: state.oldGoals[i].periodicity,
              tieneDomiciliacionprogramada:
                  state.oldGoals[i].tieneDomiciliacionprogramada,
            );

            newGoalsTemp.add(newGoal);
            newGoalsTemp[i] =
                newGoalsTemp[i].copyWith(periodicity: data.newPeriodicity);

            newMonths = recalculateMultiple(newGoalsTemp[i]);
            newGoalsTemp[i] = newGoalsTemp[i].copyWith(numMonths: newMonths);
          }
          if (showDialog) {
            yield state.copyWith(
              newGoals: newGoalsTemp,
              showDialog: true,
              multiplePeriodicity: data.newPeriodicity,
            );
          } else {
            yield state.copyWith(showDialog: false);
          }
        } else {
          var newState = state.copyWith(
              showDialog: (data.newPeriodicity != state.oldPeriodicity),
              goal: state.goal.copyWith(
                periodicity: data.newPeriodicity,
              ));
          int newMonths = recalculate(newState);
          yield newState.copyWith(
              goal: newState.goal.copyWith(
            numMonths: newMonths,
          ));
        }
      },
      //Update Fee
      updateFee: (newFeeData) async* {
        var newState = state.copyWith(
            goal: state.goal.copyWith(
          fee: newFeeData.newFee,
        ));
        int newMonths = recalculate(newState);
        yield newState.copyWith(
            goal: newState.goal.copyWith(
          numMonths: newMonths,
        ));
      },
      //Select Goal
      selectGoal: (data) async* {
        yield state.copyWith(
          oldFee: data.newGoal.fee,
          oldPeriodicity: data.newGoal.periodicity,
          oldMonths: data.newGoal.numMonths,
          goal: data.newGoal,
          selectedGoalIndex: data.newSelectedIndex,
        );
      },
      inicial: (_) async* {
        print("initial");
        yield state;
      },
      getMultipleData: (e) async* {
        List<DashboardGoal> newGoals = [];
        List<DashboardGoal> oldGoals = [];
        List<double> newValues = [];
        int periodicity = 1;
        for (int i = 0; i < e.goals.length; i++) {
          if (e.goals[i].id != 0) {
            newGoals.add(e.goals[i]);
            oldGoals.add(e.goals[i]);
            newValues.add(e.values[i]);
            periodicity = e.goals[i].periodicity;
          }
        }
        yield state.copyWith(
          newGoals: newGoals,
          valuesChosen: newValues,
          oldGoals: oldGoals,
          oldmultiplePeriodicity: periodicity,
          multiplePeriodicity: periodicity,
        );
      },
      nextPage: (e) async* {
        yield state.copyWith(isSubmitting: e.isSubmitting);
      },
      nextProcessAwait: (e) async* {
        Either<BaseFailure, bool> addScheduledDebit;
        bool isSubmitting = true;
        bool nextProcess = false;
        String messageErrorNextProcess = '';

        //Send service of create transaction
        addScheduledDebit = await _investingRepository.addScheduledDebit(
            e.item, e.goal, e.multiple, e.goals, e.totalValue);
        addScheduledDebit.fold(
            (l) => {
                  isSubmitting = false,
                   nextProcess = true,
                  messageErrorNextProcess = l.map(
                      unexpected: (_) => "Error Inesperado...",
                      fromServer: (e) => "Error Inesperado...")
                },
            (r) => {
              isSubmitting = false, 
              nextProcess = true});

        yield state.copyWith(
            isSubmitting: isSubmitting, nextProcess: nextProcess, messageErrorNextProcess: messageErrorNextProcess);
      },
    );
  }

  String validLenghtDate(String value) {
    if (value.length == 1) {
      value = '0' + value;
    }

    return value;
  }

  int validDayFirtsDate() {
    switch (DateTime.now().weekday) {
      case 1:
      case 2:
        return 3;
        break;
      case 3:
        return 5;
        break;
      case 4:
        return 5;
      case 5:
        return 3;
      case 6:
        return 3;
      case 7:
        return 3;
      default:
        return 0;
    }
  }

  int recalculate(InvestingMxMainState state) {
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = state.goal.fee == 0 ? 1 : state.goal.fee;
    switch (state.goal.periodicity) {
      case 1:
        _valueRentability = _rentability / 24;
        break;
      case 2:
        _valueRentability = _rentability / 12;
        break;
      case 3:
        _valueRentability = _rentability / 4;
        break;
      default:
    }
    var valGoal = state.goal.goalAmt;
    var _valuePrev = ((log(1 + (valGoal * _valueRentability) / cuota)) /
        (log(1 + _valueRentability)));
    int _numMonths;
    switch (state.goal.periodicity) {
      case GoalItem.MENSUAL:
        _numMonths = (_valuePrev).toDouble().round() < 1
            ? 1
            : (_valuePrev).toDouble().round();
        break;
      case GoalItem.TRIMESTRAL:
        _numMonths = (_valuePrev * 3).toDouble().round() < 1
            ? 1
            : (_valuePrev * 3).toDouble().round();
        break;
      case GoalItem.QUINCENCAL:
        _numMonths = (_valuePrev / 2).toDouble().round() < 1
            ? 1
            : (_valuePrev / 2).toDouble().round();
        break;
      default:
    }
    return _numMonths;
  }

  int recalculateMultiple(DashboardGoal goal) {
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = goal.fee == 0 ? 1 : goal.fee;
    switch (goal.periodicity) {
      case 1:
        _valueRentability = _rentability / 24;
        break;
      case 2:
        _valueRentability = _rentability / 12;
        break;
      case 3:
        _valueRentability = _rentability / 4;
        break;
      default:
    }
    var valGoal = goal.goalAmt;
    var _valuePrev = ((log(1 + (valGoal * _valueRentability) / cuota)) /
        (log(1 + _valueRentability)));
    int _numMonths;
    switch (goal.periodicity) {
      case GoalItem.MENSUAL:
        _numMonths = (_valuePrev).toDouble().round() < 1
            ? 1
            : (_valuePrev).toDouble().round();
        break;
      case GoalItem.TRIMESTRAL:
        _numMonths = (_valuePrev * 3).toDouble().round() < 1
            ? 1
            : (_valuePrev * 3).toDouble().round();
        break;
      case GoalItem.QUINCENCAL:
        _numMonths = (_valuePrev / 2).toDouble().round() < 1
            ? 1
            : (_valuePrev / 2).toDouble().round();
        break;
      default:
    }
    return _numMonths;
  }

  bool isButtonActivated() {
    print("isAvailableDate");
    print(state.isAvailableDate);
    print("isAvailableDateValidation");
    print(state.isAvailableDateValidation);
    print("numGoals");
    print(state.oldGoals.length);
    if (state.oldGoals.length > 0 &&
        !state.isAvailableDate &&
        !state.isAvailableDateValidation) {
      return state.initialDate
          .isAfter(DateTime.now().subtract(Duration(days: 1)));
    } else {
      double minFee = getIt<IEnv>().isColombia() ? 10000 : Values.minInvestment;
      return (state.goal.fee >= minFee &&
          state.goal.fee <= state.goal.goalAmt &&
          state.initialDate
              .isAfter(DateTime.now().subtract(Duration(days: 1))));
    }
  }
}
