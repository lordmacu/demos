import 'dart:math';
import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';

part 'edit_goals_bloc.freezed.dart';
part 'edit_goals_event.dart';
part 'edit_goals_state.dart';

@injectable
class EditGoalsBloc extends Bloc<EditGoalsEvent, EditGoalsState> {
  final IGoalsRepository _goalsRepository;
  final IWithdrawalRepository _withdrawalRepository;

  EditGoalsBloc(this._goalsRepository, this._withdrawalRepository);

  static final double minInvestmentMx = Values.minGoalAmount;
  static final double minFeeMx = Values.minInvestment;
  static final double minInvestmentCo = 100000.0;
  static final double minFeeCo = 10000.0;

  @override
  EditGoalsState get initialState => EditGoalsState.initial();

  @override
  Stream<EditGoalsState> mapEventToState(EditGoalsEvent event) async* {
    final isColombia = getIt<IEnv>().isColombia();
    final minInvestment = isColombia ? minInvestmentCo : minInvestmentMx;
    final minFee = isColombia ? minFeeCo : minFeeMx;
    yield* event.map(
      forceShowChart: (_) async* {
        yield state.copyWith(
          showChart: true,
        );
      },
      //SetGoal
      setGoal: (data) async* {
        var newState = state.copyWith(
          goalData: data.goal,
          showChart: true,
          oldGoal: data.goal,
        );
        print("fee");
        print(data.goal.fee);
        newState = _printChart(newState);
        yield newState.copyWith(
          showChart: _activateChart(newState),
          buttonActivated: _activateButton(newState),
          postFailureOrSuccess: none(),
        );
      },

      //Post Goal
      postGoal: (data) async* {
        print("POST GOAL");
        yield state.copyWith(
          isPosting: true,
        );
        if (state.isMigrating) {
          final failureOrSuccess = await _goalsRepository.postGoal(
            GoalItem(
              emoji: data.goal.emoji,
              goalName: data.goal.name,
              totalValue: data.goal.goalAmt,
              periodicity: data.goal.periodicity,
              feeValue: data.goal.fee,
              createdDate: DateTime.now(),
              numMonths: data.goal.numMonths,
              id: data.goal.id,
            ),
          );
          yield state.copyWith(
            isPosting: false,
            createFailureOrSuccess: some(failureOrSuccess),
          );
        } else {
          final failureOrSuccess = await _goalsRepository.editGoal(data.goal);
          yield state.copyWith(
            isPosting: false,
            postFailureOrSuccess: some(failureOrSuccess),
          );
        }
      },
      //Name Update
      updateName: (e) async* {
        if (e.newName.length > 30 || e.newName == '') {
          yield state.copyWith(
            nameError: true,
          );
        } else {
          yield state.copyWith(
            buttonActivated: _activateButton(state),
            nameError: false,
            goalData: state.goalData.copyWith(name: e.newName),
            postFailureOrSuccess: none(),
          );
        }
      },
      //Emoji Update
      updateEmoji: (value) async* {
        print(value.newEmoji);
        EditGoalsState newState = state.copyWith(
            goalData: state.goalData.copyWith(
          emoji: value.newEmoji,
        ));
        yield newState.copyWith(
          buttonActivated: _activateButton(newState),
          postFailureOrSuccess: none(),
        );
      },
      //Goal Amount update
      updateAmount: (value) async* {
        print("Update Amount");
        print(value.newAmount);
        if (value.newAmount != null && value.newAmount >= minInvestment) {
          EditGoalsState newState = state.copyWith(
              amountError: false,
              goalData: state.goalData.copyWith(
                goalAmt: value.newAmount,
              ));
          newState = _printChart(newState);
          yield newState.copyWith(
            showChart: _activateChart(newState),
            buttonActivated: _activateButton(newState),
            postFailureOrSuccess: none(),
          );
        } else {
          yield state.copyWith(
            amountError: true,
            postFailureOrSuccess: none(),
          );
        }
      },
      //Periodicity Update
      updatePeriodicity: (value) async* {
        print("Period update");
        print(value.newPeriodicity);
        if (value.newPeriodicity != GoalItem.MENSUAL &&
            value.newPeriodicity != GoalItem.QUINCENCAL &&
            value.newPeriodicity != GoalItem.TRIMESTRAL) {
          EditGoalsState newState = state.copyWith(periodicityError: true);
          yield newState.copyWith(
            postFailureOrSuccess: none(),
            buttonActivated: _activateButton(newState),
          );
        } else {
          EditGoalsState newState = state.copyWith(
              periodicityError: false,
              goalData: state.goalData.copyWith(
            periodicity: value.newPeriodicity,
          ));
          newState = _printChart(newState);
          yield newState.copyWith(
            showChart: _activateChart(newState),
            buttonActivated: _activateButton(newState),
            postFailureOrSuccess: none(),
          );
        }
      },

      //Savings update (slider u otro)
      updateSavings: (value) async* {
        print("UpdateSavings");
        print(value.newSavings);
        if (value.newSavings < minFee) {
          yield state.copyWith(
            cuoteError: true,
          );
        } else {
          EditGoalsState newState = state.copyWith(
              goalData: state.goalData.copyWith(
            fee: value.newSavings.toDouble(),
          ));
          newState = _printChart(newState);
          yield newState.copyWith(
            cuoteError: false,
            showChart: _activateChart(newState),
            buttonActivated: _activateButton(newState),
            postFailureOrSuccess: none(),
          );
        }
      },
      deleteGoal: (e) async* {
        yield state.copyWith(isPosting: true);

        var deletedOrFailure = await _withdrawalRepository.deleteGoal(e.goal);

        yield state.copyWith(
            isPosting: false, deleteGoalOrFailure: some(deletedOrFailure));
      },
      flagMigration: (e) async* {
        yield state.copyWith(
          isMigrating: e.value,
          showChart: false,
        );
      },
      validShowChart: (value) async* {
        EditGoalsState newState = state.copyWith(
            showChart: true);
        newState = _printChart(newState);
        yield newState.copyWith(
          postFailureOrSuccess: none(),
        );
      },
    );
  }

