import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_investing_success.freezed.dart';

@freezed
abstract class DashboardTotalApprovedTransactionsItem with _$DashboardTotalApprovedTransactionsItem {
  const factory DashboardTotalApprovedTransactionsItem({
    @required bool isWithdrawal,
    @required double totalValue
  }) = _DashboardTotalApprovedTransactionsItem;

  factory DashboardTotalApprovedTransactionsItem.empty() => DashboardTotalApprovedTransactionsItem(
    isWithdrawal: false,  totalValue: 0
    );
}
