import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    Data data;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
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
        this.token,
        this.user,
        this.userProfile,
        this.profileName,
    });

    String token;
    User user;
    dynamic userProfile;
    dynamic profileName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["Token"],
        user: User.fromJson(json["User"]),
        userProfile: json["userProfile"],
        profileName: json["profileName"],
    );

    Map<String, dynamic> toJson() => {
        "Token": token,
        "User": user.toJson(),
        "userProfile": userProfile,
        "profileName": profileName,
    };
}

class User {
    User({
        this.id,
        this.email,
        this.emailConfirmed,
        this.password,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.userName,
        this.firstName,
        this.middleName,
        this.lastName,
        this.secondLastName,
        this.identification,
        this.dateOfBirth,
        this.identificationType,
        this.customerLevel,
        this.deviceId,
        this.platformId,
        this.secureDevice,
        this.personType,
        this.createdDate,
        this.enrollDate,
        this.identityValidationDate,
        this.sarlafDate,
        this.evidenteDate,
        this.currentVersionInstall,
        this.validateIntroductory,
        this.finantialStatementMetadata,
        this.notificationLog,
        this.secureDeviceCode,
        this.userIdentification,
        this.userProfile,
        this.blackListConsult,
        this.faceValidation,
        this.hubspotUser,
        this.fullName,
        this.identificationTypeEnum,
        this.identificationTypeExperianApiEnum,
        this.personTypeEnum,
    });

    int id;
    String email;
    bool emailConfirmed;
    String password;
    String phoneNumber;
    bool phoneNumberConfirmed;
    bool twoFactorEnabled;
    String userName;
    String firstName;
    String middleName;
    String lastName;
    String secondLastName;
    String identification;
    DateTime dateOfBirth;
    int identificationType;
    int customerLevel;
    String deviceId;
    int platformId;
    String secureDevice;
    int personType;
    DateTime createdDate;
    dynamic enrollDate;
    dynamic identityValidationDate;
    dynamic sarlafDate;
    dynamic evidenteDate;
    String currentVersionInstall;
    bool validateIntroductory;
    List<dynamic> finantialStatementMetadata;
    List<dynamic> notificationLog;
    List<dynamic> secureDeviceCode;
    List<dynamic> userIdentification;
    List<dynamic> userProfile;
    List<dynamic> blackListConsult;
    List<dynamic> faceValidation;
    List<dynamic> hubspotUser;
    String fullName;
    int identificationTypeEnum;
    int identificationTypeExperianApiEnum;
    int personTypeEnum;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"],
        email: json["Email"],
        emailConfirmed: json["EmailConfirmed"],
        password: json["Password"],
        phoneNumber: json["PhoneNumber"],
        phoneNumberConfirmed: json["PhoneNumberConfirmed"],
        twoFactorEnabled: json["TwoFactorEnabled"],
        userName: json["UserName"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        secondLastName: json["SecondLastName"],
        identification: json["Identification"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        identificationType: json["IdentificationType"],
        customerLevel: json["CustomerLevel"],
        deviceId: json["DeviceId"],
        platformId: json["PlatformId"],
        secureDevice: json["SecureDevice"],
        personType: json["PersonType"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        enrollDate: json["EnrollDate"],
        identityValidationDate: json["IdentityValidationDate"],
        sarlafDate: json["SarlafDate"],
        evidenteDate: json["EvidenteDate"],
        currentVersionInstall: json["CurrentVersionInstall"],
        validateIntroductory: json["ValidateIntroductory"],
        finantialStatementMetadata: List<dynamic>.from(json["FinantialStatementMetadata"].map((x) => x)),
        notificationLog: List<dynamic>.from(json["NotificationLog"].map((x) => x)),
        secureDeviceCode: List<dynamic>.from(json["SecureDeviceCode"].map((x) => x)),
        userIdentification: List<dynamic>.from(json["UserIdentification"].map((x) => x)),
        userProfile: List<dynamic>.from(json["UserProfile"].map((x) => x)),
        blackListConsult: List<dynamic>.from(json["BlackListConsult"].map((x) => x)),
        faceValidation: List<dynamic>.from(json["FaceValidation"].map((x) => x)),
        hubspotUser: List<dynamic>.from(json["HubspotUser"].map((x) => x)),
        fullName: json["FullName"],
        identificationTypeEnum: json["IdentificationTypeEnum"],
        identificationTypeExperianApiEnum: json["IdentificationTypeExperianApiEnum"],
        personTypeEnum: json["PersonTypeEnum"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Email": email,
        "EmailConfirmed": emailConfirmed,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "PhoneNumberConfirmed": phoneNumberConfirmed,
        "TwoFactorEnabled": twoFactorEnabled,
        "UserName": userName,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "SecondLastName": secondLastName,
        "Identification": identification,
        "DateOfBirth": dateOfBirth.toIso8601String(),
        "IdentificationType": identificationType,
        "CustomerLevel": customerLevel,
        "DeviceId": deviceId,
        "PlatformId": platformId,
        "SecureDevice": secureDevice,
        "PersonType": personType,
        "CreatedDate": createdDate.toIso8601String(),
        "EnrollDate": enrollDate,
        "IdentityValidationDate": identityValidationDate,
        "SarlafDate": sarlafDate,
        "EvidenteDate": evidenteDate,
        "CurrentVersionInstall": currentVersionInstall,
        "ValidateIntroductory": validateIntroductory,
        "FinantialStatementMetadata": List<dynamic>.from(finantialStatementMetadata.map((x) => x)),
        "NotificationLog": List<dynamic>.from(notificationLog.map((x) => x)),
        "SecureDeviceCode": List<dynamic>.from(secureDeviceCode.map((x) => x)),
        "UserIdentification": List<dynamic>.from(userIdentification.map((x) => x)),
        "UserProfile": List<dynamic>.from(userProfile.map((x) => x)),
        "BlackListConsult": List<dynamic>.from(blackListConsult.map((x) => x)),
        "FaceValidation": List<dynamic>.from(faceValidation.map((x) => x)),
        "HubspotUser": List<dynamic>.from(hubspotUser.map((x) => x)),
        "FullName": fullName,
        "IdentificationTypeEnum": identificationTypeEnum,
        "IdentificationTypeExperianApiEnum": identificationTypeExperianApiEnum,
        "PersonTypeEnum": personTypeEnum,
    };
}
