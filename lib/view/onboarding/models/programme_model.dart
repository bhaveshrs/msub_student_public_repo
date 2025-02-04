// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);


import 'dart:convert';

ProgrammeModel programmeModelFromJson(String str) => ProgrammeModel.fromJson(json.decode(str));

String programmeModelToJson(ProgrammeModel data) => json.encode(data.toJson());

class ProgrammeModel {
  String? status;
  int? code;
  String? message;
  List<ProgramDatum>? data;

  ProgrammeModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory ProgrammeModel.fromJson(Map<String, dynamic> json) => ProgrammeModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ProgramDatum>.from(json["data"]!.map((x) => ProgramDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProgramDatum {
  int? id;
  String? name;

  ProgramDatum({
    this.id,
    this.name,
  });

  factory ProgramDatum.fromJson(Map<String, dynamic> json) => ProgramDatum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
