import 'dart:convert';

ExtractModel extractModelFromJson(String str) => ExtractModel.fromJson(json.decode(str));

String extractModelToJson(ExtractModel data) => json.encode(data.toJson());

class ExtractModel {
    ExtractModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    List<Datum> data;

    factory ExtractModel.fromJson(Map<String, dynamic> json) => ExtractModel(
        result: json["Result"],
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.month,
        this.monthName,
        this.year,
        this.order,
        this.generated,
    });

    int month;
    String monthName;
    int year;
    int order;
    bool generated;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        month: json["Month"],
        monthName: json["MonthName"],
        year: json["Year"],
        order: json["Order"],
        generated: json["Generated"],
    );

    Map<String, dynamic> toJson() => {
        "Month": month,
        "MonthName": monthName,
        "Year": year,
        "Order": order,
        "Generated": generated,
    };
}
