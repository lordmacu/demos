import 'dart:convert';

AppConfigurationResponseModel appConfigurationResponseModelFromJson(String str) => AppConfigurationResponseModel.fromJson(json.decode(str));

String appConfigurationResponseModelToJson(AppConfigurationResponseModel data) => json.encode(data.toJson());

class AppConfigurationResponseModel {
    AppConfigurationResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    Data data;

    factory AppConfigurationResponseModel.fromJson(Map<String, dynamic> json) => AppConfigurationResponseModel(
        result: json["Result"],
        message: json["Message"],
        data: json["Data"] != null ? Data.fromJson(json["Data"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.currentVersion,
        this.cdn,
        this.isOnline,
        this.messageToClient,
        this.applicationInsightKey,
        this.bankCommission,
        this.apiUrl,
        this.valueToShowEngagement,
        this.analyticsId,
        this.pseUrl,
        this.minPasswordLength,
        this.minMoneyValue,
        this.wsTimeout,
        this.bankRemoveCommission,
        this.minAgeToRegister,
        this.appName,
        this.minDayDate,
        this.maxValuePartialRemoveMoney,
        this.currentVersionIos,
        this.configOcr,
        this.bankCommissionDebit,
        this.versionParameterApp,
        this.updating
    });

    int id;
    String currentVersion;
    String cdn;
    bool isOnline;
    String messageToClient;
    String applicationInsightKey;
    double bankCommission;
    String apiUrl;
    double valueToShowEngagement;
    String analyticsId;
    String pseUrl;
    int minPasswordLength;
    double minMoneyValue;
    int wsTimeout;
    double bankRemoveCommission;
    int minAgeToRegister;
    String appName;
    int minDayDate;
    double maxValuePartialRemoveMoney;
    String currentVersionIos;
    int configOcr;
    double bankCommissionDebit;
    dynamic versionParameterApp;
    bool updating;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        currentVersion: json["CurrentVersion"],
        cdn: json["Cdn"],
        isOnline: json["IsOnline"],
        messageToClient: json["MessageToClient"],
        applicationInsightKey: json["ApplicationInsightKey"],
        bankCommission: json["BankCommission"],
        apiUrl: json["ApiUrl"],
        valueToShowEngagement: json["ValueToShowEngagement"],
        analyticsId: json["AnalyticsId"],
        pseUrl: json["PseUrl"],
        minPasswordLength: json["MinPasswordLength"],
        minMoneyValue: json["MinMoneyValue"],
        wsTimeout: json["WsTimeout"],
        bankRemoveCommission: json["BankRemoveCommission"],
        minAgeToRegister: json["MinAgeToRegister"],
        appName: json["AppName"],
        minDayDate: json["MinDayDate"],
        maxValuePartialRemoveMoney: json["MaxValuePartialRemoveMoney"],
        currentVersionIos: json["CurrentVersionIos"],
        configOcr: json["ConfigOcr"],
        bankCommissionDebit: json["BankCommissionDebit"],
        versionParameterApp: json["versionParameterApp"],
        updating: json["Updating"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CurrentVersion": currentVersion,
        "Cdn": cdn,
        "IsOnline": isOnline,
        "MessageToClient": messageToClient,
        "ApplicationInsightKey": applicationInsightKey,
        "BankCommission": bankCommission,
        "ApiUrl": apiUrl,
        "ValueToShowEngagement": valueToShowEngagement,
        "AnalyticsId": analyticsId,
        "PseUrl": pseUrl,
        "MinPasswordLength": minPasswordLength,
        "MinMoneyValue": minMoneyValue,
        "WsTimeout": wsTimeout,
        "BankRemoveCommission": bankRemoveCommission,
        "MinAgeToRegister": minAgeToRegister,
        "AppName": appName,
        "MinDayDate": minDayDate,
        "MaxValuePartialRemoveMoney": maxValuePartialRemoveMoney,
        "CurrentVersionIos": currentVersionIos,
        "ConfigOcr": configOcr,
        "BankCommissionDebit": bankCommissionDebit,
        "versionParameterApp": versionParameterApp,
        "Updating": updating,
    };
}
