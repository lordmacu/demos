import 'package:ualet/domain/withdrawalMX/simulate_transaction_remove_money.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';

import 'debit_info.dart';

abstract class IWithdrawalRepository {
  Stream<Either<BaseFailure, WithdrawalInfo>> getInfo(bool needsBankInfo);

  Future<Either<BaseFailure,SimulateTransactionRemoveMoney>> getSimulation(double value);

  Future<bool> sendOTP(String phoneNumber);
  Future<Either<BaseFailure, bool>> validateOTP(String phone, String otp);
  Future<Either<BaseFailure, bool>> withdrawalAll(
      String bankAccountId,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal,
      bool isValidReCalculateDebits);
  Future<Either<BaseFailure, bool>> withdrawalParcial(
      List<double> values,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal);
  Future<Either<BaseFailure, ValidarTransactionPopupInfo>>
      validateTransactionPopUpType(int rulePopUpType, double transactionValue);
  Future<Either<BaseFailure, bool>> deleteAllGoals(List<DashboardGoal> goals);
  Future<Either<BaseFailure, bool>> deleteAllDebit(List<DebitInfo> debits);
  Future<Either<BaseFailure, bool>> deleteGoal(DashboardGoal goal);
  Future<Either<BaseFailure, bool>> deleteDebit(DebitInfo debit);
  Future<Either<BaseFailure, bool>> assignMoney(
      DashboardGoal assignFrom, DashboardGoal assignTo, double assignValue);
}
