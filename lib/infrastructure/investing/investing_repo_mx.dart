import 'dart:convert';

import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/domain/sarlaft/ocupation_item.dart';
import 'package:ualet/domain/sarlaft/required_file_item.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';
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

@LazySingleton(as: IInvestingRepository)
class InvestingRepositoryMx implements IInvestingRepository {
  final Dio _dio;

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

  final apiValidateTransaction = "/Transaction/ValidateTransaction";

  final String cdn = "${EnvironmentConfig.cdnUrl}";

  final imgUrlPlaceHolder =
      "https://s3-alpha-sig.figma.com/img/8311/0f26/b51fccffc8f78e47deab677018f9c777?Expires=1599436800&Signature=X4MYVdubpIaixmGPeeEgZfXg4VESKdPET3wfrqavmYvz7zMeegNEivrP6eOtO5qN0ja3MMwb13qNgZ2kE3aj31UXYy8iz8wfTw9PTUcoE0HT3zx98AvnFxQfy5rccblmN-uLbAQmGawEwosS47E81TtueiLOa~KhwHkKaTLYLre2qjCZyEnmKuZxlCj1LCpXJtHL7b0X~0SPpZ5yOrPh088fLo36g02uiSRpASPveejXxTTHqX6BZ42LUjH06eSDn1qbFab46gF0mau8SuVO0aKNv-ewq0sLPWFWxjVUseNOzgKAJMAKYmpG0WPgiLoqWTxnmAz~cOUsd7G48hdIrA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";

  SharedPreferences _prefs = getIt<SharedPreferences>();

