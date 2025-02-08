// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class   RegisterResponseModel extends Equatable {
  final String? status;
  final int? code;
  final String? message;
  final String? token;

  const RegisterResponseModel({
    this.status,
    this.code,
    this.message,
    this.token,
  });
  
 

  RegisterResponseModel copyWith({
    String? status,
    int? code,
    String? message,
    String? token,
  }) {
    return RegisterResponseModel(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'code': code,
      'message': message,
      'token': token,
    };
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      status: map['status'] != null ? map['status'] as String : null,
      code: map['code'] != null ? map['code'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) => RegisterResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

   @override
  // TODO: implement props
  List<Object?> get props => [status, code, message, token];
}
