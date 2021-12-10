import 'dart:convert';
import 'package:ualet/infrastructure/core/core_current_env.dart';

import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/domain/goals/goal_balance_item.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/simulate_transaction_remove_money.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:ualet/to_be_refactor/services/Goals/emoji_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IWithdrawalRepository)
class WithdrawalRepository implements IWithdrawalRepository {
  final Dio _dio;
  final SharedPreferences _preferenceUser;

  final apiBank = "/BankAccount";
  final apiGoal = "/User/getGoalsVersion2";
  final apiDeleteGoal = "/User/deleteGoalsVersion2";
  final apiNotification = "/Notification";

  final apiTransaction = "/Transaction";
  final apiDebits = "/BankAccount/GetAllScheduleDebits";
  final apiValidateTransaction = "/Transaction/ValidateTransaction";
  final String getBanksApi = '/GenericData/AllBanks';
  final apiBalance = "/User/GetBalance";
  final apiAssignMoneyApi = "/Goal/TransferMoneyBetweenGoals";
  final apiSimulation = "/Goal/GoalsWithdrawalDist";

  final String apiDeleteDebit = "/BankAccount/DisableScheduleDebit";

  final String cdn = "${EnvironmentConfig.cdnUrl}";

  WithdrawalRepository(this._dio, this._preferenceUser);

  @override
  Stream<Either<BaseFailure, WithdrawalInfo>> getInfo(
      bool needsBankInfo) async* {
    String phoneNumber = '';
    List banks;
    List banksWithDebits;
    bool showPaint = false;
    String validateTransactionMsg = '';

    if (_preferenceUser.registerData != '') {
      final decoreDataUser = json.decode(_preferenceUser.registerData);
      phoneNumber = decoreDataUser["phoneNumber"];
    } else {
      if (_preferenceUser.userData != '') {
        final decoreUserData = json.decode(_preferenceUser.userData);
        phoneNumber =
            phoneNumber == '' ? decoreUserData["PhoneNumber"] : phoneNumber;
      }
    }

    //Obtener todos los bancos.
    var banksListResponse = await _dio.get(getBanksApi);
    var banksList = banksListResponse.data["Data"];

    //Obtener cuentas del usuario asociada a un débito.
    var bankData = await _dio.get("$apiBank/GetBankAccountsDebits");

    print("esta es la data del bank dataaaaaa-----------------a ${bankData} ");
    if (bankData.data["Data"] != null) {
      showPaint = bankData.data["Data"]["paint"];
      banksWithDebits = bankData.data["Data"]["accounts"];
    }

    List<DashboardGoal> goalsd = [];

    //Listado de bancos con débito del usuario.
    BankInfo bankInfoDebits;
    List<BankInfo> banksInfoDebits = [];
    if (banksWithDebits != null) {
      for (int i = 0; i < banksWithDebits.length; i++) {
        bankInfoDebits = BankInfo(
            bankAccountId: banksWithDebits[i]["Id"],
            bankId: banksWithDebits[i]["BankId"],
            accountTypeId: banksWithDebits[i]["AccountTypeId"],
            accountNumber: banksWithDebits[i]["AccountNumber"],
            bankName: banksWithDebits[i]["BankName"],
            stateName: banksWithDebits[i]["StateName"],
            accountTypeName: banksWithDebits[i]["AccountTypeName"],
            bankLogo: getUrl(banksWithDebits[i]['BankId'], banksList),
            rfc: !getIt<IEnv>().isColombia()
                ? banksWithDebits[i]["Identification"]
                : "",
            status: banksWithDebits[i]["Status"]);
        banksInfoDebits.add(bankInfoDebits);
      }
    }

    //Obtener cuentas bancarias del usuario (Todas).
    var banksAllListResponse = await _dio.get("$apiBank/GetAllBankAccounts");
    if (banksAllListResponse.data["Data"] != null) {
      banks = banksAllListResponse.data["Data"];
    }

    //Listado de cuentas bancarias del usuario
    BankInfo bankInfo;
    List<BankInfo> banksInfo = [];
    if (banks != null) {
      for (int i = 0; i < banks.length; i++) {
        bankInfo = BankInfo(
            bankAccountId: banks[i]["Id"],
            bankId: banks[i]["BankId"],
            accountTypeId: banks[i]["AccountTypeId"],
            accountNumber: banks[i]["AccountNumber"],
            bankName: banks[i]["BankName"],
            stateName: banks[i]["StateName"],
            accountTypeName: banks[i]["AccountTypeName"],
            bankLogo: getUrl(banks[i]['BankId'], banksList),
            rfc: "",
            status: banks[i]["Status"]);
        banksInfo.add(bankInfo);
      }
    }

    var goalsResponse = await _dio.get(apiGoal);
    List goalsData = goalsResponse.data["Data"];
    DashboardGoal goal;
    List<DashboardGoal> goals = [];
    var emojis = await EmojiService().getEmojicategory().first;

    if (goalsData != null) {
      for (int i = 0; i < goalsData.length; i++) {
        print("respp  ${goalsData[i]}");
        goal = DashboardGoal(
          migrate: goalsData[i]["migrate"],
          id: goalsData[i]["Id"],
          name: goalsData[i]["NameGoal"],
          goalAmt: goalsData[i]["TotalValue"],
          currentAmt: goalsData[i]["GoalBalance"].length > 0
              ? goalsData[i]["GoalBalance"][0]["NetBalance"]
              : 0,
          emoji: await getEmoji(goalsData[i]['Emoji'], emojis),
          tieneDomiciliacionprogramada: false,
          fee: goalsData[i]["CuoteValue"],
          periodicity: goalsData[i]["Periodicity"],
          numMonths: goalsData[i]["MonthNumber"],
          created: DateTime.parse(
            '${goalsData[i]["CreatedDate"]}',
          ),
          goalBalance: goalsData[i]["GoalBalance"],
          percentComplete: goalsData[i]["percentComplete"],
        );
        goals.add(goal);
      }
    }

    print("aqui la response del goalsdata  ${goals}  ${goalsData}");

    //Obtener todos los débitos del usuario (activos e inactivos).
    var debitsResponse = await _dio.get(apiDebits);
    List debitsData = debitsResponse.data["Data"];
    DebitInfo debit;
    List<DebitInfo> debits = [];
    if (debitsData != null) {
      for (int i = 0; i < debitsData.length; i++) {
        print("debits datadddd----  ${debitsData[i]}");
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
        );
        debits.add(debit);
      }
    }

