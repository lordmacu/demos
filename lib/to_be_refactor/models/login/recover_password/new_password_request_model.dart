import 'dart:convert';

NewPasswordRequestModel newPasswordRequestModelFromJson(String str) => NewPasswordRequestModel.fromJson(json.decode(str));

String newPasswordRequestModelToJson(NewPasswordRequestModel data) => json.encode(data.toJson());

class NewPasswordRequestModel {
    NewPasswordRequestModel({
        this.email,
        this.newPassword,
        this.confirmPassword,
    });

    String email;
    String newPassword;
    String confirmPassword;

    factory NewPasswordRequestModel.fromJson(Map<String, dynamic> json) => NewPasswordRequestModel(
        email: json["Email"],
        newPassword: json["NewPassword"],
        confirmPassword: json["ConfirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "NewPassword": newPassword,
        "ConfirmPassword": confirmPassword,
    };
}
