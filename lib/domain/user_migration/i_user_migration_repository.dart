import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'user_migration_item.dart';

abstract class IUserMigrationRepository {
  Future<Either<BaseFailure, KtList<UserMigrationItem>>>
      getUserMigrationItems();
  Future<BalanceItem> getBalance();
  Future<Either<BaseFailure, bool>> postUserMigration(UserMigrationState state);
  Future<Either<BaseFailure, GoalItem>> postGoalMigration(GoalItem state);
  Future<Either<BaseFailure, bool>> updateIntroductoryMigrate(bool valueParameter);
}
