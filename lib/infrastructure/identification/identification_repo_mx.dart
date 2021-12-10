import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/identification/i_identification_repository.dart';
import 'package:ualet/domain/investing/user_id_info.dart';
import 'package:ualet/to_be_refactor/models/login/login_response_model.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:intl/intl.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IIdentificationRepository)
class IdentificationRepositoryMx implements IIdentificationRepository {
  final String updateIdentApi = '/User/UpdateIdentification';

  final String logTuIdentidadApi = '/User/LogTuIdentidad';
  final String findUserBlackList = '/User/FindUserBlackList';

  final String getIdTypesApi = '/GenericData/IdentificationType';

  final Dio _dio;
  final SharedPreferences _prefs;
  final String citiesApi =
      '/GenericData/GetCitiesByCountry?countryId=148&search=';

  IdentificationRepositoryMx(this._dio, this._prefs);

  @override
  Future<Either<BaseFailure, bool>> updateIdentificationPost(
      UserIdInfo userIdInfo) async {
    try {
      var map = userIdInfoToJson(userIdInfo);
      var response = await _dio.post(updateIdentApi, data: json.encode(map));
      //On server Error
      if (!response.data['Result'])
        return left(BaseFailure.fromServer(response.data['Message']));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> logTuIdentidad1(String json) async {
    try {
      var data = {
        "type": 0,
        "payloadRequest": "",
        "payloadResponse": json,
      };
      var response = await _dio.post(logTuIdentidadApi, data: data);
      if (!response.data['Result'])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> checkLista(String name, String lastname,String secondLastName) async {
    var data = {
      "name": name,
      "lastName": lastname,
      "secondLastName": secondLastName,
    };

  try {

      var response = await _dio.post(findUserBlackList, data: data);
      if (!response.data['Result'])
        return left(BaseFailure.fromServer(response.data["Message"]));
        if(response.data["Data"]==null){
          return right(true);

        }else{
          return right(false);

        }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> logTuIdentidad2(String json) async {
    try {
      var data = {
        "type": 1,
        "payloadRequest": "",
        "payloadResponse": json,
      };
      var response = await _dio.post(logTuIdentidadApi, data: data);
      if (!response.data['Result'])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  Map userIdInfoToJson(UserIdInfo info) => {
        'FirstName': info.names.split(" ")[0],
        'MiddleName':
            info.names.split(" ").length == 2 ? info.names.split(" ")[1] : '',
        'LastName': info.firstLastname,
        'SecondLastName': info.secondLastname,
        'IdentificationType': info.docType,
        'Identification': info.curp,
        'ExpeditionDate': DateTime.now().toIso8601String(),
        'BirthDate': parseDateToISO(info.birthDate),
        'Gender': info.gender == 'M' ? "2" : "1",
        'CountryId': '148',
        'IdElectoral': info.id, //INE o IFE (Según corresponda)
        "CityState": info.cityState,
      };

  String parseDateToISO(String date) {
    DateFormat format = DateFormat("dd-MM-yyyy");
    return format.parse(date).toIso8601String();
  }

  Future<String> getCityCode(String city) async {
    var response = await _dio.get("$citiesApi$city");
    // print(response.data);

    return "1";
  }

  @override
  Future<Either<BaseFailure, Map<String, String>>> getIdTypes() async {
    try {
      Map<String, String> map = {};
      var response = await _dio.get(getIdTypesApi);
      if (!response.data['Result']) {
        return left(BaseFailure.fromServer(response.data["Message"]));
      }
      for (var datum in response.data['Data']) {
        map[datum['Text']] = datum['Value'];
      }
      return right(map);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
