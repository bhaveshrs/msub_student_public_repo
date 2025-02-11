// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetUserModel extends Equatable {
  final String? prnEmployeeId;
  final String? name;
  final int? isVerified;
  final int? roleId;
  const GetUserModel({
    this.prnEmployeeId,
    this.name,
    this.isVerified,
    this.roleId,
  });

  GetUserModel copyWith({
    String? prnEmployeeId,
    String? name,
    int? isVerified,
    int? roleId,
  }) {
    return GetUserModel(
      prnEmployeeId: prnEmployeeId ?? this.prnEmployeeId,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
      roleId: roleId ?? this.roleId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prn_employee_id': prnEmployeeId,
      'name': name,
      'is_verified': isVerified,
      'role_id': roleId,
    };
  }

  factory GetUserModel.fromMap(Map<String, dynamic> map) {
    return GetUserModel(
      prnEmployeeId: map['prn_employee_id'] != null
          ? map['prn_employee_id'] as String
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      isVerified: map['is_verified'] != null ? map['is_verified'] as int : null,
      roleId: map['role_id'] != null ? map['role_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUserModel.fromJson(String source) =>
      GetUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [prnEmployeeId, name, isVerified, roleId];
}
