import 'dart:convert';

RecoverPasswordResponseModel recoverPasswordResponseModelFromJson(String str) => RecoverPasswordResponseModel.fromJson(json.decode(str));
String recoverPasswordResponseModelToJson(RecoverPasswordResponseModel data) => json.encode(data.toJson());

class RecoverPasswordResponseModel {
    RecoverPasswordResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    String message;
    Data data;

    factory RecoverPasswordResponseModel.fromJson(Map<String, dynamic> json) => RecoverPasswordResponseModel(
        result: json["Result"],
        message: json["Message"],
        data: json["Data"] != null ? Data.fromJson(json["Data"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    Data({
        this.phoneNumber,
    });

    String phoneNumber;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        phoneNumber: json["PhoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "PhoneNumber": phoneNumber,
    };
}
