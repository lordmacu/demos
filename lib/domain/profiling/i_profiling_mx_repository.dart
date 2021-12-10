import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/domain/profiling/profiling_response.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';

abstract class IProfilingMxRepository {
  Future<Either<BaseFailure, KtList<ProfilingItem>>> getProfilingItems();
  Future<Either<BaseFailure, ProfilingResult>> postProfilingData(
      KtList<ProfilingResponse> data);
  Future<Either<BaseFailure, bool>> postAssignProfile(ProfilingResult result);

  Future<Either<BaseFailure, bool>> getCustomerLevelSimpl();
}
