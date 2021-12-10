// To parse this JSON data, do
//
//     final GoalModel = GoalModelFromJson(jsonString);

import 'dart:convert';

GoalModel goalModelFromJson(String str) => GoalModel.fromJson(json.decode(str));

String goalModelToJson(GoalModel data) => json.encode(data.toJson());

class GoalModel {
    GoalModel({
        this.emoji,
        this.nameGoal,
        this.totalValue,
        this.periodicity,
        this.cuoteValue,
        this.createdDate,
        this.monthNumber,
    });

    String emoji;
    String nameGoal;
    double totalValue;
    int periodicity;
    double cuoteValue;
    DateTime createdDate;
    int monthNumber;

    factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        emoji: json["emoji"],
        nameGoal: json["nameGoal"],
        totalValue: json["totalValue"],
        periodicity: json["periodicity"],
        cuoteValue: json["cuoteValue"],
        createdDate: DateTime.parse(json["createdDate"]),
        monthNumber: json["monthNumber"],
    );

    Map<String, dynamic> toJson() => {
        "emoji": emoji,
        "nameGoal": nameGoal,
        "totalValue": totalValue,
        "periodicity": periodicity,
        "cuoteValue": cuoteValue,
        "createdDate": "",
        "monthNumber": monthNumber,
    };
}
