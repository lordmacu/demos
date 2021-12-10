import 'dart:io';

import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/push_notifications/push_notifications_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environments.devMx).then((_) => runApp(MyApp()));


  print("Current api: ${getIt<Dio>().options.baseUrl}");

  final preferenceUser = PreferenceUser();
  preferenceUser.init();
  final notificationProvider = getIt<PushNotificationsProvider>();
  notificationProvider.initNotifications();

  final Map optionsAppflayer = {
    "afDevKey": "i8DhwN5X67Xj73tXq8y9wY",
    "afAppId": Platform.isIOS ? "1266764142" : "",
    "isDebug": false
  };
  await getIt<IAppsFlyerEventLogger>().initConfig(optionsAppflayer);
}
