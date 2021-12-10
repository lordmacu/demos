import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/customer_level/redirection_item.dart';
import 'package:dartz/dartz.dart';

abstract class ICustomerLevelRepoCol{
  Future<Either<BaseFailure, bool>> setAfterPassword();
  Future<Either<BaseFailure, bool>> setAfterPerfilamiento();
  Future<Either<BaseFailure, bool>> setAfterMeta();
  Future<Either<BaseFailure, bool>> setAfterHome();
  Future<Either<BaseFailure, int>> getCurrentCustomerLevel();
  Future<Either<BaseFailure, bool>> getValidBlackListConsult();
  Future<Either<BaseFailure, RedirectionItem>> verifyNextRedirection(double investment);
  redirect();
}