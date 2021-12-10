import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:ualet/domain/dashboard/dashboard_investing_success.dart';
import 'package:ualet/domain/dashboard/dashboard_valid_migrate.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/domain/notifications/notification_item_valid_read.dart';
import 'package:ualet/domain/portfolio/portfolio_investment.dart';
import 'package:ualet/domain/sarlaft/pay_taxes_not_colombia_item.dart';
import 'package:ualet/domain/sarlaft/pep_family_member.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/src/collection/kt_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:ualet/to_be_refactor/models/login/login_response_model.dart';
import 'package:ualet/to_be_refactor/services/Goals/emoji_service.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/dashboard/dashboard_fund.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/widgets/profile_faq_widget.dart';

@LazySingleton(as: IDashboardRepository)
class DashboardRepository implements IDashboardRepository {
  final Dio _dio;

  final apiBalance = "/User/GetBalance";
  final apiFunds = "/User/GetFundAssigned";
  final apiGoals = "/User/getGoalsVersion2";
  final apiNotifications = "/Transaction/GetAllTransactionOfLastMonth";
  final apiNotificationsRead = "/Transaction/GetAmountTransactionNotIsRead";
  final apiApprovedTransactions =
      "/Transaction/GetTotalApprovedTransactionsByUaletAccount";
  final apiVerifyUserUpdateSarlaft = '/Enrollment/VerifyUserUpdateSarlaft';
  final apiGetUserVideoStatus = '/Video/GetUserVideoStatus';
  final apiConsultUserSarlaft = '/Enrollment/ConsultUser';
  final VerifyTheInvestment = '/User/VerifyTheInvestment';
  final GetMaximumInvesmentApi = '/User/GetMaximumInvestment';

  final SharedPreferences _sharedPreferences;

  DashboardRepository(this._dio, this._sharedPreferences);

  Future<KtList<DashboardGoal>> _getGoalsMock() {
    var list = List<DashboardGoal>();

    list.add(DashboardGoal(
        created: DateTime.now(),
        migrate: false,
        id: 0,
        currentAmt: 1630000,
        emoji: 'desert_island',
        goalAmt: 8000000,
        name: 'Viaje a Islas Canarias',
        fee: 0,
        periodicity: 0,
        numMonths: 0,
        tieneDomiciliacionprogramada: true,
        percentComplete: 0,
        color: '#1FD0BF',
        percentColor: 10,
        assignedBalanceValue: 700000));

    list.add(DashboardGoal(
        created: DateTime.now(),
        id: 1,
        migrate: false,
        currentAmt: 0,
        emoji: 'computer',
        goalAmt: 7000000,
        name: 'Compra Macbook',
        fee: 0,
        periodicity: 0,
        numMonths: 0,
        tieneDomiciliacionprogramada: false,
        percentComplete: 0,
        color: '#FD5F8C',
        percentColor: 15,
        assignedBalanceValue: 230000));

    list.add(DashboardGoal(
        created: DateTime.now(),
        id: 2,
        migrate: false,
        currentAmt: 1000000,
        emoji: 'computer',
        goalAmt: 6000000,
        name: 'Pinta de diciembre y novevas de aginaldo',
        fee: 0,
        periodicity: 0,
        numMonths: 0,
        tieneDomiciliacionprogramada: false,
        percentComplete: 0,
        color: '#EB7E30',
        percentColor: 20,
        assignedBalanceValue: 400000));

    list.add(DashboardGoal(
        created: DateTime.now(),
        id: 3,
        migrate: false,
        currentAmt: 0,
        emoji: 'computer',
        goalAmt: 7000000,
        name: 'Xbox Series S',
        fee: 0,
        periodicity: 0,
        numMonths: 0,
        tieneDomiciliacionprogramada: false,
        percentComplete: 0,
        color: '#F8C753',
        percentColor: 25,
        assignedBalanceValue: 600000));

    list.add(DashboardGoal(
        created: DateTime.now(),
        id: 4,
        migrate: false,
        currentAmt: 0,
        emoji: 'computer',
        goalAmt: 7000000,
        name: 'Ahorro extra juicioso',
        fee: 0,
        periodicity: 0,
        numMonths: 0,
        tieneDomiciliacionprogramada: false,
        percentComplete: 0,
        color: '#2F8DFA',
        percentColor: 10,
        assignedBalanceValue: 130000));

    return Future.delayed(Duration(seconds: 1), () => KtList.from(list));
  }

