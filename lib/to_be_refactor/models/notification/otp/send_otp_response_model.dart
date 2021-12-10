import 'dart:convert';

SendOtpResponseModel sendOtpModelFromJson(String str) => SendOtpResponseModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpResponseModel data) => json.encode(data.toJson());

class SendOtpResponseModel {
    bool result;
    dynamic message;
    Data data;

    SendOtpResponseModel({
        this.result,
        this.message,
        this.data,
    });

    factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) => SendOtpResponseModel(
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
    String otpCode;
    dynamic content;
    dynamic response;
    String message;
    bool isValid;
    int httpStatusCode;
    dynamic result;

    Data({
        this.otpCode,
        this.content,
        this.response,
        this.message,
        this.isValid,
        this.httpStatusCode,
        this.result,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        otpCode: json["OtpCode"],
        content: json["Content"],
        response: json["Response"],
        message: json["Message"],
        isValid: json["IsValid"],
        httpStatusCode: json["HttpStatusCode"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "OtpCode": otpCode,
        "Content": content,
        "Response": response,
        "Message": message,
        "IsValid": isValid,
        "HttpStatusCode": httpStatusCode,
        "result": result,
    };
}
