import 'dart:convert';

CreatePasswordModel createPasswordModelFromJson(String str) => CreatePasswordModel.fromJson(json.decode(str));
String createPasswordModelToJson(CreatePasswordModel data) => json.encode(data.toJson());

class CreatePasswordModel {

    String password;
    String confirmPassword;

    CreatePasswordModel({
        this.password,
        this.confirmPassword,
    });

    factory CreatePasswordModel.fromJson(Map<String, dynamic> json) => CreatePasswordModel(
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "confirmPassword": confirmPassword,
    };
}

CreatePasswordBdModel createPasswordBdModelFromJson(String str) => CreatePasswordBdModel.fromJson(json.decode(str));
String createPasswordBdModelToJson(CreatePasswordBdModel data) => json.encode(data.toJson());

class CreatePasswordBdModel {
    CreatePasswordBdModel({
        this.email,
        this.password,
        this.phoneNumber,
        this.platformId,
        this.deviceId,
        this.secureDevice,
        this.currentVersionInstall,
    });

    String email;
    String password;
    String phoneNumber;
    int platformId;
    String deviceId;
    String secureDevice;
    String currentVersionInstall;

    factory CreatePasswordBdModel.fromJson(Map<String, dynamic> json) => CreatePasswordBdModel(
        email: json["Email"],
        password: json["Password"],
        phoneNumber: json["PhoneNumber"],
        platformId: json["PlatformId"],
        deviceId: json["DeviceId"],
        secureDevice: json["SecureDevice"],
        currentVersionInstall: json["CurrentVersionInstall"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "PlatformId": platformId,
        "DeviceId": deviceId,
        "SecureDevice": secureDevice,
        "CurrentVersionInstall": currentVersionInstall,
    };
}
