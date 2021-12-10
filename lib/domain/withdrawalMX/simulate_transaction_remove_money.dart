import 'package:ualet/domain/goals/goal_balance_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simulate_transaction_remove_money.freezed.dart';

@freezed
abstract class SimulateTransactionRemoveMoney with _$SimulateTransactionRemoveMoney {
  const factory SimulateTransactionRemoveMoney({
    @required double notAssignedBalance,
    @required List<GoalBalanceItem> goals,
  }) = _SimulateTransactionRemoveMoney;

  factory SimulateTransactionRemoveMoney.empty() => SimulateTransactionRemoveMoney(
        notAssignedBalance: 0,
        goals: []
      );
}
