import 'dart:convert';
import 'dart:math';

import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/user_verification/i_user_verification_repository.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserVerificationRepository)
class UserVerificationRepository implements IUserVerificationRepository {
  final Dio _dio;

  final apiUser = "/User";
  final apiGeneric = "/GenericData";
  final apiEvidente = "/Evidente";
  final String addScheduleTransactionApi =
      '/Transaction/ScheduleAutomaticDebit';
  final String pseApi = '/Transaction/GenerateTransactionUaletPse';

  UserVerificationRepository(this._dio);

  @override
  Future<Either<BaseFailure, UserInfoRegistraduria>> getRegistraduriaInfo(
      UserInfoRegistraduria userInfo) async {
    var data = await _dio.post("$apiUser/FindUserBlackList", data: {
      "tipoid": "${userInfo.idType}",
      "id": "${userInfo.id}",
      "papellido": userInfo.surname,
    });

    if (data.data["Result"]) {
      var naturalNacional = data.data["Data"]["naturalNacional"];
      var alertBlackList = data.data["Data"]["alerta"];

      String name = naturalNacional["nombres"];
      var identificacion = naturalNacional["identificacion"];
      List dateString =
          identificacion["ExpeditionDate"].split(" ")[0].split("/");
      DateTime expeditionDate = DateTime(int.parse(dateString[2]),
          int.parse(dateString[1]), int.parse(dateString[0]));

      UserInfoRegistraduria info = new UserInfoRegistraduria(
          firstName: name.split(" ")[0],
          secondName: name.split(" ").length > 1 ? name.split(" ")[1] : "",
          surname: naturalNacional["primerApellido"],
          secondSurname: naturalNacional["segundoApellido"],
          expeditionDate: expeditionDate,
          id: identificacion["Number"],
          idType: 1,
          birthDate: DateTime(expeditionDate.year - 18, expeditionDate.month,
              expeditionDate.day),
          blockedAlert: alertBlackList["blocked"] //Valid BlackList
          );
      return right(info);
    } else {
      return left(BaseFailure.fromServer(data.data["Message"]));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> getChangedDocument(String document) async {
    if (document.length > 5) {
      var data = await _dio.post("$apiUser/DocumentNumberAvailable",
          data: {"Identification": "${document}"});

      if (data.data["Result"]) {
        return right(true);
      } else {
        return right(false);
      }
    }
  }

  @override
  Future<UserVerificationState> setUpGenericData() async {
    var dataCountries = await _dio.get("$apiGeneric/AllCountries");
    List countries = dataCountries.data["Data"];
    List<String> countriesString = [];
    for (int i = 0; i < countries.length; i++) {
      countriesString.add(countries[i]["Text"]);
    }
    var dataIdType = await _dio.get("$apiGeneric/IdentificationType");
    List idTypes = dataIdType.data["Data"];
    List<String> idTypesString = [];
    for (int i = 0; i < idTypes.length; i++) {
      idTypesString.add(idTypes[i]["Text"]);
    }
    UserVerificationState info = new UserVerificationState(
      countries: countriesString,
      idTypes: idTypesString,
    );

    return info;
  }

  @override
  Future<Map<String, String>> getRegions(String countryId) async {
    var dataRegions = await _dio
        .get("$apiGeneric/GetCitiesByCountry?countryId=$countryId&search=");
    List regions = dataRegions.data["Data"];
    Map<String, String> regionsMap = {};
    for (int i = 0; i < regions.length; i++) {
      regionsMap[regions[i]["Value"]] = regions[i]["Text"];
    }

    return regionsMap;
  }

  @override
  Future<Either<BaseFailure, bool>> updateIdentification(
      UserInfoRegistraduria userInfo) async {
    var data = await _dio.post("$apiUser/UpdateIdentification", data: {
      "FirstName": userInfo.firstName,
      "MiddleName": userInfo.secondName,
      "LastName": userInfo.surname,
      "SecondLastName": userInfo.secondSurname,
      "ExpeditionPlaceId": userInfo.expeditionRegionId.toString(),
      "BirthPlaceId": userInfo.regionId.toString(),
      "IdentificationType": userInfo.idType.toString(),
      "Identification": userInfo.id,
      "ExpeditionDate": userInfo.expeditionDate.toIso8601String(),
      "BirthDate": userInfo.birthDate.toIso8601String(),
      "Gender": userInfo.genderId.toString(),
      "CountryId": userInfo.countryId.toString(),
    });

    if (data.data["Result"]) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer(data.data["Message"]));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> answerQuestions(
      List answers, String questionId, String record) async {
    List realAnswers = [];
    Map<String, String> answer;
    var realAnswer;
    for (int i = 0; i < answers.length; i++) {
      answer = answers[i];
      realAnswer = {
        "AnswerId": answer.values.toList()[0],
        "QuestionId": answer.keys.toList()[0]
      };
      realAnswers.add(realAnswer);
    }
    var data = await _dio.post("$apiEvidente/Answers",
        data: json.encode({
          "AnswerRequest": {
            "QuestionsId": questionId,
            "Record": record,
            "Answers": realAnswers,
          }
        }));
    if (data.data["Result"]) {
      return right(true);
    } else {
      return left(BaseFailure.fromServer(data.data["Message"]));
    }
  }

  @override
  Future<Either<BaseFailure, Map<String, List>>> getQuestions() async {
    var data = await _dio.get("$apiEvidente/Questions");
    if (data.data["Result"]) {
      List questions = data.data["Data"]["Pregunta"];
      String questionId = data.data["Data"]["id"];
      Map<String, List> questionData = {questionId: questions};
      String record = data.data['Data']['registro'];
      questionData[questionId].forEach((element) {
        print(element);
      });
      questionData['Record'] = [record];

      return right(questionData);
    } else {
      return left(BaseFailure.fromServer(data.data["Message"]));
    }
  }

  Future<Either<BaseFailure, bool>> scheduleDebit(
      BankAccountItem item, DashboardGoal goal) async {
    try {
      //Para que no quede en un fin de semana
      var day = goal.created.weekday;
      Duration theWknd = Duration(days: 0);
      if (day == 6) {
        theWknd = Duration(days: 2);
      } else if (day == 7) {
        theWknd = Duration(days: 1);
      }

      var data = {
        "Periodicity": goal.periodicity.toString(),
        "Value": goal.fee,
        "BankAccountId": item.id.toString(),
        "FirstDateApplication": goal.created.add(theWknd).toIso8601String(),
        "SecondDateApplication": goal.created
            .add(theWknd)
            .add(getDuration(goal.periodicity))
            .toIso8601String(),
      };
      var response =
          await _dio.post(addScheduleTransactionApi, data: json.encode(data));

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  Future<Either<BaseFailure, bool>> pseTransaction(double value) async {
    try {
      var data = {"Value": value};
      var response = await _dio.post(pseApi, data: json.encode(data));

      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data["Message"]));

      return right(true);
    } catch (e) {
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
}
