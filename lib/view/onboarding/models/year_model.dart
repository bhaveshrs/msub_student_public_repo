// To parse this JSON data, do
//
//     final yearModel = yearModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final yearModel = yearModelFromJson(jsonString);

import 'dart:convert';

YearModel yearModelFromJson(String str) => YearModel.fromJson(json.decode(str));

String yearModelToJson(YearModel data) => json.encode(data.toJson());

class YearModel {
  String? status;
  int? code;
  String? message;
  List<YearDatum>? data;

  YearModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<YearDatum>.from(json["data"]!.map((x) => YearDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class YearDatum {
  int? id;
  int? year;

  YearDatum({
    this.id,
    this.year,
  });

  factory YearDatum.fromJson(Map<String, dynamic> json) => YearDatum(
    id: json["id"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
  };
}



