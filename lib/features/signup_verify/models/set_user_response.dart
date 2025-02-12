// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SetUserResponse extends Equatable {
  final int? id;
  final String? email;
  final String? prnEmployeeId;
  final int? roleId;
  final String? name;
  final String? mobile;
  final String? image;
  final int? aadhaarNumber;
  final String? currentAddress;
  final String? permanentAddress;
  final int? countryId;
  final int? nationalityId;
  final String? dob;
  final bool? isVerified;
  final String? deviceId;
  final String? gender;
  final String? token;
  const SetUserResponse({
    this.id,
    this.email,
    this.prnEmployeeId,
    this.roleId,
    this.name,
    this.mobile,
    this.image,
    this.aadhaarNumber,
    this.currentAddress,
    this.permanentAddress,
    this.countryId,
    this.nationalityId,
    this.dob,
    this.isVerified,
    this.deviceId,
    this.gender,
    this.token,
  });

  SetUserResponse copyWith({
    int? id,
    String? email,
    String? prnEmployeeId,
    int? roleId,
    String? name,
    String? mobile,
    String? image,
    int? aadhaarNumber,
    String? currentAddress,
    String? permanentAddress,
    int? countryId,
    int? nationalityId,
    String? dob,
    bool? isVerified,
    String? deviceId,
    String? gender,
    String? token,
  }) {
    return SetUserResponse(
      id: id ?? this.id,
      email: email ?? this.email,
      prnEmployeeId: prnEmployeeId ?? this.prnEmployeeId,
      roleId: roleId ?? this.roleId,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      image: image ?? this.image,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      currentAddress: currentAddress ?? this.currentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      countryId: countryId ?? this.countryId,
      nationalityId: nationalityId ?? this.nationalityId,
      dob: dob ?? this.dob,
      isVerified: isVerified ?? this.isVerified,
      deviceId: deviceId ?? this.deviceId,
      gender: gender ?? this.gender,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'prn_employee_id': prnEmployeeId,
      'role_id': roleId,
      'name': name,
      'mobile': mobile,
      'image': image,
      'aadhaar_number': aadhaarNumber,
      'current_address': currentAddress,
      'permanent_address': permanentAddress,
      'country_id': countryId,
      'nationality_id': nationalityId,
      'dob': dob,
      'is_verified': isVerified,
      'device_id': deviceId,
      'gender': gender,
      'token': token,
    };
  }

  factory SetUserResponse.fromMap(Map<String, dynamic> map) {
    return SetUserResponse(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      prnEmployeeId:
          map['prn_employee_id'] != null ? map['prn_employee_id'] as String : null,
      roleId: map['role_id'] != null ? map['role_id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      aadhaarNumber:
          map['aadhaar_number'] != null ? map['aadhaar_number'] as int : null,
      currentAddress: map['current_address'] != null
          ? map['current_address'] as String
          : null,
      permanentAddress: map['permanent_address'] != null
          ? map['permanent_address'] as String
          : null,
      countryId: map['country_id'] != null ? map['country_id'] as int : null,
      nationalityId:
          map['nationality_id'] != null ? map['nationality_id'] as int : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      isVerified: map['is_verified'] != null ? map['is_verified'] as bool : null,
      deviceId: map['device_id'] != null ? map['device_id'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SetUserResponse.fromJson(String source) =>
      SetUserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      prnEmployeeId,
      roleId,
      name,
      mobile,
      image,
      aadhaarNumber,
      currentAddress,
      permanentAddress,
      countryId,
      nationalityId,
      dob,
      isVerified,
      deviceId,
      gender,
      token,
    ];
  }
}
