import 'dart:convert';

import 'package:ualet/domain/sarlaft/pep_family_member.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:ualet/domain/sarlaft/pay_taxes_not_colombia_item.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/i_account_repository.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  final Dio _dio;
  final SharedPreferences _preferenceUser;

  final api = "/Enrollment";
  final apiUser = "/User";
  final apiNotification = "/Notification";
  final apiBalance = "/User/GetBalance";

  AccountRepository(this._dio, this._preferenceUser);

  Stream<Either<BaseFailure, UserInfo>> getUserInfo() async* {
    String name = '';
    String email = '';
    String phoneNumber = '';
    String firstName = '';
    String fullName = '';
    SarlaftItem sarlaftItem = SarlaftItem.empty();

    if (_preferenceUser.registerData != '') {
      final decoreDataUser = json.decode(_preferenceUser.registerData);
      name = decoreDataUser["name"];
    }

    var dataUser = await _dio.get("$api/ConsultUser");

    if (_preferenceUser.userData != '') {
      final decoreUserData = json.decode(_preferenceUser.userData);

      email = decoreUserData["Email"];
      phoneNumber = decoreUserData["PhoneNumber"];
      firstName = decoreUserData["FirstName"];
      name = name == '' ? decoreUserData["FirstName"] : name;
      fullName = decoreUserData["FullName"];
    }

    bool hasSarlaft = false;
    try {
      sarlaftItem = dataUser.data != null
          ? jsonToSarlaftItem(dataUser.data['Data'])
          : sarlaftItem;
      hasSarlaft = true;
    } catch (e) {
      print("EEEERROR cargando datos sarlaft");
    }

    //Balance User
    double dataBalance = await getBalance();

    UserInfo info = new UserInfo(
        fullName: fullName == '' ? name : fullName,
        firstName: firstName,
        email: email,
        phoneNumber: phoneNumber,
        sarlaftItem: sarlaftItem,
        hasSarlaft: hasSarlaft,
        balance: dataBalance);

    yield right(info);
  }

  Future<double> getBalance() async {
    double balance = 0.0;
    var balanceRest = await _dio.get(apiBalance);
    bool balanceDownloaded = balanceRest.data["Result"];

    if (balanceDownloaded) {
      balance = balanceRest.data["Data"]["TotalBalanceAccount"];
    }
    return balance;
  }

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

  Future<bool> confirmIdentification(String email) async {
    var data =
        await _dio.post("$apiUser/EmailAvailable", data: {"Email": email});
    var result = data.data["Result"];

    if (result != false && result != true) {
      return false;
    } else {
      return result;
    }
  }

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

  Future<bool> updatePhoneNumber(String phoneNumber) async {
    var data = await _dio
        .post("$apiUser/PhoneNumberUpdate", data: {"Phone": phoneNumber});
    var result = data.data["Result"];
    return result;
  }

  @override
  Future<bool> sendEmail(String email, String phoneNumber) async {
    var data = await _dio.post("$apiUser/SendEmailNotification/true", data: {
      "Email": email,
      "PhoneNumber": phoneNumber,
    });
    if (data.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<BaseFailure, bool>> sendOTP(String phoneNumber) async {
    var data = await _dio.post("$apiNotification/SendTokenOtp",
        data: {"To": phoneNumber, "ActionOtpType": 2});
    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Error al enviar el OTP"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> validateEmail(String email) async {
    var data = await _dio.post("$apiUser/ValidateEmailHasConfirmed", data: {
      "Email": email,
    });
    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Correo no confirmado"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> validateOTP(
      String phoneNumber, String otp) async {
    var data = await _dio.post("$apiNotification/ValidateOtp",
        data: {"To": phoneNumber, "Code": otp, "ActionOtpType": 2});

    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Código Incorrecto"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> changeEmail(String email) async {
    var data = await _dio.post("$api/UpdateUser", data: {"Email": email});

    var result = data.data["Result"];

    if (result == true) {
      final decoreUserData = json.decode(_preferenceUser.userData);
      decoreUserData["Email"] = email;
      _preferenceUser.userData = json.encode(decoreUserData);
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Error en servidor"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> changePassword(
      String password, String newPassword, String confirmPassword) async {
    var data = await _dio.post("$apiUser/ChangePassword", data: {
      "OldPassword": password,
      "NewPassword": newPassword,
      "ConfirmPassword": confirmPassword
    });

    var result = data.data["Result"];
    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Contraseña incorrecta"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> changePhoneNumber(
      String phoneNumber) async {
    var data =
        await _dio.post("$api/UpdateUser", data: {"PhoneNumber": phoneNumber});
    var result = data.data["Result"];

    if (result == true) {
      final decoreUserData = json.decode(_preferenceUser.userData);
      decoreUserData["PhoneNumber"] = phoneNumber;
      _preferenceUser.userData = json.encode(decoreUserData);
      return right(true);
    } else {
      return left(BaseFailure.fromServer(data.statusMessage));
    }
  }

  SarlaftItem jsonToSarlaftItem(dynamic data) {
    List<PepFamilyMember> pepList = [];
    for (var pep in data['PepList']) {
      print("este es el resultado del pep  ${pep}");
      pepList.add(PepFamilyMember(
        name: pep["Name"],
        lastNames: pep['LastNames'],
        identification: pep['Identification'],
        position: pep['Position'],
        identificationType: pep['IdentificationType'],
        pepType: pep['PepType'],
      ));
    }
    List<PayTaxesNotColombiaItem> txs = [];
    for (var tx in data['PayTaxesNotColombiaModel']) {
      txs.add(PayTaxesNotColombiaItem(
        countryId: tx['CountryId'],
        countryName: tx['CountryName'],
        identification: tx['Identification'],
        name: tx['Name'],
      ));
    }
    return SarlaftItem(
      address: data['Address'],
      cityResidenceId: data['CityResidenceId'],
      opccupationId: data['OccupationId'].toString(),
      ciiuCode: data['CiiuCode'],
      cityWorkId: data['CityWorkId'],
      workPlaceName: data['WorkPlaceName'],
      workAddress: data['WorkAddress'],
      workPhone: data['WorkPhone'],
      foundsOrigin: data['FoundsOrigin'],
      monthlyIncome: data['MonthlyIncome'],
      monthlyOutcome: data['MonthlyOutcome'],
      otherIncome: data['OthersIncome'],
      totalAssets: data['TotalAssets'],
      totalLiability: data['TotalLiabilities'],
      managesPublicResources: data['ManagesPublicResources'],
      isPep: data['IsPep'],
      hasPepRelationships: data['HasPepRelationships'],
      pepList: pepList,
      manageForeignCurrency: data['ManageForeignCurrency'],
      productForeignCurrencyList: [],
      ifPayTaxesNotColombia: data['IfPayTaxesNotColombia'],
      payTaxesNotColombiaModel: txs,
      receivePaymentsUs: data['ReceivePaymentsUs'],
      receiveIncomePropertyUs: data['ReceiveIncomePropertyUs'],
      permanencyInUs: data['PermanencyInUs'],
      citizenResidentUs: data['CitizenResidentUs'],
      itsGreenCard: data['ItsGreenCard'],
    );
  }
}
