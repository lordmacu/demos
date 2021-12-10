import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'bank_info.dart';
import 'debit_info.dart';

part 'withdrawal_info.freezed.dart';

@freezed
abstract class WithdrawalInfo with _$WithdrawalInfo {
  const factory WithdrawalInfo(
      {@required String phoneNumber,
      @required List<BankInfo> banksInfo,
      @required List<DashboardGoal> goals,
      @required double totaBalance,
      List<DebitInfo> debits,
      List<BankInfo> banksInfoDebits,
      bool showPaint,
      String validateTransactionMsg,
      DashboardUserItem userInfo}) = _WithdrawalInfo;

  factory WithdrawalInfo.empty() => WithdrawalInfo(
      phoneNumber: "",
      banksInfo: [],
      goals: [],
      totaBalance: 0,
      showPaint: false,
      validateTransactionMsg: "",
      banksInfoDebits: [],
      userInfo: DashboardUserItem.empty());
}
