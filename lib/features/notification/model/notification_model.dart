// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:msub/features/notification/model/notification_data.dart';

class NotificationModel extends Equatable {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? perPage;
  final List<NotificationData>? data;
  const NotificationModel({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.perPage,
    this.data,
  });

  @override
  List<Object?> get props {
    return [
      currentPage,
      totalPages,
      totalItems,
      perPage,
      data,
    ];
  }

  NotificationModel copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    int? perPage,
    List<NotificationData>? data,
  }) {
    return NotificationModel(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      perPage: perPage ?? this.perPage,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'total_pages': totalPages,
      'total_items': totalItems,
      'per_page': perPage,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      totalItems: map['total_items'] != null ? map['total_items'] as int : null,
      perPage: map['per_page'] != null ? map['per_page'] as int : null,
      data: map['data'] != null
          ? List<NotificationData>.from(
              (map['data'] as List<dynamic>).map<NotificationData?>(
                (x) => NotificationData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