  Future<DashboardUserItem> getUserInfoMock() {
    DashboardUserItem user = DashboardUserItem(
        titles: 0.0,
        efectivo: 10000.0,
        name: 'Camila',
        riskProfile: 'Estratega',
        hasTransactions: false,
        balance: 1560000);
    return Future.delayed(Duration(milliseconds: 100), () => user);
  }

  @override
  Future<Either<BaseFailure, DashboardData>> getData() async {
    DashboardUserItem userInfo = await getUserInfo();
    if (userInfo == null) {
      return left(BaseFailure.fromServer(
          "Ocurrió un error al descargar su información"));
    }
    KtList<DashboardFund> funds = await getFunds();
    if (funds == null || funds.size == 0) {
      return left(BaseFailure.fromServer(
          "Ocurrió un error al descargar la información de los fondos"));
    }
    KtList<DashboardGoal> goals = await getGoals();
    if (goals == null) {
      return left(BaseFailure.fromServer(
          "Ocurrió un error al descargar la información de las metas"));
    }

    DashboardTotalApprovedTransactionsItem approvedTransactionsSuccess =
        await getTotalApprovedTransactions();
    if (approvedTransactionsSuccess == null) {
      return left(BaseFailure.fromServer("Ocurrió un error..."));
    }

    NotificationValidRead notificationValidRead = await getNotifications();
    if (notificationValidRead == null) {
      return left(BaseFailure.fromServer("Ocurrió un error..."));
    }

    bool userUpdateSarlaft = await verifyUserUpdateSarlaft();
    if (userUpdateSarlaft == null) {
      return left(BaseFailure.fromServer("Ocurrió un error..."));
    }

    var getVideoUsers;
    if (getIt<IEnv>().isColombia()) {
      getVideoUsers = await getVideoUser();
    }

    UserInfo userSarlaft = await consultUserSarlaft();
    if (userSarlaft == null) {
      return left(BaseFailure.fromServer("Ocurrió un error..."));
    }


    var VerifyTheInvestmentUserFirsts = await VerifyTheInvestmentUserFirst();




    DashboardData data = DashboardData(
        funds: funds,
        goals: goals,
        user: userInfo,
        approvedTransactions: approvedTransactionsSuccess,
        verifyUserUpdateSarlaft: userUpdateSarlaft,
        userSarlaft: userSarlaft,
        video: getIt<IEnv>().isColombia() ? getVideoUsers : null,
        validNotification: notificationValidRead,
        VerifyTheInvestmentUserFirsts:VerifyTheInvestmentUserFirsts
    );
    return right(data);
  }

