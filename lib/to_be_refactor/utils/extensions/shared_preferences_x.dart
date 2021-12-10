import 'dart:convert';

import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';

extension SharedPreferenceX on SharedPreferences {
  get token {
    return getString('token') ?? '';
  }

  set token(String value) {
    setString('token', value);
  }

  get ineOrIfeType {
    return getString('ineOrIfeType') ?? '';
  }

  set ineOrIfeType(String value) {
    setString('ineOrIfeType', value);
  }

  get ineOrIfeNumber {
    return getString('ineOrIfeNumber') ?? '';
  }

  set ineOrIfeNumber(String value) {
    setString('ineOrIfeNumber', value);
  }

  get registerData {
    return getString('registerData') ?? '';
  }

  set registerData(String value) {
    setString('registerData', value);
  }


  set setCheck1(bool value) {
    setBool('setCheck1', value);
  }


  set setCheckCreationAccount(bool value) {
    setBool('setCheckCreationAccount', value);
  }





  set setCheck2(bool value) {
    setBool('setCheck2', value);
  }


  set setCheck3(bool value) {
    setBool('setCheck3', value);
  }


  set setCheck4(bool value) {
    setBool('setCheck4', value);
  }


  set validPopUpInvestingSuccess(bool validPopUpInvestingSuccess) {
    setBool("validPopUpInvestingSuccess", validPopUpInvestingSuccess);
  }

  get validPopUpInvestingSuccess {
    return getBool('validPopUpInvestingSuccess') == null
        ? false
        : getBool('validPopUpInvestingSuccess');
  }

  set validPopUpUpdateSarlaft(bool validPopUpUpdateSarlaft) {
    setBool("validPopUpUpdateSarlaft", validPopUpUpdateSarlaft);
  }

  get validPopUpUpdateSarlaft {
    return getBool('validPopUpUpdateSarlaft') == null ? false : getBool('validPopUpUpdateSarlaft');
  }

   set validSendSoftEnrollment(bool validSendSoftEnrollment) {
    setBool("validSendSoftEnrollment", validSendSoftEnrollment);
  }

  get validSendSoftEnrollment {
    return getBool('validSendSoftEnrollment') == null ? false : getBool('validSendSoftEnrollment');
  }

  set validMigrateShowButtonDeleteGoal(bool validMigrateShowButtonDeleteGoal) {
    setBool(
        "validMigrateShowButtonDeleteGoal", validMigrateShowButtonDeleteGoal);
  }

  get validMigrateShowButtonDeleteGoal {
    return getBool('validMigrateShowButtonDeleteGoal') == null
        ? false
        : getBool('validMigrateShowButtonDeleteGoal');
  }

  get appConfiguration {
    return getString('appConfiguration') ?? '';
  }

  get getCheckCreationAccount {
    return getBool('getCheckCreationAccount');
  }

  set appConfiguration(String value) {
    setString('appConfiguration', value);
  }

  get versionParameter {
    return getString('versionParameter') ?? '0';
  }

  set versionParameter(String value) {
    setString('versionParameter', value);
  }

  get userData {
    return getString('userData') ?? '';
  }

  get appConfigurationData {
    return getString('appConfigurationData') ?? '';
  }

  set appConfigurationData(String appConfigurationDataJson) {
    setString('appConfigurationData', appConfigurationDataJson);
  }



  get getCheck1 {
    return getBool('setCheck1') ?? false;
  }
  get getCheck2 {
    return getBool('setCheck2') ?? false;
  }
  get getCheck3 {
    return getBool('setCheck3') ?? false;
  }
  get getCheck4 {
    return getBool('setCheck4') ?? false;
  }


  set userData(String userDataJson) {
    setString('userData', userDataJson);
  }

  get userProfile {
    return getString('userProfile') ?? '';
  }

  set userProfile(String profile) {
    setString('userProfile', profile);
  }

  set userName(String name) {
    setString('userName', name);
  }

  get userName {
    return getString('userName') ?? '';
  }

  // get userLevel {
  //   return getInt('userLevel') ?? -1;
  // }

  // set userLevel(int userLevel) {
  //   setInt('userLevel', userLevel);
  // }

  get profile {
    return getString('profile') ?? "";
  }

  set profile(String profile) {
    setString('profile', profile);
  }

  set currentInvestingGoal(DashboardGoal goal) {
    Map a = {
      'id': goal.id,
      'name': goal.name,
      'goalAmt': goal.goalAmt,
      'currentAmt': goal.currentAmt,
      'emoji': goal.emoji,
      'tieneDomiciliacionprogramada': goal.tieneDomiciliacionprogramada,
      'fee': goal.fee,
      'periodicity': goal.periodicity,
      'numMonths': goal.numMonths,
      'created': goal.created.toIso8601String(),
    };
    setString('currentInvestingGoal', json.encode(a));
  }

