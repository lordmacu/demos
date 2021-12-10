import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:kt_dart/collection.dart';

import 'goal_item.dart';

abstract class IGoalsRepository {
  Future<Either<BaseFailure, GoalItem>> postGoal(GoalItem goal);
  Future<Either<BaseFailure, bool>> updateGoal(GoalItem goal);
  Future<Either<BaseFailure, bool>> editGoal(DashboardGoal goal);
  Future<Either<BaseFailure, bool>> editGoalWithDebit(
      DashboardGoal goal, DebitInfo debit);
  Future<Either<BaseFailure, bool>> editDebitWithGoals(
      int debitId, int periodicity, double value, List<DashboardGoal> goals);
  Future<KtList<DashboardGoal>> getGoals();
}
