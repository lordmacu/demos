import 'dart:convert';

ValidateOtpRequestModel validateOtpRequestModelFromJson(String str) => ValidateOtpRequestModel.fromJson(json.decode(str));

String validateOtpRequestModelToJson(ValidateOtpRequestModel data) => json.encode(data.toJson());

class ValidateOtpRequestModel {
    ValidateOtpRequestModel({
        this.to,
        this.code,
        //this.actionOtpType,
    });

    String to;
    String code;
  //  int actionOtpType;

    factory ValidateOtpRequestModel.fromJson(Map<String, dynamic> json) => ValidateOtpRequestModel(
        to: json["To"],
        code: json["Code"],
       // actionOtpType: json["ActionOtpType"],
    );

    Map<String, dynamic> toJson() => {
        "To": to,
        "Code": code,
        //"ActionOtpType": actionOtpType,
    };
}
