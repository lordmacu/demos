import 'dart:convert';

RecoverPasswordRequestModel recoverPasswordRequestModelFromJson(String str) => RecoverPasswordRequestModel.fromJson(json.decode(str));
String recoverPasswordRequestModelToJson(RecoverPasswordRequestModel data) => json.encode(data.toJson());

class RecoverPasswordRequestModel {
    RecoverPasswordRequestModel({
        this.email,
    });

    String email;

    factory RecoverPasswordRequestModel.fromJson(Map<String, dynamic> json) => RecoverPasswordRequestModel(
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
    };
}
