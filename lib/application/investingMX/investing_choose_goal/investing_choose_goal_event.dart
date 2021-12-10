part of 'investing_choose_goal_bloc.dart';

@freezed
abstract class InvestingChooseGoalEvent with _$InvestingChooseGoalEvent {
  const factory InvestingChooseGoalEvent.addGoal(
      DashboardGoal goal, double value) = _AddGoal;
  const factory InvestingChooseGoalEvent.deleteGoal(DashboardGoal goal) =
      _DeleteGoal;
  const factory InvestingChooseGoalEvent.choosePeriodicity(int periodicity) =
      _ChoosePerodicity;
}
