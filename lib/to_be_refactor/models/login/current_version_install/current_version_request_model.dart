import 'dart:convert';

CurrentVersionInstallRequestModel currentVersionInstallRequestModelFromJson(String str) => CurrentVersionInstallRequestModel.fromJson(json.decode(str));

String currentVersionInstallRequestModelToJson(CurrentVersionInstallRequestModel data) => json.encode(data.toJson());

class CurrentVersionInstallRequestModel {
    CurrentVersionInstallRequestModel({
        this.currentVersionInstall,
    });

    String currentVersionInstall;

    factory CurrentVersionInstallRequestModel.fromJson(Map<String, dynamic> json) => CurrentVersionInstallRequestModel(
        currentVersionInstall: json["CurrentVersionInstall"],
    );

    Map<String, dynamic> toJson() => {
        "CurrentVersionInstall": currentVersionInstall,
    };
}
