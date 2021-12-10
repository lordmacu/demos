import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/to_be_refactor/models/extracts/extract_model.dart';

@lazySingleton
class ExtractsService {
  final Dio _dio;
  static const EXTRACTS_END_POINT = "/financialStatement/AvailableStatements";
  
  ExtractsService(this._dio);

  Future<ExtractModel> getExtracts() async {
    try {
      final Response response = await _dio.get(EXTRACTS_END_POINT);
      final decodeData = ExtractModel.fromJson(response.data);
      return decodeData;
    } on DioError catch (e) {
      return e.error;
    }
  }

}