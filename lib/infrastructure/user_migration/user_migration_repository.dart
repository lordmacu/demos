import 'dart:convert';

import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/i_user_migration_repository.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:ualet/to_be_refactor/models/login/login_response_model.dart';
import 'package:ualet/to_be_refactor/services/Goals/emoji_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

@LazySingleton(as: IUserMigrationRepository)
class UserMigrationRepository implements IUserMigrationRepository {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;
  final apiUserMigrate = "/User/validateUserMigrate";
  final apiPostMigrations = "/User/migrateUser";
  final apiUpdateIntroductoryMigrate = "/User/UpdateIntroductoryMigrate";

  final apiBalance = "/User/GetBalance";

  final String cdn = "${EnvironmentConfig.cdnUrl}";

  final String getBanksApi = '/GenericData/AllBanks';

  UserMigrationRepository(this._dio, this._sharedPreferences);

  @override
  Future<Either<BaseFailure, KtList<UserMigrationItem>>>
      getUserMigrationItems() async {
    try {
      List<UserMigrationItem> list = List<UserMigrationItem>();

      var validUser = await _dio.get(apiUserMigrate);

      print({validUser.data["Result"], validUser.data["Data"]});

      if (!validUser.data["Result"] && validUser.data["Data"] != List) {
        var banksListResponse = await _dio.get(getBanksApi);
        var banksList = banksListResponse.data["Data"];
        List data = validUser.data["Data"];
        UserMigrationItem item;
        for (int i = 0; i < data.length; i++) {
          item = UserMigrationItem(
            id: data[i]["Id"],
            ualetAccountId: data[i]["UaletAccountId"],
            creationDate: DateTime.parse(data[i]["CreationDate"]),
            firstDateApplication:
                DateTime.parse(data[i]["FirstDateApplication"]),
            periodicity: data[i]["Periodicity"],
            updateDate: DateTime.parse(data[i]["UpdateDate"]),
            status: data[i]["Status"],
            bankAccountId: data[i]["BankAccountId"],
            bankName: data[i]["BankName"],
            bankAccountNumber: data[i]["BankAccountNumber"],
            value: data[i]["Value"],
            goalsChildren: data[i]["goalsChildren"],
            imgUrl: getUrl(data[i]["BankName"], banksList),
            bankAccountTypeName: data[i]["BankAccountTypeName"],
          );
          list.add(item);
        }
        return right(KtList.from(list));
      } else {
        return left(
            BaseFailure.fromServer('Usuario que no requiere migración'));
      }
    } catch (e) {
      print(e);
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> postUserMigration(
      UserMigrationState state) async {
    try {
      var emojis = await EmojiService().getEmojicategory().first;

      List<Map> lst = [];
      if (state.mensualesDone) {
        lst.add(goalToJson(state.goalMensuales, state.mensuales, emojis));
      }

      if (state.quincenalesDone) {
        lst.add(goalToJson(state.goalQuincenales, state.quincenales, emojis));
      }

      if (state.trimestralesDone) {
        lst.add(goalToJson(state.goalTrimestrales, state.trimestrales, emojis));
      }
      if (state.pseDone) {
        lst.add(goalToJson(state.goalPse, KtList.empty(), emojis));
      }

      var response =
          await _dio.post(apiPostMigrations, data: json.encode({"lst": lst}));
      if (response.data["Result"]) {
        return right(true);
      } else {
        return left(BaseFailure.fromServer(response.data['Message']));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> updateIntroductoryMigrate(
      bool valueParameter) async {
    try {
      var response =
          await _dio.get("$apiUpdateIntroductoryMigrate/$valueParameter");
      if (response.data["Result"]) {
        return right(true);
      } else {
        return left(BaseFailure.fromServer(response.data['Message']));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  Map goalToJson(DashboardGoal goal, KtList<UserMigrationItem> items,
      List<EmojiCategory> emojis) {
    var emojiId = 0;
    for (var cat in emojis) {
      for (var em in cat.emoji) {
        if (em.emojiName == goal.emoji.replaceAll(":", "")) emojiId = em.id;
      }
    }
    return {
      "emoji": emojiId,
      "nameGoal": goal.name,
      "totalValue": goal.goalAmt,
      "periodicity": goal.periodicity,
      "cuoteValue": goal.fee,
      "createdDate": DateTime.now().toIso8601String(),
      "monthNumber": goal.numMonths,
      "percentComplete": 0,
      "AutomaticDebitId":
          items.size > 0 ? items.map<int>((i) => i.id).asList() : [],
    };
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

  @override
  Future<BalanceItem> getBalance() async {
    var balance = await _dio.get(apiBalance);
    var usrData = User.fromJson(json.decode(_sharedPreferences.userData));
    bool balanceDownloaded = balance.data["Result"];
    String profile = _sharedPreferences.userProfile;
    if (profile == '') {
      try {
        profile = usrData.userProfile[0]['Profile']['Name'];
      } catch (e) {
        profile = '';
      }
    }

    BalanceItem item = BalanceItem(
        balance:
            balanceDownloaded ? balance.data["Data"]["AvailableBalance"] : 0.0,
        profileName: profile);

    return item;
  }

  @override
  Future<Either<BaseFailure, GoalItem>> postGoalMigration(
      GoalItem state) async {
    try {
      var emojis = await EmojiService().getEmojicategory().first;
      List<Map> lst = [];
      var emojiId = 0;
      for (var cat in emojis) {
        for (var em in cat.emoji) {
          if (em.emojiName == state.emoji.replaceAll(":", "")) emojiId = em.id;
        }
      }
      Map g = {
        "emoji": emojiId,
        "nameGoal": state.goalName,
        "totalValue": state.totalValue,
        "periodicity": state.periodicity,
        "cuoteValue": state.feeValue,
        "createdDate": DateTime.now().toIso8601String(),
        "monthNumber": state.numMonths,
        "percentComplete": 0,
        "AutomaticDebitId": [],
      };
      lst.add(g);

      var response =
          await _dio.post(apiPostMigrations, data: json.encode({"lst": lst}));
      if (response.data["Result"]) {
        return right(state);
      } else {
        return left(BaseFailure.fromServer(response.data['Message']));
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
