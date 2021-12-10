import 'dart:math';
import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/user_migration/i_user_migration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';

part 'goals_bloc.freezed.dart';
part 'goals_event.dart';
part 'goals_state.dart';

@injectable
class GoalsBloc extends Bloc<GoalsEvent, GoalsState> {
  final IGoalsRepository _goalsRepository;
  final ICustomerLevelRepoMx _customerLevelRepo;
  final IUserMigrationRepository _migrationRepository;

  GoalsBloc(this._goalsRepository, this._customerLevelRepo,
      this._migrationRepository);

  static final double minInvestment = Values.minGoalAmount;
  static final double minFee = Values.minInvestment;

  @override
  GoalsState get initialState => GoalsState.initial();

  @override
  Stream<GoalsState> mapEventToState(GoalsEvent event) async* {
    yield* event.map(postGoalMigration: (data) async* {
      GoalsState newState = state.copyWith(goalData: state.goalData.copyWith());
      newState = _printChart(newState);

      yield newState.copyWith(
        isPosting: true,
      );

      final failureOrSuccess =
          await _migrationRepository.postGoalMigration(newState.goalData);
      yield state.copyWith(
        isPosting: false,
        postFailureOrSuccess: some(failureOrSuccess),
      );
    },
        //Post Goal
        postGoal: (data) async* {
      GoalsState newState = state.copyWith(goalData: data.goal);
      newState = _printChart(newState);

      yield newState.copyWith(
        isPosting: true,
      );

      final failureOrSuccess =
          await _goalsRepository.postGoal(newState.goalData);

      yield state.copyWith(
        isPosting: false,
        postFailureOrSuccess: some(failureOrSuccess),
      );
    },
        //Name Update
        updateName: (e) async* {
      if (e.newName.length > 30 || e.newName == '') {
        yield state.copyWith(
          nameError: true,
          showDialog: false,
        );
      } else {
        bool showMessage = _showMessage(state.copyWith(
            goalData: state.goalData.copyWith(goalName: e.newName)));
        yield state.copyWith(
          buttonActivated: _activateButton(state),
          nameError: false,
          goalData: state.goalData.copyWith(goalName: e.newName),
          postFailureOrSuccess: none(),
          showDialog: showMessage,
        );
      }
    },
        //Emoji Update
        updateEmoji: (value) async* {
      print(value.newEmoji);
      GoalsState newState = state.copyWith(
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
      print(value.newAmount);
      if (value.newAmount != null && value.newAmount >= minInvestment) {
        bool showMessage = _showMessage(state.copyWith(
            goalData: state.goalData.copyWith(totalValue: value.newAmount)));
        GoalsState newState = state.copyWith(
            amountError: false,
            goalData: state.goalData.copyWith(
              totalValue: value.newAmount,
            ));
        // newState = _printChart(newState);
        yield newState.copyWith(
          //showChart: _activateChart(newState),
          buttonActivated: _activateButton(newState),
          postFailureOrSuccess: none(),
          showDialog: showMessage,
        );
      } else {
        yield state.copyWith(
          amountError: true,
          postFailureOrSuccess: none(),
          showDialog: false,
        );
      }
    },
        //Periodicity Update
        updatePeriodicity: (value) async* {
      if (value.newPeriodicity != GoalItem.MENSUAL &&
          value.newPeriodicity != GoalItem.QUINCENCAL &&
          value.newPeriodicity != GoalItem.TRIMESTRAL) {
        yield state.copyWith(
          periodicityError: true,
          postFailureOrSuccess: none(),
        );
      } else {
        GoalsState newState = state.copyWith(
            goalData: state.goalData.copyWith(
          periodicity: value.newPeriodicity,
        ));
        // newState = _printChart(newState);
        yield newState.copyWith(
          // showChart: _activateChart(newState),
          buttonActivated: _activateButton(newState),
          postFailureOrSuccess: none(),
        );
      }
    },
        //Show Chart
        validShowChart: (value) async* {
      GoalsState newState = state.copyWith(goalData: state.goalData.copyWith());
      newState = _printChart(newState);
      yield newState.copyWith(
        showChart: _activateChart(newState),
        postFailureOrSuccess: none(),
      );
    },
        //Savings update (slider u otro)
        updateSavings: (value) async* {
      print(value.newSavings);
      if (value.newSavings < minFee) {
        yield state.copyWith(
          cuoteError: true,
          showDialog: false,
        );
      } else {
        bool showMessage = _showMessage(state.copyWith(
            goalData: state.goalData.copyWith(feeValue: value.newSavings)));
        GoalsState newState = state.copyWith(
            goalData: state.goalData.copyWith(
          feeValue: value.newSavings.toDouble(),
        ));
        // newState = _printChart(newState);
        yield newState.copyWith(
          cuoteError: false,
          //showChart: _activateChart(newState),
          buttonActivated: _activateButton(newState),
          postFailureOrSuccess: none(),
          showDialog: showMessage,
        );
      }
    }, shownDialog: (e) async* {
      yield state.copyWith(dialogShown: e.value);
    });
  }

  _activateChart(GoalsState state) {
    var data = state.goalData;
    if (data.totalValue > 0 && data.periodicity > 0) {
      return true;
    } else {
      return false;
    }
  }

  _activateButton(GoalsState state) {
    var data = state.goalData;
    if (
        //state.showChart &&
        data.feeValue >= minFee &&
            !state.nameError &&
            !state.amountError &&
            !state.periodicityError &&
            !state.cuoteError &&
            state.goalData.emoji != '') {
      return true;
    } else {
      return false;
    }
  }

  GoalsState _printChart(GoalsState state) {
    if (state.goalData.feeValue == 0) {
      return state;
    }
    //Calculo del mes inicio
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = state.goalData.feeValue;

    // switch (state.goalData.periodicity) {
    //   case 1:
    //     cuota = state.goalData.feeValue / 2;
    //     break;
    //   case 2:
    //     cuota = state.goalData.feeValue;
    //     break;
    //   case 3:
    //     cuota = state.goalData.feeValue * 3;
    //     break;
    //   default:
    // }
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
    var valGoal = state.goalData.totalValue;
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

  bool _showMessage(GoalsState state) {
    return state.goalData.emoji.length == 0 &&
        state.goalData.feeValue > 0 &&
        state.goalData.goalName.length > 0 &&
        state.goalData.periodicity > 0 &&
        state.goalData.totalValue > 0;
  }
}
