import 'dart:io';

import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@module
abstract class CoreInjectableModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @LazySingleton(env: [Environments.prod])
  Dio get dio {
    var _dio = Dio(BaseOptions(
        baseUrl: 'https://ualetapiprod2.azurewebsites.net',
        contentType: 'application/json',
        headers: {'Authorization': ''}))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addEntries({
          'Authorization': "Bearer ${getIt<SharedPreferences>().token}"
        }.entries);
        print(options.headers);
        return options; //continue
      }, onError: (DioError e) async {
        if (e.response?.statusCode == 401) {
          getIt<SharedPreferences>().token = null;
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.closeSessionPage,
          );
        }
        return e; //continue
      }))
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true));

    return _dio;
  }

  @LazySingleton(env: [Environments.prodReplica])
  Dio get dioReplica {
    var _dio = Dio(BaseOptions(
        baseUrl: 'https://ualetpcn.azurewebsites.net',
        contentType: 'application/json',
        headers: {'Authorization': ''}))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addEntries({
          'Authorization': "Bearer ${getIt<SharedPreferences>().token}"
        }.entries);
        print(options.headers);
        return options; //continue
      }, onError: (DioError e) async {
        if (e.response?.statusCode == 401) {
          getIt<SharedPreferences>().token = null;
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.closeSessionPage,
          );
        }
        return e; //continue
      }))
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true));

    return _dio;
  }

  @LazySingleton(env: [Environments.dev])
  Dio get dioDev {
    var _dio = Dio(BaseOptions(
        // baseUrl: 'https://apiualetqa.azurewebsites.net',
        baseUrl: 'https://ualetapiprod2-preprod.azurewebsites.net',
        contentType: 'application/json',
        headers: {'Authorization': ''}))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addEntries({
          'Authorization': "Bearer ${getIt<SharedPreferences>().token}"
        }.entries);
        print(options.headers);
        return options; //continue
      }, onError: (DioError e) async {
        if (e.response?.statusCode == 401) {
          getIt<SharedPreferences>().token = null;
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.closeSessionPage,
          );
        }
        return e; //continue
      }))
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true));

    return _dio;
  }

  @LazySingleton(env: [Environments.devMx])
  Dio get dioDevMx {
    var _dio = Dio(BaseOptions(
        baseUrl: 'https://apimexico.azurewebsites.net',
        contentType: 'application/json',
        headers: {'Authorization': ''}))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addEntries({
          'Authorization': "Bearer ${getIt<SharedPreferences>().token}"
        }.entries);
        print(options.headers);
        return options; //continue
      }, onError: (DioError e) async {
        if (e.response?.statusCode == 401) {
          getIt<SharedPreferences>().token = null;
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.closeSessionPage,
          );
        }
        return e; //continue
      }))
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true));

    return _dio;
  }

  @LazySingleton(env: [Environments.prodMx])
  Dio get dioPrevMx {
    var _dio = Dio(BaseOptions(
        baseUrl: 'https://apimexico.azurewebsites.net',
        contentType: 'application/json',
        headers: {'Authorization': ''}))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers.addEntries({
          'Authorization': "Bearer ${getIt<SharedPreferences>().token}"
        }.entries);
        print(options.headers);
        return options; //continue
      }, onError: (DioError e) async {
        if (e.response?.statusCode == 401) {
          getIt<SharedPreferences>().token = null;
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.closeSessionPage,
          );
        }
        return e; //continue
      }))
      ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true));

    return _dio;
  }

  @Named("TuIdentidadApiKey")
  String get tuIdentidadApiKey => "51B!yRQu";
}
