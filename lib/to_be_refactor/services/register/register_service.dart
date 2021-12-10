import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/to_be_refactor/models/generic/response_model.dart';
import 'package:ualet/to_be_refactor/models/register/create_password_model.dart';
import 'package:ualet/to_be_refactor/models/register/valid_email_model.dart';
import 'package:ualet/to_be_refactor/models/register/valid_phone_number_model.dart';

@lazySingleton
class RegisterService with ChangeNotifier {
  final Dio _dio;

  RegisterService(this._dio);

  static const PHONE_NUMBER_AVAILABLE_END_POINT = '/User/PhoneNumberAvailable';
  static const EMAIL_AVAILABLE_END_POINT = '/User/EmailAvailable';
  static const REGISTER_END_POINT = '/User/Register';
  static const GET_EMAIL_BY_PHONE_NUMBER_END_POINT =
      '/User/GetEmailByPhoneNumber';

  Future<ResponseModel> phoneNumberAvailable(
      ValidPhoneNumberModel request) async {
    try {
      final Response response = await _dio
          .post(PHONE_NUMBER_AVAILABLE_END_POINT, data: request.toJson());

      print("aqui estoy manooooooooo  ${response.data}");
      final decodedData = ResponseModel.fromJson(response.data);
      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> emailAvailable(ValidEmailModel request) async {
    try {
      final Response response =
          await _dio.post(EMAIL_AVAILABLE_END_POINT, data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);
      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseModel> createPassword(CreatePasswordBdModel request) async {
    try {
      final Response response =
          await _dio.post(REGISTER_END_POINT, data: request.toJson());
      final decodedData = ResponseModel.fromJson(response.data);
      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
