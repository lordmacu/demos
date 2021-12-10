import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {

    String emailPhone;
    String password;

    LoginModel({
        this.emailPhone,
        this.password,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        emailPhone: json["name"],
        password: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": emailPhone,
        "email": password,
    };
}
