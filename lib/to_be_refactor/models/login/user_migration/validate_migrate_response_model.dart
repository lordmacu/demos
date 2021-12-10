// To parse this JSON data, do
//
//     final validateMigrateResponseModel = validateMigrateResponseModelFromJson(jsonString);

import 'dart:convert';

ValidateMigrateResponseModel validateMigrateResponseModelFromJson(String str) => ValidateMigrateResponseModel.fromJson(json.decode(str));

String validateMigrateResponseModelToJson(ValidateMigrateResponseModel data) => json.encode(data.toJson());

class ValidateMigrateResponseModel {
    ValidateMigrateResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    String message;
    List<Datum> data;

    factory ValidateMigrateResponseModel.fromJson(Map<String, dynamic> json) => ValidateMigrateResponseModel(
        result: json["Result"],
        message: json["Message"],
        data: json["Data"] != "" ? List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))) : null,
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.ualetAccountId,
        this.creationDate,
        this.firstDateApplication,
        this.secondDateApplication,
        this.periodicity,
        this.updateDate,
        this.status,
        this.bankAccountId,
        this.bankName,
        this.bankAccountNumber,
        this.value,
        this.goalsChildren,
    });

    int id;
    int ualetAccountId;
    DateTime creationDate;
    DateTime firstDateApplication;
    dynamic secondDateApplication;
    int periodicity;
    DateTime updateDate;
    int status;
    int bankAccountId;
    String bankName;
    String bankAccountNumber;
    double value;
    List<dynamic> goalsChildren;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        ualetAccountId: json["UaletAccountId"],
        creationDate: DateTime.parse(json["CreationDate"]),
        firstDateApplication: DateTime.parse(json["FirstDateApplication"]),
        secondDateApplication: json["SecondDateApplication"],
        periodicity: json["Periodicity"],
        updateDate: DateTime.parse(json["UpdateDate"]),
        status: json["Status"],
        bankAccountId: json["BankAccountId"],
        bankName: json["BankName"],
        bankAccountNumber: json["BankAccountNumber"],
        value: json["Value"],
        goalsChildren: List<dynamic>.from(json["goalsChildren"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "UaletAccountId": ualetAccountId,
        "CreationDate": creationDate.toIso8601String(),
        "FirstDateApplication": firstDateApplication.toIso8601String(),
        "SecondDateApplication": secondDateApplication,
        "Periodicity": periodicity,
        "UpdateDate": updateDate.toIso8601String(),
        "Status": status,
        "BankAccountId": bankAccountId,
        "BankName": bankName,
        "BankAccountNumber": bankAccountNumber,
        "Value": value,
        "goalsChildren": List<dynamic>.from(goalsChildren.map((x) => x)),
    };
}
