// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final int id;
  final String name;
  final String code;
  const CountryModel({
    required this.id,
    required this.name,
    required this.code,
  });

  CountryModel copyWith({
    int? id,
    String? name,
    String? code,
  }) {
    return CountryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, code];
}
