import 'package:ualet/domain/history/profitability_item.dart';
import 'package:ualet/domain/history/transaction_item.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:kt_dart/collection.dart';

abstract class IHistoryRepository {
  Future<Either<BaseFailure, KtList<ProfitabilityItem>>> getProfitability();
  Future<Either<BaseFailure, KtList<TransactionItem>>> getGraphTransactions(int valuePeriocity);
}
