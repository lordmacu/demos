import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';

abstract class ITermsRepository {
  Stream<Either<BaseFailure, String>> getTerms();
}
