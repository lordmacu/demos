import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';

import 'dashboard_goal.dart';

abstract class IDashboardRepository {
  Future<Either<BaseFailure, DashboardData>> getData();
  Future<double> getBalance();
  Future<UserInfo> consultUserSarlaft();
  Future VerifyTheInvestmentUser(value);
  Future VerifyTheInvestmentUserFirst();
  Future GetMaximumInvesment();
}
