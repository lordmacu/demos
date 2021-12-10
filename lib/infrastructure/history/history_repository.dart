import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/history/i_history_repository.dart';
import 'package:ualet/domain/history/profitability_item.dart';
import 'package:ualet/domain/history/transaction_item.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepository implements IHistoryRepository {
  final Dio _dio;

  final apiProfitability = "/User/GetProfitabilitySummary";

  HistoryRepository(this._dio);

  @override
  Future<Either<BaseFailure, KtList<ProfitabilityItem>>>
      getProfitability() async {
    var profitabilityData = await _dio.get(apiProfitability);

    if (profitabilityData.data["Result"]) {
      List profitability = profitabilityData.data["Data"]["Profitabilities"];
      List<ProfitabilityItem> items = [];
      ProfitabilityItem item;
      for (int i = 0; i < profitability.length; i++) {
        item = ProfitabilityItem(
          name: profitability[i]["Name"],
          value: profitability[i]["Value"],
          isPositive: profitability[i]["IsPositive"],
        );
        items.add(item);
      }

      return right(KtList.from(items));
    } else {
      return left(BaseFailure.fromServer(profitabilityData.data["Message"]));
    }
  }

  @override
  Future<Either<BaseFailure, KtList<TransactionItem>>> getGraphTransactions(
      int valuePeriocity) async {
    String validPeriocityParam;
    switch (valuePeriocity) {
      case 0: // Mensual
        validPeriocityParam = '';
        break;
      case 1: // Trimestral
        validPeriocityParam = '90';
        break;
      case 2: // Semestral
        validPeriocityParam = '180';
        break;

      default:
        validPeriocityParam = '';
    }

    final apiTransactions =
        "/Transaction/GetAllTransactionOfLastMonth/$validPeriocityParam";
    var transactionsData = await _dio.get(apiTransactions);

    if (transactionsData.data["Result"]) {
      List transactionsList = transactionsData.data["Data"];
      List<TransactionItem> transactions = [];
      for (int i = 0; i < transactionsList.length; i++) {

        print("este es el tipo ${transactionsList[i]["TransactionType"].toString()}  ${transactionsList[i]["Name"].toString()}");

        transactions.add(
          TransactionItem(
              id: transactionsList[i]["Id"],
              createDate: DateTime.parse(transactionsList[i]["Date"]),
              value: transactionsList[i]["Value"],
              state: transactionsList[i]["TransactionState"],
              type: transactionsList[i]["TransactionType"].toString(),
              name: transactionsList[i]["Name"].toString(),
              goalName: transactionsList[i]["GoalName"].toString(),
              nameResume: transactionsList[i]["NameResume"].toString(),
              faildetail: transactionsList[i]["Faildetail"].toString(),
              rejectionCode: 0,
              accountNumer: transactionsList[i]["AccountNumber"],
              valueBalance: transactionsList[i]["ValueBalance"] != null
                  ? transactionsList[i]["ValueBalance"]
                  : 0,
              transactionStateName:
                  transactionsList[i]["TransactionStateName"].toString()),
        );
      }

      //Order transactions
      // transactions.sort((a, b) => a.createDate.compareTo(b.createDate));

      return right(KtList.from(transactions));
    } else {
      return left(BaseFailure.fromServer(transactionsData.data["Message"]));
    }
  }
}
