import 'dart:convert';

RecoverPasswordModel recoverPasswordModelFromJson(String str) => RecoverPasswordModel.fromJson(json.decode(str));
String recoverPasswordModelToJson(RecoverPasswordModel data) => json.encode(data.toJson());

class RecoverPasswordModel {
    String emailPhone ;

    RecoverPasswordModel({
        this.emailPhone,
    });

    factory RecoverPasswordModel.fromJson(Map<String, dynamic> json) => RecoverPasswordModel(
        emailPhone: json["emailPhone"],
    );

    Map<String, dynamic> toJson() => {
        "emailPhone": emailPhone,
    };
}
