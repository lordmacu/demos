import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_balance_item.freezed.dart';

@freezed
abstract class GoalBalanceItem with _$GoalBalanceItem {
  const factory GoalBalanceItem({
    @required int id,
    @required String nameGoal,
    @required String emoji,
    @required double transactionAmount,
    @required double newBalanceGoal
  }) = _GoalBalanceItem;

  factory GoalBalanceItem.empty() => GoalBalanceItem(
        id: 0,
        nameGoal: '',
        emoji: '',
        transactionAmount: 0,
        newBalanceGoal: 0
      );
}
