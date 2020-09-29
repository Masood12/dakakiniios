// To parse this JSON data, do
//
//     final baseResponseModel = baseResponseModelFromJson(jsonString);

import 'dart:convert';

BaseResponseModel baseResponseModelFromJson(String str) => BaseResponseModel.fromJson(json.decode(str));

String baseResponseModelToJson(BaseResponseModel data) => json.encode(data.toJson());

class BaseResponseModel {
  BaseResponseModel({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
