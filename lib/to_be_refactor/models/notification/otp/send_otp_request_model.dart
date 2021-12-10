import 'dart:convert';

SendOtpRequestModel otpRequestModelFromJson(String str) => SendOtpRequestModel.fromJson(json.decode(str));

String otpRequestModelToJson(SendOtpRequestModel data) => json.encode(data.toJson());

class SendOtpRequestModel {
    SendOtpRequestModel({
        this.to,
        //this.code,
        this.actionOtpType,
    });

    String to;
    String code;
    int actionOtpType;

    factory SendOtpRequestModel.fromJson(Map<String, dynamic> json) => SendOtpRequestModel(
        to: json["To"],
        //code: json["Code"],
        actionOtpType: json["ActionOtpType"],
    );

    Map<String, dynamic> toJson() => {
        "To": to,
       // "Code": code,
        "ActionOtpType": actionOtpType,
    };
}
