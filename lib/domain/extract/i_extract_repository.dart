import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'Extract_item.dart';

abstract class IExtractsRepository {
  Future<Either<BaseFailure, KtList<ExtractItem>>> getExtracts();
  Future<Either<BaseFailure, KtList<ExtractItem>>> getCertifications();
  Stream<Either<BaseFailure, String>> requestExtracts(String year,String month);
  Stream<Either<BaseFailure, String>> requestCertifications(String year,String month);

}