  get currentInvestingGoal {
    Map map = json.decode(getString('currentInvestingGoal')) ?? {};
    if (map.isNotEmpty) {
      return DashboardGoal(
        migrate: false,
        created: DateTime.parse(map['created']),
        currentAmt: map['currentAmt'],
        emoji: map['emoji'],
        tieneDomiciliacionprogramada: map['tieneDomiciliacionprogramada'],
        fee: map['fee'],
        periodicity: map['periodicity'],
        goalAmt: map['goalAmt'],
        id: map['id'],
        name: map['name'],
        numMonths: map['numMonths'],
      );
    } else {
      return null;
    }
  }

  set currentInvestingAccount(BankAccountItem account) {
    if (account == null) return;
    Map a = {
      'accountBank': account.accountBank,
      'accountImg': account.accountImg,
      'accountType': account.accountType,
      'number': account.number,
      'bankId': account.bankId,
      'id': account.id,
      'typeId': account.typeId
    };

    setString('currentInvestingAccount', json.encode(a));
  }

  get currentInvestingAccount {
    try {
      Map map = json.decode(getString('currentInvestingAccount'));
      if (map != null && map.isNotEmpty) {
        return BankAccountItem(
            number: map['number'],
            accountType: map['accountType'],
            accountBank: map['accountBank'],
            accountImg: map['accountImg'],
            id: map['id'],
            typeId: map['typeId'],
            bankId: map['bankId']);
      } else
        return BankAccountItem.empty();
    } catch (e) {
      return BankAccountItem.empty();
    }
  }

  set deviceIdToken(String token) {
    setString('deviceIdToken', token);
  }

  get deviceIdToken {
    return getString('deviceIdToken') ?? '';
  }

  get balance {
    return getDouble('balance');
  }

  set balance(double balance) {
    setDouble('balance', balance);
  }

  get isValidUserUpdateSarlaft {
    return getBool('isValidUserUpdateSarlaft');
  }

  set isValidUserUpdateSarlaft(bool isValidUserUpdateSarlaft) {
    setBool('isValidUserUpdateSarlaft', isValidUserUpdateSarlaft);
  }

  set userInfoRegistraduria(UserInfoRegistraduria info) {
    Map map = {
      'idType': info.idType,
      'firstName': info.firstName,
      'secondName': info.secondName,
      'surname': info.surname,
      'secondSurname': info.secondSurname,
      'id': info.id,
      'birthDate': info.birthDate.toIso8601String(),
      'countryId': info.countryId,
      'regionId': info.regionId,
      'expeditionDate': info.expeditionDate.toIso8601String(),
      'expeditionRegionId': info.expeditionRegionId,
      'genderId': info.genderId,
    };
    print("SET USER INFO REG");
    print(map);
    setString("usrRegInfo", json.encode(map));
  }

  get userInfoRegistraduria {
    try {
      Map map = json.decode(getString("usrRegInfo"));
      if (map != null && map.isNotEmpty) {
        return UserInfoRegistraduria(
          idType: map['idType'],
          firstName: map['firstName'],
          secondName: map['secondName'],
          surname: map['surname'],
          secondSurname: map['secondSurname'],
          id: map['id'],
          birthDate: DateTime.parse(map['birthDate']),
          countryId: map['countryId'],
          regionId: map['regionId'],
          expeditionDate: DateTime.parse(map['expeditionDate']),
          expeditionRegionId: map['expeditionRegionId'],
          genderId: map['genderId'],
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  set regCountries(List<String> countries) {
    setString("regCountries", json.encode(countries));
  }

  get regCountries {
    try {
      return json.decode(getString("regCountries"));
    } catch (e) {
      return null;
    }
  }

  set isMigrating(bool isMigrating) {
    setBool("isMigrating", isMigrating);
  }

  get isMigrating {
    return getBool('isMigrating') == null ? false : getBool('isMigrating');
  }

  set lat(String lat) {
    setString("lat", lat);
  }

  get lat {
    return getString('lat');
  }

  set lon(String lon) {
    setString("lon", lon);
  }

  get lon {
    return getString('lon');
  }

  set vidIdFace(String pVidIdFace) {
    setString('vidIdFace', pVidIdFace);
  }

  get vidIdFace {
    var s = getString('vidIdFace');
    return s == null ? '' : s;
  }

  set vidIdINEIFE(String pVidIdINEIFE) {
    setString('vidIdINEIFE', pVidIdINEIFE);
  }

  get vidIdINEIFE {
    var s = getString('vidIdINEIFE');
    return s == null ? '' : s;
  }
}
