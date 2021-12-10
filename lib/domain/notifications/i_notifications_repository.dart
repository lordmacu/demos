import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/notifications/notification_item.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class INotificationsRepository {
  Future<Either<BaseFailure, KtList<NotificationItem>>> getNotifications();
}
