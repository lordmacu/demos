part of 'user_migration_bloc.dart';

@freezed
abstract class UserMigrationEvent with _$UserMigrationEvent {
  const factory UserMigrationEvent.getData() = _getData;
  const factory UserMigrationEvent.loadData(UserMigrationInfo item) = _loadData;
  const factory UserMigrationEvent.saveGoal(DashboardGoal goal, bool isPse) =
      _saveGoal;
  const factory UserMigrationEvent.postGoals() = _postGoals;
  const factory UserMigrationEvent.updateIntroductoryMigrate(bool valueParameter) = UpdateIntroductoryMigrate;
}
