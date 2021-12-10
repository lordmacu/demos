import 'dart:convert';

import 'package:ualet/domain/hubs_pot/i_hubs_pot_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

@LazySingleton(as: IHubsPotRepo)
class HubsPotRepo implements IHubsPotRepo {

  final Dio _dio;

  final String apiUrl =
      "/Enrollment/ByFlowEnrollment/";

  HubsPotRepo(this._dio);

  @override
  Future<Either<BaseFailure, bool>> sendData(bool completed) async {

    print("====================================================");
    print("HubsPot SendData");
    print("====================================================");

    try {
      var map = {
        'Completed': completed
      };
      var response = await _dio.post(apiUrl, data: json.encode(map));
      var result = response.data["Result"];

      if (result == true) {
        return right(true);
      } else {
        return left(BaseFailure.fromServer(response.data["Message"]));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
