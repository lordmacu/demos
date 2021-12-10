

import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/investing/user_id_info.dart';

abstract class IIdentificationRepository {
  Future<Either<BaseFailure, bool>> updateIdentificationPost(UserIdInfo userIdInfo);
  Future<Either<BaseFailure, bool>> logTuIdentidad1(String response);
  Future<Either<BaseFailure, bool>> checkLista(String name, String lastname,String secondLastName);
  Future<Either<BaseFailure, bool>> logTuIdentidad2(String response);
  Future<Either<BaseFailure, Map<String, String>>> getIdTypes(); //map<tipo, id tipo>
}