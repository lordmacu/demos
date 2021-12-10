import 'dart:convert';

EmailByPhoneRequestModel emailByPhoneRequestModelFromJson(String str) => EmailByPhoneRequestModel.fromJson(json.decode(str));

String emailByPhoneRequestModelToJson(EmailByPhoneRequestModel data) => json.encode(data.toJson());

class EmailByPhoneRequestModel {
    EmailByPhoneRequestModel({
        this.phone,
    });

    String phone;

    factory EmailByPhoneRequestModel.fromJson(Map<String, dynamic> json) => EmailByPhoneRequestModel(
        phone: json["Phone"],
    );

    Map<String, dynamic> toJson() => {
        "Phone": phone,
    };
}
