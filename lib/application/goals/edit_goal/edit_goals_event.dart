part of 'edit_goals_bloc.dart';

@freezed
abstract class EditGoalsEvent with _$EditGoalsEvent {
  const factory EditGoalsEvent.updateName(String newName) = _updateName;
  const factory EditGoalsEvent.updateEmoji(String newEmoji) = _updateEmoji;
  const factory EditGoalsEvent.updateAmount(double newAmount) = _updateAmount;
  const factory EditGoalsEvent.updatePeriodicity(int newPeriodicity) =
      _updatePeriodicity;
  const factory EditGoalsEvent.updateSavings(double newSavings) =
      _updateSavings;
  const factory EditGoalsEvent.postGoal(DashboardGoal goal) = _postGoal;
  const factory EditGoalsEvent.setGoal(DashboardGoal goal) = _setGoal;
  const factory EditGoalsEvent.deleteGoal(DashboardGoal goal) = _deleteGoal;
  const factory EditGoalsEvent.forceShowChart() = _forceChart;
  const factory EditGoalsEvent.flagMigration(bool value) = _flagMigration;
  const factory EditGoalsEvent.validShowChart(double newSavings, int newPeriodicity) = _validShowChart;
}
