

import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';

abstract class ICustomerLevelRepoMx {
  Future<Either<BaseFailure, bool>> updateCustomerLevel(int level);
  redirect();
  Future<Either<BaseFailure, int>> getCurrentCustomerLevel();
}