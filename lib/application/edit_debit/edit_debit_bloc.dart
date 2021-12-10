import 'dart:math';

import 'package:ualet/domain/my_wallet/edit_debit_chart_data.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';

part 'edit_debit_bloc.freezed.dart';
part 'edit_debit_event.dart';
part 'edit_debit_state.dart';

@injectable
class EditDebitBloc extends Bloc<EditDebitEvent, EditDebitState> {
  @override
  get initialState => EditDebitState.initial();

  @override
  Stream<EditDebitState> mapEventToState(EditDebitEvent event) async* {
    yield* event.map(selectDebitInfo: (data) async* {
      yield state.copyWith(
        debitInfo: data.newDebitItem,
      );
    },
        //select debit
        selectDebit: (data) async* {
      yield state.copyWith(
        debitItem: data.newDebitItem,
      );
    },

        //Update initial date
        updateInitialDate: (data) async* {
      print(data.newInitialDate.toString());
      yield state.copyWith(
        initialDate: data.newInitialDate,
      );
    },
        //Force Show Dialog
        forceShowDialog: (_) async* {
      yield state.copyWith(
        showDialog: (state.goal.numMonths != state.oldMonths),
      );
    },
        //Accept Change
        acceptChange: (_) async* {
      yield state.copyWith(
        showDialog: false,
        oldFee: state.goal.fee,
        oldPeriodicity: state.goal.periodicity,
        oldMonths: recalculate(state),
      );
    },
        //Undo Change con el boton del dialog
        undoChange: (_) async* {
      yield state.copyWith(
          showDialog: false,
          goal: state.goal.copyWith(
            fee: state.oldFee,
            periodicity: state.oldPeriodicity,
          ));
    },
        //Update Periodicity
        updatePeriodicity: (data) async* {
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
    },
        //Update Fee
        updateFee: (newFeeData) async* {
      print("updateFee");
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
    }, inicial: (_) async* {
      print("initial");
      yield state;
    }, isSubmitting: (e) async* {
      yield state.copyWith(isSubmitting: e.value);
    });
  }

  int recalculate(EditDebitState state) {
    print("recalculate");
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = state.goal.fee;
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
    if (cuota == 0) {
      cuota = 1;
    }
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
    print(_numMonths);
    return _numMonths;
  }

  bool isButtonActivated() {
    return (state.initialDate
        .isAfter(DateTime.now().subtract(Duration(days: 1))));
  }

  EditDebitChartData getChartData(
      {@required double fee,
      @required int periodicity,
      @required double totalValue}) {
//Calculo del mes inicio
    var _valueRentability = 0.0;
    double _rentability = 0.08;
    var cuota = fee;
    switch (periodicity) {
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
    if (cuota == 0) {
      cuota = 1;
    }
    var valGoal = totalValue;
    var _valuePrev = ((log(1 + (valGoal * _valueRentability) / cuota)) /
        (log(1 + _valueRentability)));

    int _valueMonth;
    switch (periodicity) {
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
    switch (periodicity) {
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
    Map<double, double> dataUalet = {};
    dataUalet.clear();
    dataUalet[0] = cuotaSimpl;
    dataUalet[_valueMonth.toDouble()] = valGoalSimpli.toDouble();
    //Grafico Bank

    Map<double, double> dataOtros = {};
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
    Map<double, String> lx = {};
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
    Map<double, String> ly = {};
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

    return EditDebitChartData(
        monthsUalet: _valueMonth,
        fee: fee,
        dataUalet: dataUalet,
        dataOtros: dataOtros,
        showChart: true,
        maxX: _maxX,
        maxY: _maxY,
        lx: lx,
        ly: ly,
        numPeriodsUalet: _valueMonth,
        monthsOthers: monthBank);
  }
}
