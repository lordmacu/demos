part of 'investing_choose_goal_bloc.dart';

@freezed
abstract class InvestingChooseGoalState with _$InvestingChooseGoalState {
  const factory InvestingChooseGoalState({
    List<DashboardGoal> goalsChosen,
    List<double> valuesChosen,
    Map<int, bool> alreadyChosen,
    bool isActive,
    double total,
    int chosedPeriodicity,
  }) = _InvestingChooseGoalState;

  factory InvestingChooseGoalState.initial() => InvestingChooseGoalState(
        alreadyChosen: {},
        goalsChosen: [
          DashboardGoal.empty(),
          DashboardGoal.empty(),
          DashboardGoal.empty(),
          DashboardGoal.empty(),
          DashboardGoal.empty(),
        ],
        valuesChosen: [0.0, 0.0, 0.0, 0.0, 0.0],
        isActive: false,
        total: 0.0,
        chosedPeriodicity: 0,
      );
}
