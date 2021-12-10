import 'dart:convert';

import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/models/index/app_configuration_response_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ualet/to_be_refactor/models/generic/table_model.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';

@lazySingleton
class SplashService {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;

  static const APP_CONFIGURATION_END_POINT = '/App/Configuration';

  SplashService(this._sharedPreferences, this._dio);

  Future<List<TableModel>> getParameterApp() async {
    String _apiEndpoint = getIt<Dio>().options.baseUrl;
    final url = '$_apiEndpoint/User/getParameterApp';
    final response = await http.get(url);
    var res = jsonDecode(response.body)["Data"];
    List<TableModel> lst = List<TableModel>();
    for (var item in res) {
      lst.add(TableModel.fromJson(item));
    }
    return lst;
  }

  Future<String> versionParameterApp() async {
    String _apiEndpoint = getIt<Dio>().options.baseUrl;
    final url = '$_apiEndpoint/User/versionParameterApp';
    final response = await http.get(url);
    String res = "";
    if (response.statusCode == 200) {
      res = jsonDecode(response.body)["Data"];
    }
    return res;
  }

  Future<AppConfigurationResponseModel> appConfiguration() async {
    try {
      final Response response = await _dio.get(APP_CONFIGURATION_END_POINT);
      final decodedData = AppConfigurationResponseModel.fromJson(response.data);

      if (decodedData.data != null) {
        _sharedPreferences.appConfiguration =
            json.encode(decodedData.data.toJson());
      }

      return decodedData;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}
