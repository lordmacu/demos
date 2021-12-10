import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/my_wallet/i_my_wallet_repository.dart';
import 'package:ualet/domain/my_wallet/my_wallet_data.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

@LazySingleton(as: IMyWalletRepository)
class MyWalletRepository implements IMyWalletRepository {
  final String bankAccountsApi = '/BankAccount/GetBankAccounts';

  final apiAccountsDebits = "/BankAccount/GetBankAccountsDebits";

  final apiAllAccounts = "/BankAccount/GetAllBankAccounts";

  final String cdn = "${EnvironmentConfig.cdnUrl}";

  final String getBanksApi = '/GenericData/AllBanks';

  final apiDebits = "/BankAccount/GetAllScheduleDebits";

  final apiGoals = "/User/getGoalsVersion2";

  final apiDeleteBank = "/BankAccount/Delete";

  final apiDeleteDebit = "/BankAccount/DisableScheduleDebit";

  final apiEditDebit = "/BankAccount/UpdateScheduleDebit";

  final Dio _dio;

  MyWalletRepository(this._dio);

  @override
  Future<Either<BaseFailure, MyWalletData>> getData() async {
    try {
      List<BankAccountItem> accounts = [];
      bool showPaint = false;

      var accountsResponse = await _dio.get(apiAccountsDebits);
      var accountsAllResponse = await _dio.get(apiAllAccounts);
      var banksListResponse = await _dio.get(getBanksApi);
      var banksList = banksListResponse.data["Data"];

      if (!accountsResponse.data["Result"])
        return left(BaseFailure.fromServer(accountsResponse.data["Message"]));

      if (!accountsAllResponse.data["Result"])
        return left(
            BaseFailure.fromServer(accountsAllResponse.data["Message"]));

      if (accountsResponse.data["Data"] != null) {
        showPaint = accountsResponse.data["Data"]["paint"];

        if (accountsAllResponse.data["Data"] != null) {
          for (var acc in accountsAllResponse.data["Data"]) {
            accounts.add(BankAccountItem(
                number: acc["AccountNumber"],
                accountType: acc['AccountTypeName'],
                accountBank: acc["BankName"],
                accountImg: getUrl(acc['BankName'], banksList),
                id: acc["Id"],
                typeId: acc["AccountTypeId"],
                bankId: acc["BankId"],
                status: acc["Status"],
                stateName: acc["StateName"],
                rfc: acc["Identification"]));
          }
        }
      }

      var debitsResult = await getDebits(banksList);
      var goalsResult = await getGoals();

      List<DebitInfo> debits = debitsResult.fold((l) => [], (r) => r);
      KtList<DashboardGoal> goals = goalsResult;

      var data = MyWalletData(
          accountsList: KtList.from(accounts),
          debitsList: KtList.from(debits),
          goalsList: goals,
          showPaint: showPaint);

      return right(data);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  String getUrl(String bankName, dynamic banks) {
    String rest = '';
    for (var bank in banks) {
      if (bank['Name'] == bankName) {
        rest = bank['bankIconUrl'].replaceAll(" ", "");
        print(rest);
        print("+++++++++++++++++++++++++++++++++++++++++++++");
      }
    }
    return "$cdn$rest";
  }

  Future<KtList<DashboardGoal>> getGoals() async {
    try {
      var goalsResponse = await _dio.get(apiGoals);
      List<DashboardGoal> list = [];
      for (Map g in goalsResponse.data["Data"]) {
        DashboardGoal goal = DashboardGoal(
          migrate: g['migrate'],
          id: g["Id"],
          name: g["NameGoal"],
          goalAmt: g["TotalValue"],
          currentAmt: g["GoalBalance"].length > 0
              ? g["GoalBalance"][0]["NetBalance"]
              : 0,
          emoji: '',
          tieneDomiciliacionprogramada: false,
          fee: g["CuoteValue"],
          periodicity: g["Periodicity"],
          numMonths: g["MonthNumber"],
          percentComplete: g["percentComplete"],
          goalBalance: g["GoalBalance"],
          goalTransactions: g["GoalTransaction"],
          created: DateTime.parse('${g["CreatedDate"]}'),
        );
        list.add(goal);
      }
      return KtList.from(list);
    } catch (e) {
      print("ERROR getGoals()================================== my wallet =");
      print(e);
      return null;
    }
  }

  Future<Either<BaseFailure, List<DebitInfo>>> getDebits(dynamic banks) async {
    try {
      var debitsResponse = await _dio.get(apiDebits);
      List debitsData = debitsResponse.data["Data"];
      DebitInfo debit;
      List<DebitInfo> debits = [];
      String tipoCuenta = "";
      if (debitsData != null) {
        for (int i = 0; i < debitsData.length; i++) {
          tipoCuenta = "Cuenta";
          if (debitsData[i]["BankAccountType"] == 1) {
            tipoCuenta = "Cuenta CLABE";
          }
          List<int> goals = [];
          // for (var a in debitsData[i]["goalsChildren"]) {
          //   goals.add(a);
          // }
          debit = DebitInfo(
            id: debitsData[i]["Id"],
            ualetAccountId: debitsData[i]["UaletAccountId"],
            creationDate: DateTime.parse(debitsData[i]["CreationDate"]),
            firstDateApplication:
                DateTime.parse(debitsData[i]["FirstDateApplication"]),
            seconDateApplication: debitsData[i]["SecondDateApplication"] != null
                ? DateTime.parse(debitsData[i]["SecondDateApplication"])
                : null,
            periodicity: debitsData[i]["Periodicity"],
            updateDate: DateTime.parse(debitsData[i]["UpdateDate"]),
            status: debitsData[i]["Status"],
            bankAccountId: debitsData[i]["BankAccountId"],
            bankAccountName: debitsData[i]["BankName"],
            bankAccountNumber: debitsData[i]["BankAccountNumber"],
            value: debitsData[i]["Value"],
            goalId: [],
            bankUrl: getUrl(debitsData[i]["BankName"], banks),
            bankAccountTypeId: debitsData[i]["BankAccountType"],
          );
          debits.add(debit);
        }
        return right(debits);
      } else {
        return left(BaseFailure.fromServer(debitsResponse.data['Message']));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> deleteAccount(
      BankAccountItem bankAccount) async {
    var response = await _dio
        .delete(apiDeleteBank, data: {"Id": bankAccount.id.toString()});

    if (response.data["Result"]) {
      return right(true);
    } else {
      return left(
        BaseFailure.fromServer(
          response.data["Message"],
        ),
      );
    }
  }

  @override
  Future<Either<BaseFailure, bool>> deleteDebit(DebitInfo debit) async {
// TODO: Conexión con back
    final apiDeleteDebits = "/BankAccount/DisableScheduleDebit";

    var response = await _dio.delete(apiDeleteDebits, data: {"Id": debit.id});
    if (response.data["Result"]) {
      return right(true);
    } else {
      return left(
        BaseFailure.fromServer(
          response.data["Message"],
        ),
      );
    }
    return right(true);
  }

  @override
  Future<Either<BaseFailure, bool>> editDebit(DebitInfo debit) async {
    var response = await _dio.put(apiEditDebit, data: {
      "Id": debit.id,
      "Periodicity": debit.periodicity,
      "Value": debit.value,
      "FirstDateApplication": debit.firstDateApplication.toString()
    });
    if (response.data["Result"]) {
      return right(true);
    } else {
      return left(
        BaseFailure.fromServer(
          response.data["Message"],
        ),
      );
    }
  }


}
