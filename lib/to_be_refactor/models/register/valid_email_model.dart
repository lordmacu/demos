import 'dart:convert';

ValidEmailModel validEmailModelFromJson(String str) => ValidEmailModel.fromJson(json.decode(str));

String validEmailModelToJson(ValidEmailModel data) => json.encode(data.toJson());

class ValidEmailModel {
    String email;

    ValidEmailModel({
        this.email,
    });

    factory ValidEmailModel.fromJson(Map<String, dynamic> json) => ValidEmailModel(
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
    };
}
