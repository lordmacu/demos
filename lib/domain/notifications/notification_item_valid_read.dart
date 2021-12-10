import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item_valid_read.freezed.dart';

@freezed
abstract class NotificationValidRead with _$NotificationValidRead {
  const factory NotificationValidRead({
    @required int notificationsNotIsRead,
    @required int notificationsIsRead
  }) = _NotificationValidRead;

  factory NotificationValidRead.empty() => NotificationValidRead(
      notificationsNotIsRead: 0,
      notificationsIsRead: 0);
}
