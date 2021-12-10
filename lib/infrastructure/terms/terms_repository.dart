import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/terms/i_terms_repository.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

@LazySingleton(as: ITermsRepository)
class TermsRepository implements ITermsRepository {
  final Dio _dio;

  final api = "/Data/GetFaqs/6";
  TermsRepository(this._dio);
  @override
  Stream<Either<BaseFailure, String>> getTerms() async* {
    var data = await _dio.get("$api");
    String datos =  "";

    for (final jsonString in data.data["Data"][0]["SubQuestions"]) {
      datos += jsonString["ContentDetail"];
    }
     
    yield right(datos);
  }
}