  InvestingRepositoryMx(this._dio);

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
          status: banks[i]["Status"],
        );
        banksInfo.add(bankInfo);
      }
    }

    return banksInfo;
  }

  @override
  // ignore: missing_return
  Future<bool> getHolidayAvailable(DateTime valueDate) async {
    var response = await _dio.get("$getHolidayApi");
    var valueD = DateFormat("yyyy-MM-dd").format(valueDate);

    var result = response.data["Result"];
    if (result == true) {
      for (var data in response.data["Data"]) {
        var valueHoliday = DateFormat("yyyy-MM-dd").format(DateTime.parse(data['DayHoliday']));
        if (valueD == valueHoliday) {
          return true;
        } 
      }
      return false;
    } else {
      return false;
    }
  }

  @override
  Future<Either<BaseFailure, BankAccountItem>> addBankAccount(
      BankAccountItem item, bool isInvestment) async {
    try {
      SharedPreferences _prefs = getIt<SharedPreferences>();

      Map map = {
        'getCheckCreationAccount':_prefs.getCheckCreationAccount,
        'AccountTypeId': item.typeId,
        'BankId': item.bankId,
        'AccountNumber': item.number,
      };
      var banksListResponse = await _dio.get(getBanksApi);
      var banksList = banksListResponse.data["Data"];
      var response = await _dio.post(addBankApi + "/$isInvestment",
          data: json.encode(map));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data['Message']));
      var a = response.data['Data'];
      var acc = BankAccountItem(
          number: a["AccountNumber"],
          accountType: '',
          accountBank: a["BankName"],
          accountImg: getUrl(a['BankName'], banksList),
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
          "Periodicity": goal.periodicity.toString(),
          "Value": goal.fee,
          "BankAccountId": item.id.toString(),
          "FirstDateApplication": formatter.format(goal.created.add(theWknd)),
          "SecondDateApplication": formatter.format(
              goal.created.add(theWknd).add(getDuration(goal.periodicity)))
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
          "Periodicity": goals[0].periodicity.toString(),
          "Value": totalValue,
          "BankAccountId": item.id.toString(),
          "FirstDateApplication":
              goals[0].created.add(theWknd).toIso8601String(),
          "SecondDateApplication": goals[0]
              .created
              .add(theWknd)
              .add(getDuration(goals[0].periodicity))
              .toIso8601String()
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
      
      var data;
      if (getIt<IEnv>().isColombia()) {
        data = {"Completed": true};
      } else {
        data = {"Completed": true, "TypeDocument": _prefs.ineOrIfeType, "NroDocument": _prefs.ineOrIfeNumber};
      }
      
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
        var data = {"Value": value};
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
  Future<Either<BaseFailure, bool>> sendSarlaf(
      GrandesMontosDataState state) async {
    try {
      var data = {
        // "address": state.direccionResidencia,
        // "ciiuCode": state.ciiu,
        // "citizenResidentUs": state.ciudadanoEEUU,
        // "cityResidenceId": "1", //TODO
        // "cityWorkId": "1", //TODO
        // "foundsOrigin": state.origenFondos,
        // "hasPepRelationships": state.familyPep,
        // "ifPayTaxesNotColombia": false, //TODO
        // "isPep": state.userPep,
        // "itsGreenCard": false, //TODO
        // "manageForeignCurrency": state.operacionesOtraMoneda,
        // "managesPublicResources": state.adminRecursosPublicos,
        // "monthlyIncome": state.ingresosMensuales,
        // "monthlyOutcome": state.egresosMensuales,
        // "occupationId": state.ocupacion,
        // "othersIncome": state.otrosIngresos,
        // "payTaxesNotColombiaModel": [], //TODO
        // "pepList": state.pepsList
        //     .map((e) =>
        //         {"nombre": e.name, "cargo": e.position, "identification": e.id})
        //     .toList(),
        // "permanencyInUs": state.diasEEUU,
        // "productForeignCurrencyList": [], //TODO
        // "receiveIncomePropertyUs": state.ingresosPropiedadesEEUU,
        // "receivePaymentsUs": state.pagosEEUU,
        // "totalAssets": state.totalActivos,
        // "totalLiabilities": state.totalPasivos,
        // "workAddress": "", //TODO
        // "workPhone": "", //TODO
        // "workPlaceName": "", //TODO
      };

      var response = await _dio.post(sendSarlafApi, data: json.encode(data));

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, KtList<OcupationItem>>> getItems() async {
    try {
      var response = await _dio.get("$getOcupationsApi");

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      List<OcupationItem> lst = [];

      for (var item in response.data["Data"]) {
        lst.add(OcupationItem(
          code: item['defaultCode'],
          id: item['Id'].toString(),
          name: item['description'],
        ));
      }
      print("loopEnd");

      return right(KtList.from(lst));
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, KtList<RequiredFileItem>>>
      getRequiredFiles() async {
    try {
      var response = await _dio.get("$getRequiredFilesApi");

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      List<RequiredFileItem> lst = [];

      for (var item in response.data["Data"]) {
        lst.add(RequiredFileItem(
            id: item['Id'],
            name: item['FileName'],
            isRequired: item['IsRequired'],
            maxSizeKB: item['MaxSize']));
      }

      return right(KtList.from(lst));
    } catch (e) {
      return left(BaseFailure.unexpected());
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

  String getUrl(String bankCode, dynamic banks) {
    String rest = '';
    for (var bank in banks) {
      if (bank['Name'] == bankCode) {
        print("+++++++++++++++++++++++++++++++++++++++++++++");

        rest = bank['bankIconUrl'];
        print(rest);
        print("+++++++++++++++++++++++++++++++++++++++++++++");
      }
    }
    return "$cdn$rest";
  }

  @override
  Future<Either<BaseFailure, ValidarTransactionPopupInfo>>
      validateTransactionPopUpType(
          int rulePopUpType, double transactionValue) async {
    try {
      var request = {
        "RulePopUpType": rulePopUpType,
        "TransactionValue": transactionValue,
      };
      var data = await _dio.post(
        "$apiValidateTransaction",
        data: request,
      );
      var result = data.data["Result"];
      if (result) {
        var response = ValidarTransactionPopupInfo(
            result: data.data["Result"],
            message: data.data["Message"],
            popUpType:
                data.data["Data"] != null ? data.data["Data"]["PopUpType"] : 0);
        return right(response);
      } else {
        return left(BaseFailure.fromServer("${data.data["Message"]}"));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
