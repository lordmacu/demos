part of 'goals_bloc.dart';

@freezed
abstract class GoalsEvent with _$GoalsEvent {
  const factory GoalsEvent.updateName(String newName) = _updateName;
  const factory GoalsEvent.updateEmoji(String newEmoji) = _updateEmoji;
  const factory GoalsEvent.updateAmount(double newAmount) = _updateAmount;
  const factory GoalsEvent.updatePeriodicity(int newPeriodicity) =
      _updatePeriodicity;
  const factory GoalsEvent.validShowChart() = _validShowChart;
  const factory GoalsEvent.updateSavings(double newSavings) = _updateSavings;
  const factory GoalsEvent.postGoal(GoalItem goal) = _postGoal;
  const factory GoalsEvent.shownDialog(bool value) = _shownDialog;
  const factory GoalsEvent.postGoalMigration(GoalItem goal) = _postGoalMigration;

}
