import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/domain/sarlaft/ocupation_item.dart';
import 'package:ualet/domain/sarlaft/required_file_item.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:kt_dart/collection.dart';

abstract class IInvestingRepository {
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
  Future<Either<BaseFailure, bool>> sendSarlaf(GrandesMontosDataState state);
  Future<Either<BaseFailure, KtList<OcupationItem>>> getItems();
  Future<List<BankInfo>> getBankAccounts();
  Future<Either<BaseFailure, KtList<RequiredFileItem>>> getRequiredFiles();
  Future<Either<BaseFailure, String>> generatePSE(double value);
  Future<Either<BaseFailure, ValidarTransactionPopupInfo>>
      validateTransactionPopUpType(int rulePopUpType, double transactionValue);
}
