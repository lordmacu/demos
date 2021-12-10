import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  bool result;
  String message;
  String data;
  Map<String, dynamic> dataResponse;

  ResponseModel({
    this.result = false,
    this.message = '',
    this.data = '',
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        result: json["Result"],
        message: json["Message"],
        data: json["Data"],
      );
}