  Future<KtList<DashboardGoal>> getGoals() async {
    var emojis = await EmojiService().getEmojicategory().first;
    try {
      var goalsResponse = await _dio.get(apiGoals);
      List<DashboardGoal> list = [];
      for (Map g in goalsResponse.data["Data"]) {
        DashboardGoal goal = DashboardGoal(
            id: g["Id"],
            name: g["NameGoal"],
            goalAmt: g["TotalValue"],
            // currentAmt: g["GoalBalance"][0],
            currentAmt: g["GoalBalance"].length > 0
                ? g["GoalBalance"][0]["NetBalance"]
                : 0,
            emoji: await getEmoji(g['Emoji'], emojis),
            tieneDomiciliacionprogramada: false,
            fee: g["CuoteValue"],
            periodicity: g["Periodicity"],
            numMonths: g["MonthNumber"],
            percentComplete: g["percentComplete"],
            goalBalance: g["GoalBalance"],
            goalTransactions: g["GoalTransaction"],
            migrate: g["migrate"],
            created: DateTime.parse('${g["CreatedDate"]}'),
            color: g["Color"],
            percentColor: g["PercentColor"],
            assignedBalanceValue: g["GoalBalance"].length > 0
                ? g["GoalBalance"][0]["NetBalance"]
                : 0);
        list.add(goal);
      }
      return KtList.from(list);
    } catch (e) {
      print(
          "ERROR getGoals()=================================== daSDKASKDJSADFKJASDF ");
      print(e);
      return null;
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

  Future<KtList<DashboardFund>> getFunds() async {
    try {
      List<DashboardFund> funds = [];
      var fundsData = await _dio.get(apiFunds);
      for (Map fundJson in fundsData.data["Data"]) {
        print(fundJson);
        List<PortfolioInvestment> investments = [];
        for (var inv in fundJson['assetType']) {
          investments.add(PortfolioInvestment(
              title: inv['Description'], distribution: inv['detail']));
        }
        DashboardFund fund = DashboardFund(
            name: fundJson["FoundDescription"],
            participationPercentage: fundJson["Distribution"],
            logo: fundJson["Logo"],
            assetType: KtList.from(investments),
            titulos: 0,
            balance: fundJson["Balance"],
            color: getIt<IEnv>().isColombia()
                ? getFundColorCol(fundJson["FoundId"])
                : getFundColorMx(fundJson["FoundId"]),
            description: getDescriptionFund(fundJson["FoundId"]),
            id: fundJson["FoundId"]);
        funds.add(fund);
      }
      return KtList.from(funds);
    } catch (e) {
      print("ERROR getFunds()==========================================");
      print(e);
      return KtList.from([
        DashboardFund(
            name: "Error",
            participationPercentage: 0,
            logo: '',
            assetType: KtList.from([]),
            titulos: 0,
            balance: 0,
            color: AppColors.redColor,
            id: -1)
      ]);
    }
  }

  Future<DashboardUserItem> getUserInfo() async {
    try {
      var usrData = User.fromJson(json.decode(_sharedPreferences.userData));
      var balance = await _dio.get(apiBalance);
      bool balanceDownloaded = balance.data["Result"];
      String profile = _sharedPreferences.userProfile;
      if (profile == '') {
        try {
          profile = usrData.userProfile[0]['Profile']['Name'];
        } catch (e) {
          profile = '';
        }
      }

      String name = usrData.firstName;

      if (name == '' || name == null) {
        name = _sharedPreferences.userName;
      }

      DashboardUserItem userItem = DashboardUserItem(
        efectivo:
            balanceDownloaded ? balance.data['Data']['AvailableBalance'] : 0.0,
        titles: balanceDownloaded ? balance.data['Data']['Titles'] ?? 0 : 0.0,
        name: name,
        balance: balanceDownloaded
            ? balance.data["Data"]["TotalBalanceAccount"]
            : 0.0,
        hasTransactions: balanceDownloaded
            ? balance.data["Data"]["UserHasTransactions"]
            : false,
        riskProfile: profile,
        notAssignedBalance: balanceDownloaded
            ? balance.data["Data"]["NotAssignedBalance"]
            : 0.0,
      );
      _sharedPreferences.balance = userItem.balance;
      return userItem;
    } catch (e) {
      print("ERROR getUserInfo()===================================");
      print(e);
      return null;
    }
  }

  @override
  Future<double> getBalance() async {
    var balanceRest = await _dio.get(apiBalance);
    bool balanceDownloaded = balanceRest.data["Result"];
    double balance = 0.0;
    if (balanceDownloaded) {
      balance = balanceRest.data["Data"]["TotalBalanceAccount"];
    }
    return balance;
  }

  Future<DashboardTotalApprovedTransactionsItem>
      getTotalApprovedTransactions() async {
    try {
      DashboardTotalApprovedTransactionsItem responseService;
      var response = await _dio.get(apiApprovedTransactions);

      if (response.data["Data"] != null) {
        responseService = DashboardTotalApprovedTransactionsItem(
            isWithdrawal: response.data["Data"]["IsWithdrawal"],
            totalValue: response.data["Data"]["TotalValue"]);
      }

      return responseService;
    } catch (e) {
      print(
          "ERROR getTotalApprovedTransactions()===================================");
      print(e);
      return null;
    }
  }

  Future<bool> verifyUserUpdateSarlaft() async {
    try {
      var response = await _dio.get(apiVerifyUserUpdateSarlaft);
      if (response.data["Result"]) {
        _sharedPreferences.isValidUserUpdateSarlaft = true;
        return true;
      } else {
        _sharedPreferences.isValidUserUpdateSarlaft = false;
        return false;
      }
    } catch (e) {
      print("ERROR verifyUserUpdateSarlaft()");
      print(e);
      return null;
    }
  }

  Future getVideoUser() async {
    try {
      var response = await _dio.get(apiGetUserVideoStatus);
      print("aquii esta el getvideouser  ${response.data["Data"]}");
      return response.data["Data"];
    } catch (e) {
      print("ERROR verifyUserUpdateSarlaft()");
      print(e);
      return null;
    }
  }

  Future<UserInfo> consultUserSarlaft() async {
    try {
      String name = '';
      String email = '';
      String phoneNumber = '';
      String firstName = '';
      String fullName = '';
      SarlaftItem sarlaftItem = SarlaftItem.empty();

      if (_sharedPreferences.registerData != '') {
        final decoreDataUser = json.decode(_sharedPreferences.registerData);
        name = decoreDataUser["name"];
      }

      var dataUser = await _dio.get(apiConsultUserSarlaft);

      if (_sharedPreferences.userData != '') {
        final decoreUserData = json.decode(_sharedPreferences.userData);

        email = decoreUserData["Email"];
        phoneNumber = decoreUserData["PhoneNumber"];
        firstName = decoreUserData["FirstName"];
        name = name == '' ? decoreUserData["FirstName"] : name;
        fullName = decoreUserData["FullName"];
      }

      bool hasSarlaft = false;
      try {
        sarlaftItem = dataUser.data != null
            ? jsonToSarlaftItem(dataUser.data['Data'])
            : sarlaftItem;
        hasSarlaft = true;
      } catch (e) {
        print("EEEERROR cargando datos sarlaft");
      }

      UserInfo info = new UserInfo(
          fullName: fullName == '' ? name : fullName,
          firstName: firstName,
          email: email,
          phoneNumber: phoneNumber,
          sarlaftItem: sarlaftItem,
          hasSarlaft: hasSarlaft);

      return info;
    } catch (e) {
      print("ERROR getUserInfo()===================================");
      print(e);
      return null;
    }
  }


  Future VerifyTheInvestmentUser(value) async {
    try {

      var map = {
        'Amount': value,
        'Action': 4,
      };
      var response = await _dio.post(VerifyTheInvestment, data: json.encode(map));



      return response.data["Data"]["Message"];
    } catch (e) {
      print("ERROR VerifyTheInvestmentUser()===================================");
      print(e);
      return null;
    }
  }


  Future GetMaximumInvesment() async {
    try {


      var response = await _dio.get(GetMaximumInvesmentApi);



      return response.data["Data"];
    } catch (e) {
      print("ERROR GetMaximumInvesment()===================================");
      print(e);
      return null;
    }
  }

  Future VerifyTheInvestmentUserFirst() async {
    try {

      var map = {
        'Action': 5,
      };
      var response = await _dio.post(VerifyTheInvestment, data: json.encode(map));



      return response.data["Data"]["Message"];
    } catch (e) {
      print("ERROR VerifyTheInvestmentUser()===================================");
      print(e);
      return null;
    }
  }

  Future<NotificationValidRead> getNotifications() async {
    try {
      NotificationValidRead responseService;
      var response = await _dio.get(apiNotificationsRead);

      if (response.data["Result"]) {
        if (response.data["Data"] != null) {
          responseService = NotificationValidRead(
              notificationsIsRead: response.data["Data"]["TotalIsRead"],
              notificationsNotIsRead: response.data["Data"]["TotalNotIsRead"]);
        }
      }
      return responseService;
    } catch (e) {
      print("ERROR getNotifications()===================================");
      print(e);
      return null;
    }
  }

  SarlaftItem jsonToSarlaftItem(dynamic data) {
    print("este es todo el json de pep  ${data}");
    List<PepFamilyMember> pepList = [];
    for (var pep in data['PepList']) {
      pepList.add(PepFamilyMember(
        name: pep["Name"],
        lastNames: pep['LastNames'],
        identification: pep['Identification'],
        position: pep['Position'],
        parentType: pep['parentType'],
        identificationType: pep['IdentificationType'],
        pepType: pep['PepType'],
      ));
    }
    List<PayTaxesNotColombiaItem> txs = [];
    for (var tx in data['PayTaxesNotColombiaModel']) {
      txs.add(PayTaxesNotColombiaItem(
        countryId: tx['CountryId'],
        countryName: tx['CountryName'],
        identification: tx['Identification'],
        name: tx['Name'],
      ));
    }
    return SarlaftItem(
      partnerName: '',
      partnerType: '',
      partnerIdentification: '',
      address: data['Address'],
      cityResidenceId: data['CityResidenceId'],
      opccupationId: data['OccupationId'].toString(),
      ciiuCode: data['CiiuCode'],
      cityWorkId: data['CityWorkId'],
      workPlaceName: data['WorkPlaceName'],
      workAddress: data['WorkAddress'],
      workPhone: data['WorkPhone'],
      foundsOrigin: data['FoundsOrigin'],
      monthlyIncome: data['MonthlyIncome'],
      monthlyOutcome: data['MonthlyOutcome'],
      otherIncome: data['OthersIncome'],
      totalAssets: data['TotalAssets'],
      totalLiability: data['TotalLiabilities'],
      managesPublicResources: data['ManagesPublicResources'],
      isPep: data['IsPep'],
      hasPepRelationships: data['HasPepRelationships'],
      pepList: pepList,
      manageForeignCurrency: data['ManageForeignCurrency'],
      productForeignCurrencyList: [],
      ifPayTaxesNotColombia: data['IfPayTaxesNotColombia'],
      payTaxesNotColombiaModel: txs,
      receivePaymentsUs: data['ReceivePaymentsUs'],
      receiveIncomePropertyUs: data['ReceiveIncomePropertyUs'],
      permanencyInUs: data['PermanencyInUs'],
      citizenResidentUs: data['CitizenResidentUs'],
      itsGreenCard: data['ItsGreenCard'],
    );
  }

  Color getFundColorMx(int id) {
    switch (id) {
      case 46:
        return Color(0xFF41CF69);
        break;
      case 47:
        return Color(0xFF41CF69);
        break;
      case 48:
        return Color(0xFF41CF69);
        break;
      case 49:
        return Color(0xFF41CF69);
        break;
      case 50:
        return Color(0xFF104F83);
        break;
      case 51:
        return Color(0xFF104F83);
        break;
      case 52:
        return Color(0xFFea1d25);
        break;
      case 53:
        return Color(0xFFea1d25);
        break;
      default:
    }
  }

  Color getFundColorCol(int id) {
    switch (id) {
      case 25:
        return Color(0xFF5F7774);
        break;
      case 4:
        return AppColors.successColor;
        break;
      case 14:
        return Color(0xFFDE6012);
        break;
      case 10:
        return Color(0xFF104F83);
        break;
      case 5:
        return Color(0xFFD6DA5B);
        break;
      case 31:
        return Color(0xFF0083CB);
        break;
      case 35:
        return Color(0xFF1B2F4A);
        break;
      default:
    }
  }

  String getDescriptionFund(int value) {
    switch (value) {
      case 46: //SK-DCP
        return 'Instrumentos corto plazo Deuda gubernamental, privada y bancaria.';
      case 47: //SK-RVMX
        return 'Renta Variable Acciones Nacionales';
      case 48: //SK-RVST
        return 'Renta Variable Acciones Internacionales';
      case 49: //SK-DEST
        return 'Renta Fija';
      case 50: //SURUDI
        return 'Instrumentos de Deuda';
      case 51: //SURVEURBM
        return 'Renta Variable Internacional';
      case 52: //NTEMPG M7
        return 'Renta Fija Gubernamental';
      case 53: //SCOTIAGM4
        return 'Renta Fija Gubernamental';
        break;
      default:
        return '';
    }
  }
}
