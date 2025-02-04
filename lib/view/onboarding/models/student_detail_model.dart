import 'dart:convert';

StudentDetailModel studentDetailModelFromJson(String str) => StudentDetailModel.fromJson(json.decode(str));

String studentDetailModelToJson(StudentDetailModel data) => json.encode(data.toJson());

class StudentDetailModel {
  String? status;
  int? code;
  String? message;
  Data? data;

  StudentDetailModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory StudentDetailModel.fromJson(Map<String, dynamic> json) => StudentDetailModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Auser? auser;

  Data({
    this.auser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        auser: json["auser"] == null ? null : Auser.fromJson(json["auser"]),
      );

  Map<String, dynamic> toJson() => {
        "auser": auser?.toJson(),
      };
}

class Auser {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? image;
  String? permanentAddress;
  int? countryId;
  int? nationalityId;
  DateTime? dob;
  String? deviceId;
  String? gender;
  GetAstudents? getAstudents;
  Country? country;
  Country? nationality;

  Auser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.image,
    this.permanentAddress,
    this.countryId,
    this.nationalityId,
    this.dob,
    this.deviceId,
    this.gender,
    this.getAstudents,
    this.country,
    this.nationality,
  });

  factory Auser.fromJson(Map<String, dynamic> json) => Auser(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        image: json["image"],
        permanentAddress: json["permanent_address"],
        countryId: json["country_id"],
        nationalityId: json["nationality_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        deviceId: json["device_id"],
        gender: json["gender"],
        getAstudents: json["get_astudents"] == null ? null : GetAstudents.fromJson(json["get_astudents"]),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        nationality: json["nationality"] == null ? null : Country.fromJson(json["nationality"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "image": image,
        "permanent_address": permanentAddress,
        "country_id": countryId,
        "nationality_id": nationalityId,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "device_id": deviceId,
        "gender": gender,
        "get_astudents": getAstudents?.toJson(),
        "country": country?.toJson(),
        "nationality": nationality?.toJson(),
      };
}

class Country {
  int? id;
  String? name;

  Country({
    this.id,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class GetAstudents {
  int? auserId;
  int? courseId;
  int? year;

  GetAstudents({
    this.auserId,
    this.courseId,
    this.year,
  });

  factory GetAstudents.fromJson(Map<String, dynamic> json) => GetAstudents(
        auserId: json["auser_id"],
        courseId: json["course_id"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "auser_id": auserId,
        "course_id": courseId,
        "year": year,
      };
}
