import 'dart:convert';

SendEmailRequestModel sendEmailRequestModelModelFromJson(String str) => SendEmailRequestModel.fromJson(json.decode(str));

String sendEmailRequestModelModelToJson(SendEmailRequestModel data) => json.encode(data.toJson());

class SendEmailRequestModel {
    String email;

    SendEmailRequestModel({
        this.email,
    });

    factory SendEmailRequestModel.fromJson(Map<String, dynamic> json) => SendEmailRequestModel(
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
    };
}
