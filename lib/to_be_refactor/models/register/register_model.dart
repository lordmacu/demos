import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String name;
    String email;
    String phoneNumber;
    bool acceptTerms;

    RegisterModel({
        this.name,
        this.email,
        this.phoneNumber,
        this.acceptTerms,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        acceptTerms: json["acceptTerms"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "acceptTerms": acceptTerms,
    };
}
