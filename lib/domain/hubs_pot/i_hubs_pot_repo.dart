import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';

abstract class IHubsPotRepo{
   Future<Either<BaseFailure, bool>> sendData(bool completed);
}