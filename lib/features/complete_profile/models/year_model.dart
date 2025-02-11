// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class YearModel extends Equatable {
  final int id;
  final int year;
  const YearModel({
    required this.id,
    required this.year,
  });

  YearModel copyWith({
    int? id,
    int? year,
  }) {
    return YearModel(
      id: id ?? this.id,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'year': year,
    };
  }

  factory YearModel.fromMap(Map<String, dynamic> map) {
    return YearModel(
      id: map['id'] as int,
      year: map['year'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory YearModel.fromJson(String source) =>
      YearModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, year];
}