    var debitsResponseBalance = await _dio.get(apiBalance);

    var debitsResponseBalanceData = debitsResponseBalance.data["Data"];
    var totaBalance = 0.0;
    if (debitsResponseBalanceData != null) {
      totaBalance = debitsResponseBalanceData["TotalBalanceAccount"];
    }

    //Return data.
    if (phoneNumber != "") {
      var withadrawalInfo = WithdrawalInfo(
          phoneNumber: phoneNumber,
          banksInfo: banksInfo,
          banksInfoDebits: banksInfoDebits,
          goals: goals,
          debits: debits,
          showPaint: showPaint,
          totaBalance: totaBalance,
          validateTransactionMsg: validateTransactionMsg);
      yield right(withadrawalInfo);
    } else {
      BaseFailure baseFailure;
      if (phoneNumber == "") {
        baseFailure = BaseFailure.fromServer("phoneNumberNotFound");
      } else if (goals.length == 0) {
        baseFailure = BaseFailure.fromServer("GoalsNotFound");
      } else {
        baseFailure = BaseFailure.unexpected();
      }
      yield left(baseFailure);
    }
  }

  Future<bool> sendOTP(String phoneNumber) async {
    var data = await _dio.post("$apiNotification/SendTokenOtp",
        data: {"To": phoneNumber, "ActionOtpType": 1});
    if (data.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<BaseFailure, SimulateTransactionRemoveMoney>> getSimulation(
      double value) async {
    GoalBalanceItem objGoalBalance;
    var emojis = await EmojiService().getEmojicategory().first;

    var response = await _dio.post("$apiSimulation", data: {"Value": value});
    var result = response.data["Result"];

    if (result) {
      var resultData = response.data["Data"];
      var lstGoals = response.data["Data"]["Goals"];

      SimulateTransactionRemoveMoney objSimulatetransaction =
          SimulateTransactionRemoveMoney(
              notAssignedBalance: resultData["NotAssignedBalance"],
              goals: [
            GoalBalanceItem(
              id: 0,
              emoji: '',
              nameGoal: 'No Asignado',
              newBalanceGoal: resultData["NotAssignedBalance"],
              transactionAmount: resultData["NotAssignedBalance"],
            )
          ]);

      if (lstGoals.length > 0) {
        for (var i = 0; i < lstGoals.length; i++) {
          objGoalBalance = GoalBalanceItem(
            id: lstGoals[i]["Id"],
            emoji: await getEmoji(lstGoals[i]["Emoji"], emojis),
            nameGoal: lstGoals[i]["NameGoal"],
            newBalanceGoal: lstGoals[i]["NewBalanceGoal"],
            transactionAmount: lstGoals[i]["TransactionAmount"],
          );
          objSimulatetransaction.goals.add(objGoalBalance);
        }
      }

      return right(objSimulatetransaction);
    } else {
      return left(BaseFailure.fromServer("${response.data["Message"]}"));
    }
  }

  Future<Either<BaseFailure, bool>> validateOTP(
      String phoneNumber, String otp) async {
    var data = await _dio.post(
      "$apiNotification/ValidateOtp",
      data: {
        "To": phoneNumber,
        "Code": otp,
        "ActionOtpType": 1,
      },
    );

    var result = data.data["Result"];

    if (result == true) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("Codigo Incorrecto"));
    }
  }

  Future<Either<BaseFailure, bool>> withdrawalAll(
      String bankAccountId,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal,
      bool isValidReCalculateDebits) async {
    print("WithdrawalAll: $bankAccountId");
    var data = await _dio.post(
        "$apiTransaction/GenerateTransactionRemoveAllMoney/$isValidDeleteDebit/$isValidDeleteGoal",
        data: {
          "Value": 0,
          "BankAccountId": bankAccountId,
        });
    var result = data.data["Result"];
    if (result) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("${data.data["Message"]}"));
    }
  }

  Future<Either<BaseFailure, bool>> withdrawalParcial(
      List<double> values,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal) async {
    List goalsInfo = [];
    DashboardGoal goalTemp;
    var goal;
    print("aquii los goalssss ${goals}");

    for (int i = 0; i < goals.length; i++) {
      goalTemp = goals[i];

      goal = {
        "GoalId": goalTemp.id,
        "ValueByGoal": values[i],
        "ParentValuePercentage": (values[i] / totalValue),
      };
      goalsInfo.add(goal);
    }
    var data = await _dio.post(
      "$apiTransaction/GenerateTransactionRemoveMoney/$isValidDeleteDebit/$isValidDeleteGoal",
      data: {
        "Value": totalValue,
        "BankAccountId": bankAccountId,
        "TransactionGoalDetail": goalsInfo,
      },
    );
    var result = data.data["Result"];
    if (result) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer("${data.data["Message"]}"));
    }
  }

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

  Future<Either<BaseFailure, bool>> deleteAllGoals(
      List<DashboardGoal> goals) async {
    bool didFail = false;
    String failMessage = "";
    for (int i = 0; i < goals.length; i++) {
      var requestData = {
        "Id": goals[i].id,
        "Emoji": goals[i].emoji,
        "NameGoal": goals[i].name,
        "TotalValue": goals[i].goalAmt,
        "Periodicity": goals[i].periodicity,
        "CuoteValue": goals[i].fee,
        "CreatedDate": goals[i].created.toIso8601String(),
        "MonthNumber": goals[i].numMonths,
        "percentComplete": goals[i].percentComplete,
        "GoalBalance": [],
        "GoalDetail": [],
        "GoalTransaction": [],
      };

      var response = await _dio.delete(apiDeleteGoal, data: requestData);

      if (!response.data["Result"]) {
        didFail = true;
        failMessage = response.data["Message"];
        break;
      }
    }

    if (!didFail) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer(failMessage));
    }
  }

  Future<Either<BaseFailure, bool>> deleteAllDebit(
      List<DebitInfo> debits) async {
    DebitInfo debit;
    List<bool> result = [];
    bool allOk = true;
    String message =
        "Hubo un problema para eliminar los siguientes débitos automáticos: ";
    for (int i = 0; i < debits.length; i++) {
      debit = debits[i];
      var response = await _dio.delete(apiDeleteDebit, data: {"Id": debit.id});
      result.add(response.data["Result"]);
    }
    for (int i = 0; i < result.length; i++) {
      if (!result[i]) {
        message += debits[i].id.toString();
      }
    }
    if (allOk) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer(message));
    }
  }

  Future<Either<BaseFailure, bool>> deleteGoal(DashboardGoal goal) async {
    var requestData = {
      "Id": goal.id,
      "Emoji": goal.emoji,
      "NameGoal": goal.name,
      "TotalValue": goal.goalAmt,
      "Periodicity": goal.periodicity,
      "CuoteValue": goal.fee,
      "CreatedDate": goal.created.toIso8601String(),
      "MonthNumber": goal.numMonths,
      "percentComplete": goal.percentComplete,
      "GoalBalance": [],
      "GoalDetail": [],
      "GoalTransaction": [],
    };

    var response = await _dio.delete(apiDeleteGoal, data: requestData);

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

  Future<Either<BaseFailure, bool>> deleteDebit(DebitInfo debit) async {
    var response = await _dio.delete(apiDeleteDebit, data: {"Id": debit.id});

    if (response.data["Result"]) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer(response.data["Message"]));
    }
  }

  Future<Either<BaseFailure, bool>> assignMoney(DashboardGoal assignFrom,
      DashboardGoal assignTo, double assignValue) async {
    try {
      var request = {
        "FromGoalId": assignFrom.id,
        "ToGoalId": assignTo.id,
        "Amount": assignValue
      };
      var data = await _dio.post(
        "$apiAssignMoneyApi",
        data: request,
      );
      var result = data.data["Result"];
      if (result) {
        return right(result);
      } else {
        return left(BaseFailure.fromServer("${data.data["Message"]}"));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  Future<String> getEmoji(int id, List<EmojiCategory> emojis) async {
    String emojiName = 'desert_island';
    for (var cat in emojis) {
      for (var em in cat.emoji) {
        if (em.id == id) emojiName = em.emojiName;
      }
    }
    return emojiName;
  }

  String getUrl(int bankCode, dynamic banks) {
    String rest = '';
    for (var bank in banks) {
      if (bank['Id'] == bankCode) {
        print("+++++++++++++++++++++++++++++++++++++++++++++");

        rest = bank['bankIconUrl'];
        print(rest);
        print("+++++++++++++++++++++++++++++++++++++++++++++");
      }
    }
    return "$cdn$rest";
  }
}
