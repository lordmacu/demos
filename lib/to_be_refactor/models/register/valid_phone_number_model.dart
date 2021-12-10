import 'dart:convert';

ValidPhoneNumberModel validPhoneNumberModelFromJson(String str) => ValidPhoneNumberModel.fromJson(json.decode(str));

String validPhoneNumberModelToJson(ValidPhoneNumberModel data) => json.encode(data.toJson());

class ValidPhoneNumberModel {
    String phone;

    ValidPhoneNumberModel({
        this.phone,
    });

    factory ValidPhoneNumberModel.fromJson(Map<String, dynamic> json) => ValidPhoneNumberModel(
        phone: json["Phone"],
    );

    Map<String, dynamic> toJson() => {
        "Phone": phone,
    };
}
