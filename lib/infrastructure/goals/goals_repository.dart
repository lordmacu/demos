import 'dart:convert';
import 'dart:io';

import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/to_be_refactor/services/Goals/emoji_service.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:kt_dart/collection.dart';

@LazySingleton(as: IGoalsRepository)
class GoalsRepository implements IGoalsRepository {
  final Dio _dio;

  final api = "/User/createGoalsVersion2";
  final updateApi = "/User/updateGoalsVersion2";
  final updateDebitApi =
      "/BankAccount/UpdateScheduleDebit";

  final apiGoals = "/User/getGoalsVersion2";

  GoalsRepository(this._dio);

  @override
  Future<Either<BaseFailure, GoalItem>> postGoal(GoalItem goal) async {
    var json = await _goalToJsonString(goal);
    try {
      var response = await _dio.post(api, data: json);
      var result = response.data["Result"];
      print(result);
      if (!result) {
        return left(BaseFailure.fromServer("Error enviando la meta"));
      }
      return right(goal);
    } on DioError catch (e) {
      print(e);
      return left(BaseFailure.fromServer("Error enviando la nueva meta"));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> updateGoal(GoalItem goal) async {
    var json = await _goalUpdateToJsonString(goal);
    try {
      var response = await _dio.put(updateApi, data: json);
      var result = response.data["Result"];
      print(result);
      if (!result) {
        return left(BaseFailure.fromServer("Error enviando la meta"));
      }
      return right(true);
    } on DioError catch (e) {
      print(e);
      return left(BaseFailure.fromServer("Error enviando la nueva meta"));
    }
  }

  Future<String> _goalToJsonString(GoalItem goal) async {
    Map jsonMap = {};
    var emojiId = 0;
    var emojis = await EmojiService().getEmojicategory().first;
    for (var cat in emojis) {
      for (var em in cat.emoji) {
        if (em.emojiName == goal.emoji.replaceAll(":", "")) emojiId = em.id;
      }
    }
    jsonMap['emoji'] = emojiId;
    // jsonMap['Id'] = goal.id;
    jsonMap['nameGoal'] = goal.goalName;
    jsonMap['totalValue'] = goal.totalValue;
    jsonMap['periodicity'] = goal.periodicity;
    jsonMap['createdDate'] = goal.createdDate.toIso8601String();
    jsonMap['monthNumber'] = goal.numMonths;
    jsonMap['percentComplete'] = 0;
    jsonMap['cuoteValue'] = goal.feeValue;
    jsonMap['automaticDebitList'] = [];
    return json.encode(jsonMap);
  }

  Future<String> _goalUpdateToJsonString(GoalItem goal) async {
    Map jsonMap = {};
    jsonMap['Id'] = goal.id;
    jsonMap['nameGoal'] = goal.goalName;
    jsonMap['totalValue'] = goal.totalValue;
    jsonMap['periodicity'] = goal.periodicity;
    jsonMap['cuoteValue'] = goal.feeValue;
    jsonMap['MonthNumber'] = goal.numMonths;
    return json.encode(jsonMap);
  }

  @override
  Future<Either<BaseFailure, bool>> editGoal(DashboardGoal goal) async {
    var json = await _dbgoalToJsonString(goal);
    try {
      var response = await _dio.put(updateApi, data: json);
      var result = response.data["Result"];
      print(result);
      if (!result) {
        return left(BaseFailure.fromServer("Error enviando la meta"));
      }
      return right(true);
    } on DioError catch (e) {
      print(e);
      return left(BaseFailure.fromServer("Error enviando la nueva meta"));
    }
  }

  Future<String> _dbgoalToJsonString(DashboardGoal goal) async {
    Map jsonMap = {};
    var emojiId = 0;
    var emojis = await EmojiService().getEmojicategory().first;
    for (var cat in emojis) {
      for (var em in cat.emoji) {
        if (em.emojiName == goal.emoji.replaceAll(":", "")) emojiId = em.id;
      }
    }
    jsonMap['emoji'] = emojiId;
    jsonMap['Id'] = goal.id;
    jsonMap['nameGoal'] = goal.name;
    jsonMap['totalValue'] = goal.goalAmt;
    jsonMap['periodicity'] = goal.periodicity;
    jsonMap['monthNumber'] = goal.numMonths;
    jsonMap['cuoteValue'] = goal.fee;
    return json.encode(jsonMap);
  }

  //TODO
  @override
  Future<Either<BaseFailure, bool>> editDebitWithGoals(int debitId,
      int periodicity, double value, List<DashboardGoal> goals) async {
    try {
      List<Map> goalsMap = [];
      goals.forEach((element) {
        print(_dbgoalToMap(element));
        goalsMap.add(_dbgoalToMap(element));
      });
      print(goalsMap);
      var data = {
        "id": debitId,
        "Periodicity": periodicity,
        "Value": value,
        
        "goalList": goalsMap,
      };
      var response = await _dio.put(updateDebitApi, data: json.encode(data));
      bool result = response.data['Result'];
      print(result);
      if (!result) {
        return left(BaseFailure.fromServer(response.data['Message']));
      } else {
        return right(true);
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  Map _dbgoalToMap(DashboardGoal goal) {
    Map jsonMap = {};
    jsonMap['Id'] = goal.id;
    jsonMap['nameGoal'] = goal.name;
    jsonMap['totalValue'] = goal.goalAmt;
    jsonMap['periodicity'] = goal.periodicity;
    jsonMap['monthNumber'] = goal.numMonths;
    jsonMap['cuoteValue'] = goal.fee;
    return jsonMap;
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
          currentAmt: g["GoalBalance"].length > 0
              ? g["GoalBalance"][0]["NetBalance"]
              : 0,
          emoji: await getEmoji(g['Emoji'], emojis),
          tieneDomiciliacionprogramada: g['automaticDebitList'].length > 0,
          fee: g['CuoteValue'],
          periodicity: g["Periodicity"],
          numMonths: g["MonthNumber"],
          percentComplete: g["percentComplete"],
          goalBalance: g["GoalBalance"],
          goalTransactions: g["GoalTransaction"],
          migrate: g["migrate"],
          created: DateTime.parse('${g["CreatedDate"]}'),
        );
        list.add(goal);
      }
      return KtList.from(list);
    } catch (e) {
      print("ERROR getGoals()===================================");
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

  @override
  Future<Either<BaseFailure, bool>> editGoalWithDebit(
      DashboardGoal goal, DebitInfo debit) async {
    var json = await _dbgoalWithDebitToJsonString(goal, debit);
    try {
      var response = await _dio.put(updateApi, data: json);
      var result = response.data["Result"];
      print(result);
      if (!result) {
        return left(BaseFailure.fromServer(response.data['Message']));
      }
      return right(true);
    } on DioError catch (e) {
      print(e);
      return left(BaseFailure.fromServer("Error enviando la nueva meta"));
    }
  }

  Future<String> _dbgoalWithDebitToJsonString(
      DashboardGoal goal, DebitInfo debit) async {
    Map jsonMap = {};
    var emojiId = 0;
    var emojis = await EmojiService().getEmojicategory().first;
    for (var cat in emojis) {
      for (var em in cat.emoji) {
        if (em.emojiName == goal.emoji.replaceAll(":", "")) emojiId = em.id;
      }
    }
    jsonMap['emoji'] = emojiId;
    jsonMap['id'] = goal.id;
    jsonMap['nameGoal'] = goal.name;
    jsonMap['totalValue'] = goal.goalAmt;
    jsonMap['periodicity'] = goal.periodicity;
    jsonMap['monthNumber'] = goal.numMonths;
    jsonMap['cuoteValue'] = goal.fee;
    jsonMap['automaticDebitList'] = [
      {"Id": debit.id, "Periodicity": goal.periodicity, "Value": debit.value}
    ];
    return json.encode(jsonMap);
  }
}
