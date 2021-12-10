import 'dart:convert';

import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/models/login/current_version_install/current_version_request_model.dart';
import 'package:ualet/to_be_refactor/models/login/user_migration/validate_intro_migrate_response_model.dart';
import 'package:ualet/to_be_refactor/models/login/user_migration/validate_migrate_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/models/generic/response_model.dart';
import 'package:ualet/to_be_refactor/models/login/login_request_model.dart';
import 'package:ualet/to_be_refactor/models/login/login_response_model.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/email_by_phonenumber_request_model.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/email_by_phonenumber_response_model.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/new_password_request_model.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/recover_password_request_model.dart';
import 'package:ualet/to_be_refactor/models/login/recover_password/recover_password_responde_model.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/facebook/facebook_event_logger.dart';
import 'package:package_info/package_info.dart';
import 'package:huawei_push/push.dart';

@lazySingleton
class LoginService {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;
  // static const LOGIN_END_POINT = '/User/LoginDirect';
  static const LOGIN_END_POINT = '/User/Login2_0';
  static const GET_PHONE_NUMBER_BY_EMAIL_END_POINT =
      '/User/GetPhoneNumberByEmail';
  static const SET_NEW_PASSWORD_END_POINT = '/User/SetNewPassword';
  static const GET_EMAIL_BY_PHONE_NUMBER_END_POINT =
      '/User/GetEmailByPhoneNumber';
  static const VALIDATE_MIGRATION_END_POINT = '/User/validateUserMigrate';
  static const VALIDATE_INTRO_MIGRATION_END_POINT =
      '/User/ValidateIntroductoryMigrate';
  static const UPDATE_CURRENT_VERSION_INSTALL =
      '/User/UpdateCurrentVersionInstall';
  static const VERIFY_USER_UPDATE_SARLAFT =
      '/Enrollment/VerifyUserUpdateSarlaft';

  LoginService(this._sharedPreferences, this._dio);
  

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {

      String deviceIdString = '';

      //Es Huawei
      if(request.deviceId != 'firebase') {
        deviceIdString = request.deviceId;
      } else {
        //Obtener el device id de firebase
        if(_sharedPreferences.deviceIdToken != 'firebase') {
          deviceIdString = _sharedPreferences.deviceIdToken;
        } else {
          deviceIdString = 'firebase';
        }
      }

      final req = LoginRequestModel(
          deviceId: deviceIdString,
          password: request.password,
          platformId: request.platformId,
          userName: request.userName,
          model: request.model,
          machine: request.machine);

      final Response response =
          await _dio.post(LOGIN_END_POINT, data: req.toJson());

      final decodedData = LoginResponseModel.fromJson(response.data);

      if (decodedData.data != null) {
        _sharedPreferences.token = decodedData
            .data.token; // Almacenar Token  en preferencias de usuario.

        _sharedPreferences.userData = json.encode(
            decodedData.data.user.toJson()); //Almacenar la info del usuario

        //Firebase 1
        // await getIt<IFirebaseEventLoggerMX>().singIn();

        //Appsflyer 1
        await getIt<IAppsFlyerEventLogger>().logEvent(AFEvents.LOGIN, {});
        await getIt<IAppsFlyerEventLogger>()
            .setUserId(decodedData.data.user.id);

        //Firebase Sets user id
        // await getIt<IFirebaseEventLoggerMX>()
        //     .setUserId(decodedData.data.user.id);

        //Facebook Event 1
        await getIt<IFacebookEventLogger>().singIn();

        _sharedPreferences.validSendSoftEnrollment = false;
        //_sharedPreferences.userLevel = decodedData.data.user.customerLevel;
        _sharedPreferences.profile = json.encode(
            decodedData.data.user.userProfile.length > 0
                ? decodedData.data.user.userProfile[0]["Profile"]
                : "");

        PackageInfo packageInfo = getIt<PackageInfo>();
        CurrentVersionInstallRequestModel requestCurrentVersion =
            CurrentVersionInstallRequestModel()
              ..currentVersionInstall =
                  packageInfo.version != null ? packageInfo.version : '2.0';
        final Response responseCurrentVersion = await _dio.post(
            UPDATE_CURRENT_VERSION_INSTALL,
            data: requestCurrentVersion.toJson());
      }

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> updateCurrentVersionInstall(
      CurrentVersionInstallRequestModel request) async {
    try {
      final Response response = await _dio.post(UPDATE_CURRENT_VERSION_INSTALL,
          data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ValidateMigrateResponseModel> validateUserMigrate() async {
    try {
      final Response response = await _dio.get(VALIDATE_MIGRATION_END_POINT);
      final decodedData = ValidateMigrateResponseModel.fromJson(response.data);
      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ValidateIntroMigrateResponseModel> validateIntroMigrate() async {
    try {
      final Response response =
          await _dio.get(VALIDATE_INTRO_MIGRATION_END_POINT);
      final decodedData =
          ValidateIntroMigrateResponseModel.fromJson(response.data);
      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<RecoverPasswordResponseModel> phoneNumberByEmail(
      RecoverPasswordRequestModel request) async {
    try {
      final Response response = await _dio
          .post(GET_PHONE_NUMBER_BY_EMAIL_END_POINT, data: request.toJson());
      final decodedData = RecoverPasswordResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> newPassword(NewPasswordRequestModel request) async {
    try {
      final Response response =
          await _dio.post(SET_NEW_PASSWORD_END_POINT, data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<EmailByPhoneResponseModel> emailByPhoneNumber(
      EmailByPhoneRequestModel request) async {
    try {
      final Response response = await _dio
          .post(GET_EMAIL_BY_PHONE_NUMBER_END_POINT, data: request.toJson());
      final decodedData = EmailByPhoneResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

}
