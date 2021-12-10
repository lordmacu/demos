import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_item.freezed.dart';

@freezed
abstract class GoalItem with _$GoalItem {
  /**
   * periodicidad quincenal
   */
  static const int QUINCENCAL = 1;

  /**
   * periodicidad mensual
   */
  static const int MENSUAL = 2;

  /**
   * periodicidad trimestral
   */
  static const int TRIMESTRAL = 3;

  const factory GoalItem({
    @required String emoji,
    @required String goalName,
    @required double totalValue,
    @required int periodicity,
    @required double feeValue,
    @required DateTime createdDate,
    @required int numMonths,
    @required int id,
  }) = _GoalItem;

  factory GoalItem.empty() => GoalItem(
        createdDate: DateTime.now(),
        feeValue: 0,
        emoji: '',
        numMonths: 0,
        goalName: '',
        periodicity: 1,
        totalValue: 0,
        id: 0,
      );
}
