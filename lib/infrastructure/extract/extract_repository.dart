import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/extract/Extract_item.dart';
import 'package:ualet/domain/extract/i_extract_repository.dart';

@LazySingleton(as: IExtractsRepository)
class ExtractsRepository implements IExtractsRepository {
  final Dio _dio;
  static const EXTRACTS_END_POINT = "/financialStatement/AvailableStatements";
  static const EXTRACTS_REQUEST_END_POINT = "/financialstatement/generate/user";
  static const CERTIFICATIONS_REQUEST_END_POINT =
      "/Certification/generate/user";
  static const CERTIFICATION_END_POINT =
      "/Certification/AvailableCertifications";

  ExtractsRepository(this._dio);

  @override
  Future<Either<BaseFailure, KtList<ExtractItem>>> getExtracts() async {
    try {
      var response = await _dio.get(EXTRACTS_END_POINT);
      var list = List<ExtractItem>();
      for (Map item in response.data["Data"]) {
        ExtractItem obj = ExtractItem(
          month: item["Month"],
          monthName: item["MonthName"],
          year: item["Year"],
          order: item["Order"],
          generated: item["Generated"],
        );
        list.add(obj);
      }
      list.sort((a, b) => a.order.compareTo(b.order));
      return right(KtList.from(list));
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, KtList<ExtractItem>>> getCertifications() async {
    try {
      var response = await _dio.get(CERTIFICATION_END_POINT);
      print(response);
      var list = List<ExtractItem>();
      if (response.data["Result"]) {
        for (Map item in response.data["Data"]) {
          print(item);
          ExtractItem obj = ExtractItem(
            month: 0,
            monthName: '',
            year: item["Year"],
            order: item["Order"],
            generated: false,
          );
          list.add(obj);
        }
        list.sort((a, b) => a.order.compareTo(b.order));
        return right(KtList.from(list));
      } else {
        return left(response.data["Message"]);
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Stream<Either<BaseFailure, String>> requestCertifications(
      String year, String month) async* {
    try {
      var map = {"Year": year, "Month": month};
      // var s=json.encode("'Year': '$year', Month: '$month'");
      var response = await _dio.post(CERTIFICATIONS_REQUEST_END_POINT,
          data: json.encode(map));

      bool result = response.data['Result'];
      if (!result) {
        yield left(BaseFailure.fromServer(response.data['Message']));
      } else {
        yield right(response.data['Message']);
      }
    } catch (e) {
      yield left(BaseFailure.unexpected());
    }
  }

  @override
  Stream<Either<BaseFailure, String>> requestExtracts(
      String year, String month) async* {
    try {
      var map = {"Year": year, "Month": month};
      // var s=json.encode("'Year': '$year', Month: '$month'");
      var response =
          await _dio.post(EXTRACTS_REQUEST_END_POINT, data: json.encode(map));

      bool result = response.data['Result'];
      if (!result) {
        yield left(BaseFailure.fromServer(response.data['Message']));
      } else {
        yield right(response.data['Message']);
      }
    } catch (e) {
      yield left(BaseFailure.unexpected());
    }
  }
}
