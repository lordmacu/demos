import 'dart:convert';
import 'dart:math';

import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/faq/faq_item.dart';
import 'package:ualet/domain/faq/i_faq_repository.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IFAQRepository)
class FAQRepository implements IFAQRepository {
  final Dio _dio;
  final _preferenceUser = PreferenceUser();
  final SharedPreferences _sharedPreferences;

  final api = "/Data/GetFaqs";
  FAQRepository(this._dio, this._sharedPreferences);

  @override
  Future<Either<BaseFailure, KtList<FAQItem>>> getFAQItems() async {
    var list = List<FAQItem>();
    FAQItem item;
    String name = '';

    if (_preferenceUser.registerData != '') {
      final decoreDataUser = json.decode(_sharedPreferences.registerData);
      name = decoreDataUser["name"];
    } else {
      if (_sharedPreferences.userData != '') {
        final decoreUserData = json.decode(_sharedPreferences.userData);
        name = name == '' ? decoreUserData["FirstName"] : name;
      }
    }

    var dataProfile = await _dio.get("$api/1");
    var datosProfile = dataProfile.data["Data"];
    datosProfile.forEach((element) {
      item = new FAQItem(
          faq: element["SubQuestions"], type: "Profile", name: name);
      list.add(item);
    });

    var dataPortafolio = await _dio.get("$api/2");
    var datosPortafolio = dataPortafolio.data["Data"];
    datosPortafolio.forEach((element) {
      item = new FAQItem(
          faq: element["SubQuestions"], type: "Portfolio", name: name);
      list.add(item);
    });
    var dataSupport = await _dio.get("$api/3");
    var datosSupport = dataSupport.data["Data"];
    datosSupport.forEach((element) {
      item = new FAQItem(
          faq: element["SubQuestions"], type: "Support", name: name);
      list.add(item);
    });

    var dataAboutUalet = await _dio.get("$api/4");
    var datosAboutUalet = dataAboutUalet.data["Data"];
    datosAboutUalet.forEach((element) {
      item = new FAQItem(
          faq: element["SubQuestions"], type: "AboutUalet", name: name);
      list.add(item);
    });
    var dataFAQ = await _dio.get("$api/5");
    var datosFAQ = dataFAQ.data["Data"];
    datosFAQ.forEach((element) {
      item = new FAQItem(faq: element["SubQuestions"], type: "FAQ", name: name);
      list.add(item);
    });
    var dataGoals = await _dio.get("$api/7");
    var datosGoals = dataGoals.data["Data"];
    datosGoals.forEach((element) {
      item =
          new FAQItem(faq: element["SubQuestions"], type: "Goals", name: name);
      list.add(item);
    });

    return right(KtList.from(list));
  }

  @override
  Future<Either<BaseFailure, ProfilingResult>> getProfile() async {

    Map profileMap = json.decode(_sharedPreferences.getString('profile'));

    String nameLower = profileMap['Name'].toString().toLowerCase();
    var randInt = Random().nextInt(4);
    String imageStr = '$nameLower/$nameLower$randInt.png';
    ProfilingResult profile = ProfilingResult(
      id: profileMap["Id"],
      title: profileMap["Name"],
      subtitle: "Nivel de riesgo ${profileMap["RiskLevel"]}",
      description: profileMap["Description"],
      connectedProfileId: profileMap["ConnectProfileId"].toString(),
      image: imageStr,
    );

    return right(profile);
  }
}
