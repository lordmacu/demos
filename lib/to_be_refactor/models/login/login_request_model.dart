// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    String userName;
    String password;
    int platformId;
    String deviceId;
    String model;
    String machine;

    LoginRequestModel({
        this.userName,
        this.password,
        this.platformId,
        this.deviceId,
        this.model,
        this.machine
    });

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        userName: json["UserName"],
        password: json["Password"],
        platformId: json["PlatformId"],
        deviceId: json["DeviceId"],
        model: json["Model"],
        machine: json["Machine"],
    );

    Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
        "PlatformId": platformId,
        "DeviceId": deviceId,
        "Model": model,
        "Machine": machine
    };
}
