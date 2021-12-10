import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/notifications/i_notifications_repository.dart';
import 'package:ualet/domain/notifications/notification_item.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

@LazySingleton(as: INotificationsRepository)
class NotificationsRepository implements INotificationsRepository {
  final Dio _dio;

  final SharedPreferences _sharedPreferences;

  final apiNotifications = "/Transaction/GetAllTransactionOfLastMonthAndIsRead";

  NotificationsRepository(this._dio, this._sharedPreferences);
  @override
  Future<Either<BaseFailure, KtList<NotificationItem>>>
      getNotifications() async {
    var notiData = await _dio.get(apiNotifications);

    log("aquiii el string largo ${notiData}");


    if (notiData.data["Result"]) {
      List<NotificationItem> notifications = [];
      List noti = notiData.data["Data"];
      NotificationItem item;
      int ammount = 0;

      for (int i = 0; i < noti.length; i++) {
        item = NotificationItem(
          id: noti[i]["Id"],
          name: noti[i]["Name"],
          date: DateTime.parse(noti[i]["Date"]),
          value: noti[i]["Value"],
          transactionTypeId: noti[i]["TransactionTypeId"],
          transactionStateId: noti[i]["TransactionStateId"],
          transactionStateName: noti[i]["TransactionStateName"] == null
              ? ""
              : noti[i]["TransactionStateName"],
          transactionStateMoney: noti[i]["TransactionStateMoney"],
          description: noti[i]["Description"]
        );
        ammount++;
        notifications.add(item);
      }
      _sharedPreferences.setInt('notificationsRead', ammount);
      _sharedPreferences.setInt('notificationsNumber', 0);
      return right(KtList.from(notifications));
    } else {
      _sharedPreferences.setInt('notifications', 0);
      _sharedPreferences.setInt('notificationsNumber', 0);
      return left(BaseFailure.fromServer(notiData.data["Message"]));
    }
  }
}
