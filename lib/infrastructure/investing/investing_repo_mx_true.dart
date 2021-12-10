import 'dart:convert';

import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IInvestingRepositoryMx)
class InvestingRepositoryMxTrue implements IInvestingRepositoryMx {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  final String addBankApi = '/BankAccount/Add';
  final String getBanksApi = '/GenericData/AllBanks';

  final String addScheduleTransactionApi =
      '/Transaction/ScheduleAutomaticDebit';

  final String softEnrolmentApi = '/Enrollment/SoftEnrollment';

  final String generateSpeiApi = '/Transaction/GenerateTransactionUaletPse';

  final String sendSarlafApi = '/Enrollment/CreateForm';

  final String getOcupationsApi = '/GenericData/GetProfessions';

  final String getRequiredFilesApi = '/File/GetFilesToEnroll';

  final String getHolidayApi = '/Holiday/Get';

  final apiBank = "/BankAccount";

  final String cdn = "${EnvironmentConfig.cdnUrl}";

  final String sendEmailVinculationApi = "/Enrollment/SendEmailSuccessEnrollment";

  InvestingRepositoryMxTrue(this._dio, this._sharedPreferences);

  @override
  Future<List<BankInfo>> getBankAccounts() async {
    var bankData = await _dio.get("$apiBank/GetAllBankAccounts");
    var banksListResponse = await _dio.get(getBanksApi);
    var banksList = banksListResponse.data["Data"];
    List banks = bankData.data["Data"];
    BankInfo bankInfo;
    List<BankInfo> banksInfo = [];
    if (banks != null) {
      for (int i = 0; i < banks.length; i++) {
        bankInfo = BankInfo(
          bankAccountId: banks[i]["Id"],
          bankId: banks[i]["BankId"],
          accountTypeId: banks[i]["AccountTypeId"],
          accountNumber: banks[i]["AccountNumber"],
          bankName: banks[i]['BankName'],
          stateName: banks[i]["StateName"],
          accountTypeName: banks[i]["AccountTypeName"],
          bankLogo: getUrl(banks[i]['BankName'], banksList),
          rfc: "",
        );
        banksInfo.add(bankInfo);
      }
    }

    return banksInfo;
  }

  @override
  Future<bool> getHolidayAvailable(DateTime valueDate) async {
    var response = await _dio.get("$getHolidayApi");
    var result = response.data["Result"];
    if (result == true) {
      for (var data in response.data["Data"]) {
        if (valueDate == DateTime.parse(data['DayHoliday'])) {
          return true;
        }
      }
      print("Return False after loop");
      return false;
    } else {
      return false;
    }
  }

  @override
  Future<Either<BaseFailure, BankAccountItem>> addBankAccount(
      BankAccountItem item, bool isInvestment) async {
    SharedPreferences _prefs = getIt<SharedPreferences>();
    try {
      Map map = getIt<IEnv>().isColombia()
          ? {
              'getCheckCreationAccount': _prefs.getCheckCreationAccount,
              'AccountTypeId': item.typeId,
              'BankId': item.bankId,
              'AccountNumber': item.number
            }
          : {
              'getCheckCreationAccount': _prefs.getCheckCreationAccount,
              'AccountTypeId': item.typeId,
              'BankId': item.bankId,
              'AccountNumber': item.number,
              'Rfc': item.rfc,
            };
      var response =
          await _dio.post(addBankApi + "/true", data: json.encode(map));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data['Message']));
      var a = response.data['Data'];
      var acc = BankAccountItem(
          number: a["AccountNumber"],
          accountType: '',
          accountBank: a["BankName"],
          accountImg:
              'https://upload.wikimedia.org/wikipedia/commons/8/81/Logo_Bancolombia2.png',
          id: a["Id"],
          typeId: a["AccountTypeId"],
          bankId: a["BankId"]);
      return right(acc);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> addScheduledDebit(
    BankAccountItem item,
    DashboardGoal goal,
    bool multiple,
    List<DashboardGoal> goals,
    double totalValue,
  ) async {
    SharedPreferences _prefs = getIt<SharedPreferences>();

    if (!multiple) {
      try {
        DateFormat formatter = DateFormat("y/M/d");
        //Para que no quede en un fin de semana
        var day = goal.created.weekday;
        Duration theWknd = Duration(days: 0);
        if (day == 6) {
          theWknd = Duration(days: 2);
        } else if (day == 7) {
          theWknd = Duration(days: 1);
        }
        print("Goal");
        print(goal);
        var data = {
          "Check1": _prefs.getCheck1,
          "Check2": _prefs.getCheck2,
          "Check3": _prefs.getCheck3,
          "Check4": _prefs.getCheck4,
          "Periodicity": goal.periodicity.toString(),
          "Value": totalValue,
          "BankAccountId": item.id.toString(),
          "FirstDateApplication": formatter.format(goal.created.add(theWknd)),
          "SecondDateApplication": formatter.format(
              goal.created.add(theWknd).add(getDuration(goal.periodicity))),
          "TransactionGoalDetail": [
            {
              "GoalId": goal.id,
              "ValueByGoal": goal.fee,
              "ParentValuePercentage": 100,
            }
          ]
        };

        var response =
            await _dio.post(addScheduleTransactionApi, data: json.encode(data));

        if (!response.data["Result"])
          return left(BaseFailure.fromServer(response.data["Message"]));

        return right(true);
      } catch (e) {
        return left(BaseFailure.unexpected());
      }
    } else if (multiple && goals.length > 0) {
      var day = goals[0].created.weekday;
      Duration theWknd = Duration(days: 0);
      if (day == 6) {
        theWknd = Duration(days: 2);
      } else if (day == 7) {
        theWknd = Duration(days: 1);
      }
      List goalsInfo = [];

      try {
        var goal;
        DashboardGoal goalTemp;
        for (int i = 0; i < goals.length; i++) {
          goalTemp = goals[i];
          print("Goal");
          print(goalTemp);
          goal = {
            // "emoji": goalTemp.emoji,
            // "nameGoal": goalTemp.name,
            // "totalValue": goalTemp.goalAmt,
            // "periodicity": goalTemp.periodicity,
            // "cuoteValue": goalTemp.fee,
            // "createdDate": goalTemp.created.toIso8601String(),
            // "monthNumber": goalTemp.numMonths,
            // "percentComplete": goalTemp.percentComplete,
            "GoalId": goalTemp.id,
            "ValueByGoal": goalTemp.fee,
            "ParentValuePercentage": (goalTemp.fee / totalValue) * 100,
          };
          goalsInfo.add(goal);
        }

        var data = {
          "Check1": _prefs.getCheck1,
          "Check2": _prefs.getCheck2,
          "Check3": _prefs.getCheck3,
          "Check4": _prefs.getCheck4,
          "Periodicity": goals[0].periodicity.toString(),
          "Value": totalValue,
          "BankAccountId": item.id.toString(),
          "FirstDateApplication":
              goals[0].created.add(theWknd).toIso8601String(),
          "SecondDateApplication": goals[0]
              .created
              .add(theWknd)
              .add(getDuration(goals[0].periodicity))
              .toIso8601String(),
          "TransactionGoalDetail": goalsInfo,
        };

        var response =
            await _dio.post(addScheduleTransactionApi, data: json.encode(data));

        if (!response.data["Result"])
          return left(BaseFailure.fromServer(response.data["Message"]));

        return right(true);
      } catch (e) {
        return left(BaseFailure.unexpected());
      }
    } else {
      return left(BaseFailure.unexpected());
    }
  }

