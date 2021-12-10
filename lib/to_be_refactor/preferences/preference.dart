import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUser {
  static final PreferenceUser _instance = PreferenceUser._internal();

  factory PreferenceUser() {
    return _instance;
  }

  PreferenceUser._internal();
  SharedPreferences _preference;

  set activeRouteParams(Object activeRouteParams) {
    if (activeRouteParams == null) {
      _preference.getKeys().contains('activeRouteParams');
      _preference.remove('activeRouteParams');
      return;
    }
    var json;
    try {
      json = jsonEncode(activeRouteParams);
    } catch (e) {
      json = null;
    }

    _preference.setString('activeRouteParams', json);
  }

  set activeRoute(String activeRoute) {
    if (null == activeRoute) {
      _preference.getKeys().contains('activeRoute');
      _preference.remove('activeRoute');
      return;
    }
    _preference.setString('activeRoute', activeRoute);
  }

  get activeRouteParams {
    var keys = _preference.getKeys();
    if (!keys.contains('activeRouteParams')) return null;
    var result = _preference.getString('activeRouteParams');
    return jsonDecode(result);
  }

  get activeRoute {
    var keys = _preference.getKeys();
    if (!keys.contains('activeRoute')) return null;
    return _preference.getString('activeRoute');
  }

  init() async {
    this._preference = await SharedPreferences.getInstance();
  }

  get token {
    return _preference.getString('token') ?? '';
  }

  set token(String value) {
    _preference.setString('token', value);
  }

  get ineOrIfeType {
    return _preference.getString('ineOrIfeType') ?? '';
  }

  set ineOrIfeType(String value) {
    _preference.setString('ineOrIfeType', value);
  }

  get ineOrIfeNumber {
    return _preference.getString('ineOrIfeNumber') ?? '';
  }

  set ineOrIfeNumber(String value) {
    _preference.setString('ineOrIfeNumber', value);
  }

  get validPopUpInvestingSuccess {
    return _preference.getBool('validPopUpInvestingSuccess') == null
        ? false
        : _preference.getBool('validPopUpInvestingSuccess');
  }

  set validPopUpInvestingSuccess(bool validPopUpInvestingSuccess) {
    _preference.setBool(
        "validPopUpInvestingSuccess", validPopUpInvestingSuccess);
  }

  get validPopUpUpdateSarlaft {
    return _preference.getBool('validPopUpUpdateSarlaft') == null ? false : _preference.getBool('validPopUpUpdateSarlaft');
  }

  set validPopUpUpdateSarlaft(bool validPopUpUpdateSarlaft) {
    _preference.setBool("validPopUpUpdateSarlaft", validPopUpUpdateSarlaft);
  }

  get validSendSoftEnrollment {
    return _preference.getBool('validSendSoftEnrollment') == null ? false : _preference.getBool('validSendSoftEnrollment');
  }

  set validSendSoftEnrollment(bool validSendSoftEnrollment) {
    _preference.setBool("validSendSoftEnrollment", validSendSoftEnrollment);
  }
  

  get validMigrateShowButtonDeleteGoal {
    return _preference.getBool('validMigrateShowButtonDeleteGoal') == null
        ? false
        : _preference.getBool('validMigrateShowButtonDeleteGoal');
  }

  set validMigrateShowButtonDeleteGoal(bool validMigrateShowButtonDeleteGoal) {
    _preference.setBool(
        "validMigrateShowButtonDeleteGoal", validMigrateShowButtonDeleteGoal);
  }

  get registerData {
    return _preference.getString('registerData') ?? '';
  }

  get validDocumentTuIdentidad {
    return _preference.getString('validDocumentTuIdentidad') ?? '';
  }

  set registerData(String value) {
    _preference.setString('registerData', value);
  }

  get appConfiguration {
    return _preference.getString('appConfiguration') ?? '';
  }

  set appConfiguration(String value) {
    _preference.setString('appConfiguration', value);
  }

  set validDocumentTuIdentidad(String value) {
    _preference.setString('validDocumentTuIdentidad', value);
  }

  get versionParameter {
    return _preference.getString('versionParameter') ?? '0';
  }

  set versionParameter(String value) {
    _preference.setString('versionParameter', value);
  }
}
