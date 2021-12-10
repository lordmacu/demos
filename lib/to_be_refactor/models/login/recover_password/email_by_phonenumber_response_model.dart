import 'dart:convert';

EmailByPhoneResponseModel emailByPhoneResponseModelFromJson(String str) => EmailByPhoneResponseModel.fromJson(json.decode(str));

String emailByPhoneResponseModelToJson(EmailByPhoneResponseModel data) => json.encode(data.toJson());

class EmailByPhoneResponseModel {
    EmailByPhoneResponseModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    String message;
    Data data;

    factory EmailByPhoneResponseModel.fromJson(Map<String, dynamic> json) => EmailByPhoneResponseModel(
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
        this.email,
    });

    String email;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
    };
}
