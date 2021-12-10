import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';

part 'my_wallet_data.freezed.dart';

@freezed
abstract class MyWalletData with _$MyWalletData {
  const factory MyWalletData({
    @required KtList<DebitInfo> debitsList,
    @required KtList<DashboardGoal> goalsList,
    @required KtList<BankAccountItem> accountsList,
    @required bool showPaint,
  }) = _MyWalletData;

  factory MyWalletData.empty() => MyWalletData(
      debitsList: KtList.empty(),
      accountsList: KtList.empty(),
      goalsList: KtList.empty(),
      showPaint: false);
}
