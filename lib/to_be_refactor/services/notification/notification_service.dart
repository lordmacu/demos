import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/models/generic/response_model.dart';
import 'package:ualet/to_be_refactor/models/notification/email/send_email_request_model.dart';
import 'package:ualet/to_be_refactor/models/notification/otp/send_otp_request_model.dart';
import 'package:ualet/to_be_refactor/models/notification/otp/send_otp_response_model.dart';
import 'package:ualet/to_be_refactor/models/notification/otp/validate_otp_request_model.dart';

@lazySingleton
class NotificationService {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;
  static const SEND_EMAIL_END_POINT = '/User/SendEmailNotification/true';
  static const VALIDATE_EMAIL_END_POINT = '/User/ValidateEmailHasConfirmed';
  static const SEND_OTP_END_POINT = '/Notification/SendTokenOtp';
  static const VALIDATE_OTP_END_POINT = '/Notification/ValidateOtp';

  NotificationService(this._sharedPreferences, this._dio);

  Future<ResponseModel> sendEmail(SendEmailRequestModel request) async {
    try {
      final Response response =
          await _dio.post(SEND_EMAIL_END_POINT, data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> validateEmail(SendEmailRequestModel request) async {
    try {
      final Response response =
          await _dio.post(VALIDATE_EMAIL_END_POINT, data: request.toJson());

      print("esta es la respuesta  ${response.data}");
      final decodedData = ResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel request) async {
    try {
      final Response response =
          await _dio.post(SEND_OTP_END_POINT, data: request.toJson());
      final decodedData = SendOtpResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> validateOtp(ValidateOtpRequestModel request) async {
    try {
      final Response response =
          await _dio.post(VALIDATE_OTP_END_POINT, data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