  Duration getDuration(int periodicity) {
    switch (periodicity) {
      case DashboardGoal.MENSUAL:
        return Duration(days: 30);
        break;
      case DashboardGoal.QUINCENCAL:
        return Duration(days: 15);
        break;
      case DashboardGoal.TRIMESTRAL:
        return Duration(days: 90);
      default:
        return Duration(days: 30);
    }
  }

  @override
  Future<Either<BaseFailure, Map<int, String>>> getBanks() async {
    try {
      var response = await _dio.get(getBanksApi);

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      Map<int, String> rMap = {};

      for (var bank in response.data["Data"]) {
        rMap[bank['Id']] = bank['Name'];
      }

      return right(rMap);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> softEnrollment() async {
    try {
      var data = {"Completed": true};
      var response = await _dio.post(softEnrolmentApi, data: json.encode(data));

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, String>> generateSpei(
      double value, List<DashboardGoal> goals, List<double> values) async {
    if (goals.length > 0) {
      try {
        List goalsInfo = [];
        var goal;
        DashboardGoal goalTemp;
        for (int i = 0; i < goals.length; i++) {
          goalTemp = goals[i];
          goal = {
            // "emoji": goalTemp.emoji,
            // "nameGoal": goalTemp.name,
            // "totalValue": goalTemp.goalAmt,
            // "periodicity": goalTemp.periodicity,
            // "cuoteValue": goalTemp.fee,
            // "createdDate": goalTemp.created.toIso8601String(),
            // "monthNumber": goalTemp.numMonths,
            // "percentComplete": goalTemp.percentComplete,
            "GoalId": goalTemp.id,
            "ValueByGoal": values[i],
            "ParentValuePercentage": (values[i] / value) * 100,
            // "ParentValuePercentage": 100,
          };
          goalsInfo.add(goal);
        }
        var data = {"Value": value, "TransactionGoalDetail": goalsInfo};
        var response =
            await _dio.post(generateSpeiApi, data: json.encode(data));

        if (!response.data["Result"])
          return left(BaseFailure.fromServer(response.data["Message"]));

        return right(response.data['Data']['UrlPaymentSite']);
      } catch (e) {
        return left(BaseFailure.unexpected());
      }
    } else {
      try {
        var data = {"Value": value};
        var response =
            await _dio.post(generateSpeiApi, data: json.encode(data));

        if (!response.data["Result"])
          return left(BaseFailure.fromServer(response.data["Message"]));

        return right(response.data['Data']['UrlPaymentSite']);
      } catch (e) {
        return left(BaseFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BaseFailure, String>> generatePSE(double value) async {
    try {
      var data = {"Value": value};
      var response = await _dio.post(generateSpeiApi, data: json.encode(data));

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(response.data['Data']['UrlPaymentSite']);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> sendEmailVinculation() async {
    try {
      var response = await _dio.get(sendEmailVinculationApi);
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  String getUrl(String bankName, dynamic banks) {
    String rest = '';
    for (var bank in banks) {
      if (bank['Name'] == bankName) {
        rest = bank['bankIconUrl'];
      }
    }
    return "$cdn$rest";
  }
}
