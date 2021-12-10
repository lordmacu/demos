import 'dart:convert';

IndexRegisterModel indexRegisterModelFromJson(String str) =>
    IndexRegisterModel.fromJson(json.decode(str));
String indexRegisterModelToJson(IndexRegisterModel data) =>
    json.encode(data.toJson());

class IndexRegisterModel {
  String email;
  String password;
  String phoneNumber;
  String emailRegister;

  IndexRegisterModel({
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.emailRegister = '',
  });

  factory IndexRegisterModel.fromJson(Map<String, dynamic> json) =>
      IndexRegisterModel(
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        emailRegister: json["emailRegister"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "emailRegister": emailRegister,
      };
}
