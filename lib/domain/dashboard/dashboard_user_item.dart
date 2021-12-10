import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_user_item.freezed.dart';

@freezed
abstract class DashboardUserItem with _$DashboardUserItem {
  const factory DashboardUserItem({
    @required String name,
    @required String riskProfile, //estratega y eso
    @required bool hasTransactions,
    @required double balance,
    @required double efectivo,
    @required double titles,
    double notAssignedBalance,
  }) = _DashboardUserItem;

  factory DashboardUserItem.empty() => DashboardUserItem(
    name: '', riskProfile: '', balance: 0, hasTransactions: false, efectivo: 0.0,titles: 0.0, notAssignedBalance: 0.0
    );
}
