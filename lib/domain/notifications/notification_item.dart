import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';

@freezed
abstract class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    @required int id,
    @required String name,
    @required DateTime date,
    @required double value,
    @required int transactionTypeId,
    @required int transactionStateId,
    @required String transactionStateName,
    @required int transactionStateMoney,
    String description
  }) = _NotificationItem;

  factory NotificationItem.empty() => NotificationItem(
        id: 0,
        name: "",
        date: DateTime.now(),
        transactionStateId: 0,
        transactionStateMoney: 0,
        transactionTypeId: 0,
        transactionStateName: "",
        value: 0.0,
        description: ""
      );
}