  _activateChart(EditGoalsState state) {
    var data = state.goalData;

    print("aqui estan las condiciones   ${data.goalAmt}  ${data.periodicity}   ${data.fee}");
    if (data.goalAmt > 0 && data.periodicity > 0 && data.fee > 0) {
      return true;
    } else {
      return false;
    }
  }

  _activateButton(EditGoalsState state) {
    final isColombia = getIt<IEnv>().isColombia();
    final minFee = isColombia ? minFeeCo : minFeeMx;
    var data = state.goalData;
    if (data.fee >= minFee &&
        !state.nameError &&
        !state.amountError &&
        !state.periodicityError &&
        !state.cuoteError &&
        state.goalData.emoji != '' &&
        ((state.oldGoal.fee != state.goalData.fee) ||
            (state.oldGoal.goalAmt != state.goalData.goalAmt) ||
            (state.oldGoal.periodicity != state.goalData.periodicity) ||
            (state.oldGoal.name != state.goalData.name) ||
            (state.oldGoal.emoji != state.goalData.emoji))) {
      return true;
    } else {
      return false;
    }
  }

  EditGoalsState _printChart(EditGoalsState state) {
    if (!state.showChart || state.goalData.fee == 0) {
      print(state.showChart);
      print(state.goalData.fee);
      return state;
    }
    //Calculo del mes inicio
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = state.goalData.fee;
    switch (state.goalData.periodicity) {
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
    var valGoal = state.goalData.goalAmt;
    var _valuePrev = ((log(1 + (valGoal * _valueRentability) / cuota)) /
        (log(1 + _valueRentability)));

    int _valueMonth;
    switch (state.goalData.periodicity) {
      case GoalItem.MENSUAL:
        _valueMonth = (_valuePrev).toDouble().round() < 1
            ? 1
            : (_valuePrev).toDouble().round();
        break;
      case GoalItem.TRIMESTRAL:
        _valueMonth = (_valuePrev * 3).toDouble().round() < 1
            ? 1
            : (_valuePrev * 3).toDouble().round();
        break;
      case GoalItem.QUINCENCAL:
        _valueMonth = (_valuePrev / 2).toDouble().round() < 1
            ? 1
            : (_valuePrev / 2).toDouble().round();
        break;
      default:
    }
    // _sliderController.text.isEmpty ? 0 : _sliderController.text;

    //Calculo del mes inicio

    //Creacion de datos de los  graficos
    double valGoalSimpli = 0;
    if (valGoal >= 1000000) {
      valGoalSimpli = (valGoal / 1000000.0).roundToDouble();
    } else if (valGoal <= 100000) {
      valGoalSimpli = valGoal.roundToDouble();
    } else {
      valGoalSimpli = (valGoal / 100000.0).roundToDouble();
    }

    double cuotaSimpl = 0; //cuota simplificada en el mismo factor del valor
    if (valGoal >= 1000000) {
      cuotaSimpl = (cuota / 1000000.0).roundToDouble();
    } else if (valGoal <= 100000) {
      cuotaSimpl = cuota;
    } else {
      cuotaSimpl = (cuota / 100000.0).roundToDouble();
    }
    if (cuotaSimpl > valGoalSimpli) {
      cuotaSimpl = valGoalSimpli;
    }

    int monthBank = (valGoal / cuota) < 1 ? 1 : (valGoal / cuota).round();
    // int numPeriodsUalet = _valueMonth;
    switch (state.goalData.periodicity) {
      case GoalItem.QUINCENCAL:
        monthBank = (monthBank / 2).round();
        // numPeriodsUalet = (numPeriodsUalet * 2).round();
        break;
      case GoalItem.TRIMESTRAL:
        monthBank = (monthBank * 3).round();
        // numPeriodsUalet = (numPeriodsUalet/3).round();
        break;
      default:
        break;
    }
    // _valueMonth = numPeriodsUalet;

    //Grafico Ualet
    Map<double, double> dataUalet = state.dataUalet;
    dataUalet.clear();
    dataUalet[0] = cuotaSimpl;
    dataUalet[_valueMonth.toDouble()] = valGoalSimpli.toDouble();
    //Grafico Bank

    Map<double, double> dataOtros = state.dataOtros;
    dataOtros.clear();
    dataOtros[0] = cuotaSimpl;
    dataOtros[double.parse(monthBank.round().toString())] = valGoalSimpli;

    //Generacion puntos maximos

    int maxZero = valGoalSimpli.round().toString().length - 1;

    // String maxVal = "2";
    // for (var i = 0; i < maxZero; i++) {
    //   maxVal += "0";
    // }
    // double _maxX = (monthBank + double.parse(maxVal));
    // double _maxY = valGoalSimpli + double.parse(maxVal);
    double _maxY = valGoalSimpli;
    double _maxX = max(monthBank.toDouble(), _valueMonth.toDouble());

    //labels
    //Eje x
    Map<double, String> lx = state.lx;
    lx.clear();
    double diffPercent = (_valueMonth / monthBank);
    if (diffPercent < 0.1) {
      lx[0] = '\nmes';
    } else {
      lx[0] = 'mes';
    }
    lx[_valueMonth.toDouble()] = _valueMonth.toString();
    lx[double.parse(monthBank.round().toString())] =
        monthBank.round().toString();
    //Eje Y
    Map<double, String> ly = state.ly;
    ly.clear();
    if (valGoal >= 1000000) {
      ly[valGoalSimpli < 1 ? 1 : valGoalSimpli] = "${valGoalSimpli.round()}M";
    } else {
      ly[valGoalSimpli < 1 ? 1 : valGoalSimpli] = "${valGoalSimpli.round()}K";
    }
    if (valGoal >= 1000000) {
      ly[_maxY] = "${_maxY.round().toString()}M";
    } else {
      ly[_maxY] = "${_maxY.round().toString()}K";
    }

    return state.copyWith(
        dataOtros: dataOtros,
        dataUalet: dataUalet,
        lx: lx,
        ly: ly,
        maxX: _maxX,
        maxY: _maxY,
        monthsOthers: monthBank,
        numPeriodsUalet: _valueMonth,
        goalData: state.goalData.copyWith(numMonths: _valueMonth));
  }
}
