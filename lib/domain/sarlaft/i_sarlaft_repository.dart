import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/sarlaft/Quanto/quanto_credit_history_item.dart';
import 'package:ualet/domain/sarlaft/file_response_item.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:dartz/dartz.dart';

abstract class ISarlaftRepository {
  Future<Either<BaseFailure, Map<String, String>>> getCountries();
  Future<Either<BaseFailure, bool>> postSarlaft(SarlaftItem item);
  Future<Either<BaseFailure, bool>> updateSarlaft(SarlaftItem item);
  Future<Either<BaseFailure, bool>> sendFiles(List<FileResponseItem> files);
  Future<Either<BaseFailure, bool>> postCreditHystoryPLus(QuantoCreditHistoryItem item);
}
