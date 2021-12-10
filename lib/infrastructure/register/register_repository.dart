import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/register/i_register_repository.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:package_info/package_info.dart';

@LazySingleton(as: IRegisterRepository)
class RegisterRepository implements IRegisterRepository {
  final Dio _dio;
  final _preferenceUser = PreferenceUser();

  final SharedPreferences _sharedPreferences;

  final apiUser = "/User";

  final apiNotification = "/Notification";
  final apiLocation = '/User/UpdateIdentification';

  RegisterRepository(this._dio, this._sharedPreferences);

  @override
  Future<bool> getEmailAvailable(String email) async {
    var data =
        await _dio.post("$apiUser/EmailAvailable", data: {"Email": email});

    var result = data.data["Result"];
    if (result != false && result != true) {
      return false;
    } else {
      return result;
    }
  }

  @override
  Future<bool> getphoneNumberAvailable(String phoneNumber) async {
    var data = await _dio
        .post("$apiUser/PhoneNumberAvailable", data: {"Phone": phoneNumber});
    var result = data.data["Result"];

    if (result != false && result != true) {
      return false;
    } else {
      return result;
    }
  }

  Future<bool> sendOTP(String phoneNumber, int actionOtpType) async {
    var data = await _dio.post("$apiNotification/SendTokenOtp",
        data: {"To": phoneNumber, "ActionOtpType": actionOtpType});
    if (data.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> sendEmail(
      String email, String phoneNumber, bool privacy, bool medios) async {
    print("aqui estan todos privacy ${privacy} medios ${medios}");
    var data = await _dio.post(
      "$apiUser/SendEmailNotification/true",
      data: {
        "Email": email,
        "PhoneNumber": phoneNumber,
        "Privacy": privacy,
        "Medios": medios
      },
    );
    if (data.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<Either<BaseFailure, bool>> validateEmail(String email) async {
    var data = await _dio.post(
      "$apiUser/ValidateEmailHasConfirmed",
      data: {
        "Email": email,
      },
    );
    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Correo no confirmado"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> validateOTP(String phoneNumber, String otp, int actionOtpType) async {
    var data = await _dio.post(
      "$apiNotification/ValidateOtp",
      data: {
        "To": phoneNumber,
        "Code": otp,
        "ActionOtpType": actionOtpType,
      },
    );

    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Codigo Incorrecto"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> register(
      String name,
      String email,
      String password,
      String phoneNumber,
      bool acceptTerms,
      bool acceptedPrivacy) async {
    PackageInfo packageInfo = getIt<PackageInfo>();

    var splitName = name.split(" ");
    String firstName = splitName[0];
    String middleName = '';
    String lastName = '';
    String secondLastName = '';
    String deviceIdToken = _sharedPreferences.deviceIdToken ?? 'firebase';
    if (deviceIdToken == '') deviceIdToken = 'firebase';
    var data = await _dio.post("$apiUser/Register", data: {
      "Email": email,
      "EmailConfirmed": true,
      "Password": password,
      "PhoneNumber": phoneNumber,
      "PlatformId": Platform.isIOS ? 2 : 1,
      "SecureDevice": "1",
      "CurrentVersionInstall":
          packageInfo.version != null ? packageInfo.version : '2.0',
      "DeviceId": deviceIdToken,
      'FirstName': firstName,
      'MiddleName': middleName,
      'LastName': lastName,
      'SecondLastName': secondLastName,
      'AcceptTerms': acceptTerms,
      'AcceptedPrivacy': acceptedPrivacy,
    });

    var result = data.data["Result"];
    if (result == true) {
      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "acceptTerms": acceptTerms
      };
      _preferenceUser.registerData = json.encode(userData);

      _sharedPreferences.userName = firstName;

      return right(true);
    } else {
      return left(BaseFailure.fromServer(data.data["Message"]));
    }
  }

  Future<String> getEmailByPhoneNumber(String phoneNumber) async {
    var data = await _dio
        .post("$apiUser/GetEmailByPhoneNumber", data: {"Phone": phoneNumber});
    var datos = data.data["Data"];

    if (datos != null) {
      return datos["Email"];
    } else {
      return "";
    }
  }

  Future<Either<BaseFailure, bool>> changePassword(
      String email, String newPassword, String confirmPassword) async {
    var data = await _dio.post("$apiUser/SetNewPassword", data: {
      "Email": email,
      "NewPassword": newPassword,
      "ConfirmPassword": confirmPassword
    });
    var result = data.data["Result"];

    if (result != true) {
      return left(BaseFailure.fromServer("${data.data["Message"]}"));
    } else {
      return right(true);
    }
  }

  @override
  Future<Either<BaseFailure, bool>> updateLocation() async {
    try {
      var lat = _sharedPreferences.lat;
      var lon = _sharedPreferences.lon;

      print("UPDATE LOCATION");
      print("Lat: $lat");
      print("Lon: $lon");

      Map m = {
        'FirstName': '',
        'MiddleName': '',
        'LastName': '',
        'SecondLastName': '',
        'ExpeditionPlaceId': 0,
        'BirthPlaceId': 0,
        'IdentificationType': '15',
        'Identification': '0',
        'ExpeditionDate': DateTime.now().toIso8601String(),
        'BirthDate': '',
        'Gender': '0',
        'CountryId': '0',
        'longitude': lon,
        'latitude': lat,
      };
      var response = await _dio.post(apiLocation, data: json.encode(m));

      if (!response.data['Result'])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<String> getIP() async {
    try {
      const url = 'https://api.ipify.org';
      var response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.statusCode);
        print(response.data);
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }
}
