import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:kt_dart/collection.dart';

abstract class IInvestingRepositoryMx {
  Future<Either<BaseFailure, BankAccountItem>> addBankAccount(
      BankAccountItem item, bool isInvestment);
  Future<Either<BaseFailure, Map<int, String>>> getBanks();
  Future<bool> getHolidayAvailable(DateTime valueDate);
  Future<Either<BaseFailure, bool>> addScheduledDebit(
      BankAccountItem item,
      DashboardGoal goal,
      bool multiple,
      List<DashboardGoal> goals,
      double totalValue);
  Future<Either<BaseFailure, bool>> softEnrollment();
  Future<Either<BaseFailure, String>> generateSpei(
      double value, List<DashboardGoal> goals, List<double> values);
  Future<List<BankInfo>> getBankAccounts();
  Future<Either<BaseFailure, String>> generatePSE(double value);
  Future<Either<BaseFailure, bool>> sendEmailVinculation();
}
