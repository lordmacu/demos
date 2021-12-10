import 'dart:async';

import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'investing_choose_goal_event.dart';
part 'investing_choose_goal_state.dart';
part 'investing_choose_goal_bloc.freezed.dart';

@injectable
class InvestingChooseGoalBloc
    extends Bloc<InvestingChooseGoalEvent, InvestingChooseGoalState> {
  @override
  Stream<InvestingChooseGoalState> mapEventToState(
    InvestingChooseGoalEvent event,
  ) async* {
    double minInvestment =
        getIt<IEnv>().isColombia() ? 10000.0 : Values.minInvestment;
    yield* event.map(addGoal: (e) async* {
      // if (e.value >= 10000) {
      List<DashboardGoal> goalsChosen = state.goalsChosen;
      List valuesChosen = state.valuesChosen;
      Map alreadyChosen = state.alreadyChosen;
      bool isAlreadyChosen = false;
      if (alreadyChosen.containsKey(e.goal.id)) {
        isAlreadyChosen = alreadyChosen[e.goal.id];
      }
      if (isAlreadyChosen) {
        for (int i = 0; i < goalsChosen.length; i++) {
          if (goalsChosen[i].id == e.goal.id) {
            valuesChosen[i] = e.value;
            goalsChosen[i] = goalsChosen[i].copyWith(
              fee: e.value,
            );
          }
        }
      } else {
        for (int i = 0; i < goalsChosen.length; i++) {
          if (goalsChosen[i].id == 0) {
            goalsChosen[i] = e.goal.copyWith(fee: e.value);
            valuesChosen[i] = e.value;
            alreadyChosen[e.goal.id] = true;
            break;
          }
        }
      }
      double total = valuesChosen.fold(
          0, (previousValue, element) => previousValue + element);

      bool isActive = true;
      for (int i = 0; i < goalsChosen.length; i++) {
        if (goalsChosen[i].id != 0 &&
            (valuesChosen[i] > goalsChosen[i].goalAmt ||
                valuesChosen[i] < minInvestment)) {
          isActive = false;
          print("isActive falsed");
          break;
        } else if (goalsChosen[i].id == 0) {
          print(goalsChosen[i].id);
        }
      }
      List ids = goalsChosen.map((g) => g.id).toList();
      print(valuesChosen);
      print(goalsChosen.length);
      print(ids);
      yield state.copyWith(
        alreadyChosen: alreadyChosen,
        goalsChosen: goalsChosen,
        valuesChosen: valuesChosen,
        isActive: isActive,
        total: total,
      );
      // else {
      //   List goalsChosen = state.goalsChosen;
      //   List valuesChosen = state.valuesChosen;
      //   Map alreadyChosen = state.alreadyChosen;
      //   bool isActive = false;
      //   if (alreadyChosen.containsKey(e.goal.id)) {
      //     alreadyChosen[e.goal.id] = false;
      //   }
      //   for (int i = 0; i < goalsChosen.length; i++) {
      //     if (goalsChosen[i].id == e.goal.id) {
      //       goalsChosen[i] = DashboardGoal.empty();
      //       valuesChosen[i] = 0.0;
      //     }
      //     if (goalsChosen[i].id != 0) {
      //       isActive = true;
      //     }
      //   }
      //   double total = valuesChosen.fold(
      //       0, (previousValue, element) => previousValue + element);
      //   for (int i = 0; i < goalsChosen.length; i++) {
      //     if (goalsChosen[i].id != 0 &&
      //         (valuesChosen[i] > goalsChosen[i].goalAmt ||
      //             valuesChosen[i] < 10000)) {
      //       isActive = false;
      //       print("isActive falsed");
      //       break;
      //     }
      //   }
      //   yield state.copyWith(
      //     alreadyChosen: alreadyChosen,
      //     goalsChosen: goalsChosen,
      //     valuesChosen: valuesChosen,
      //     isActive: isActive,
      //     total: total,
      //   );
      // }
    }, deleteGoal: (e) async* {
      List goalsChosen = state.goalsChosen;
      List valuesChosen = state.valuesChosen;
      Map alreadyChosen = state.alreadyChosen;
      bool isActive = false;
      if (alreadyChosen.containsKey(e.goal.id)) {
        alreadyChosen[e.goal.id] = false;
      }
      for (int i = 0; i < goalsChosen.length; i++) {
        if (goalsChosen[i].id == e.goal.id) {
          goalsChosen[i] = DashboardGoal.empty();
          valuesChosen[i] = 0.0;
        }
        if (goalsChosen[i].id != 0) {
          isActive = true;
        }
      }
      double total = valuesChosen.fold(
          0, (previousValue, element) => previousValue + element);
      yield state.copyWith(
        alreadyChosen: alreadyChosen,
        goalsChosen: goalsChosen,
        valuesChosen: valuesChosen,
        isActive: isActive,
        total: total,
      );
    }, choosePeriodicity: (e) async* {
      List goalsChosen = state.goalsChosen;
      List valuesChosen = state.valuesChosen;
      Map alreadyChosen = state.alreadyChosen;
      bool isActive = false;
      for (int i = 0; i < goalsChosen.length; i++) {
        if (goalsChosen[i].periodicity == state.chosedPeriodicity) {
          goalsChosen[i] = DashboardGoal.empty();
          valuesChosen[i] = 0.0;
        }
        if (goalsChosen[i].id != 0) {
          isActive = true;
        }
        if (alreadyChosen.containsKey(goalsChosen[i].id)) {
          if (goalsChosen[i].periodicity == state.chosedPeriodicity) {
            alreadyChosen[goalsChosen[i].id] = false;
          }
        }
      }
      double total = valuesChosen.fold(
          0, (previousValue, element) => previousValue + element);

      yield state.copyWith(
        chosedPeriodicity: e.periodicity,
        goalsChosen: goalsChosen,
        valuesChosen: valuesChosen,
        alreadyChosen: alreadyChosen,
        isActive: isActive,
        total: total,
      );
    });
  }

  @override
  InvestingChooseGoalState get initialState =>
      InvestingChooseGoalState.initial();
}
