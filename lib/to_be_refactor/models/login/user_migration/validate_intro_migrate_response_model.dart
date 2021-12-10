import 'dart:convert';

ValidateIntroMigrateResponseModel validateIntroMigrateResponseModelFromJson(String str) => ValidateIntroMigrateResponseModel.fromJson(json.decode(str));

String validateIntroMigrateResponseModelToJson(ValidateIntroMigrateResponseModel data) => json.encode(data.toJson());

class ValidateIntroMigrateResponseModel {
    ValidateIntroMigrateResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    Data data;

    factory ValidateIntroMigrateResponseModel.fromJson(Map<String, dynamic> json) => ValidateIntroMigrateResponseModel(
        result: json["Result"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    Data({
        this.validateIntroductory,
    });

    bool validateIntroductory;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        validateIntroductory: json["ValidateIntroductory"],
    );

    Map<String, dynamic> toJson() => {
        "ValidateIntroductory": validateIntroductory,
    };
}
