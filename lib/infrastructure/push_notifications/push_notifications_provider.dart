import 'dart:io';

import 'package:ualet/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(env: [Environments.prod, Environments.prodMx, Environments.prodReplica])
class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseOptions options;
  ///Background Messages Handler
  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  ///Messages Handler
  static Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print("_______________onMessage____________________");
    print(message);
    print("--------------------------------------------");
  }

  ///onLaunch Handler
  static Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("_______________onLaunch_____________________");
    print(message);
    print("--------------------------------------------");
  }

  ///onResume Handler
  static Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("_______________onResume_____________________");
    print(message);
    print("--------------------------------------------");
  }

  initConfig() {
    options = Platform.isIOS
        ? const FirebaseOptions(
        appId: '1:179212340091:ios:0d7e3763d0e975b6',
        apiKey: 'AIzaSyBIvt1v1sBOqRlr5i4PCDWuiDj8YQtshaY',
        databaseURL: 'https://ualet-prod.firebaseio.com',
        messagingSenderId: '179212340091',
        projectId: 'ualet-prod')
        : const FirebaseOptions(
        appId: '1:179212340091:android:5d6f6dfcc8300651',
        apiKey: 'AIzaSyBz2mFMiyFX7pSfDJcP-Ltv6OzqpdotyBw',
        databaseURL: 'https://ualet-prod.firebaseio.com',
        messagingSenderId: '179212340091',
        projectId: 'ualet-prod');

  }

  initNotifications() async {
    initConfig();
    await Firebase.initializeApp(
        name: 'ualet-prod',
        options: options);
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print("_______________FCM Token_____________________");
    print(token);
    print("---------------------------------------------");
    SharedPreferences prefs = getIt<SharedPreferences>();
    prefs.deviceIdToken = token;
    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: Platform.isIOS ? null : PushNotificationsProvider.onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }
}
@Singleton(env: [Environments.dev, Environments.devMx], as: PushNotificationsProvider)
class PushNotificationProviderDev extends PushNotificationsProvider {
  initConfig() {
    options = Platform.isIOS
        ? const FirebaseOptions(
        appId: '1:179212340091:ios:0d7e3763d0e975b6',
        apiKey: 'AIzaSyBIvt1v1sBOqRlr5i4PCDWuiDj8YQtshaY',
        databaseURL: 'https://ualet-prod.firebaseio.com',
        messagingSenderId: '179212340091',
        projectId: 'ualet-prod')
        : const FirebaseOptions(
        appId: '1:179212340091:android:28c6bd63880e1e9c8d8bde',
        apiKey: 'AIzaSyBz2mFMiyFX7pSfDJcP-Ltv6OzqpdotyBw',
        databaseURL: 'https://ualet-prod.firebaseio.com',
        messagingSenderId: '179212340091',
        projectId: 'ualet-prod');
  }
}