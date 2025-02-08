// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequestModel {
  String? deviceId;
  String? email;
  String? password;
  RegisterRequestModel({
    this.deviceId,
    this.email,
    this.password,
  });
  RegisterRequestModel copyWith({
    String? deviceId,
    String? email,
    String? password,
  }) {
    return RegisterRequestModel(
      deviceId: deviceId ?? this.deviceId,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
   
    if (deviceId != null) {
      map['device_id'] = deviceId;
    }
    if (email != null) {
      map['email'] = email;
    }
    if (password != null) {
      map['password'] = password;
    }
    return map;
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      deviceId: map['device_id'] != null ? map['device_id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
  String toJson() => json.encode(toMap());
  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));


  @override
  String toString() {
    return 'RegisterRequestModel(deviceId: $deviceId,  email: $email, password: $password)';
  }
}
