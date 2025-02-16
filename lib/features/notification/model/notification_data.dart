// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationData extends Equatable {
  final int? id;
  final String? userTypeId;
  final String? subjectId;
  final String? yearId;
  final String? courseId;
  final String? buildingId;
  final int? announcementCategoryId;
  final String? title;
  final String? message;
  final String? filePath;
  final String? sandAt;
  final String? status;
  final int? createdBy;
  final int? isRead;
  final String? createdAt;
  final String? updatedAt;
  final String? gender;
  final String? shift;
  final String? departmentId;
  final String? year;
  final String? announcementcategory;
  final String? userType;
  final String? course;
  final String? building;
  final Creator? creator;
  final String? subjects;
  const NotificationData({
    this.id,
    this.userTypeId,
    this.subjectId,
    this.yearId,
    this.courseId,
    this.buildingId,
    this.announcementCategoryId,
    this.title,
    this.message,
    this.filePath,
    this.sandAt,
    this.status,
    this.createdBy,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.shift,
    this.departmentId,
    this.year,
    this.announcementcategory,
    this.userType,
    this.course,
    this.building,
    this.creator,
    this.subjects,
  });

  @override
  List<Object?> get props {
    return [
      id,
      userTypeId,
      subjectId,
      yearId,
      courseId,
      buildingId,
      announcementCategoryId,
      title,
      message,
      filePath,
      sandAt,
      status,
      createdBy,
      isRead,
      createdAt,
      updatedAt,
      gender,
      shift,
      departmentId,
      year,
      announcementcategory,
      userType,
      course,
      building,
      creator,
      subjects,
    ];
  }

  NotificationData copyWith({
    int? id,
    String? userTypeId,
    String? subjectId,
    String? yearId,
    String? courseId,
    String? buildingId,
    int? announcementCategoryId,
    String? title,
    String? message,
    String? filePath,
    String? sandAt,
    String? status,
    int? createdBy,
    int? isRead,
    String? createdAt,
    String? updatedAt,
    String? gender,
    String? shift,
    String? departmentId,
    String? year,
    String? announcementcategory,
    String? userType,
    String? course,
    String? building,
    Creator? creator,
    String? subjects,
  }) {
    return NotificationData(
      id: id ?? this.id,
      userTypeId: userTypeId ?? this.userTypeId,
      subjectId: subjectId ?? this.subjectId,
      yearId: yearId ?? this.yearId,
      courseId: courseId ?? this.courseId,
      buildingId: buildingId ?? this.buildingId,
      announcementCategoryId:
          announcementCategoryId ?? this.announcementCategoryId,
      title: title ?? this.title,
      message: message ?? this.message,
      filePath: filePath ?? this.filePath,
      sandAt: sandAt ?? this.sandAt,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      gender: gender ?? this.gender,
      shift: shift ?? this.shift,
      departmentId: departmentId ?? this.departmentId,
      year: year ?? this.year,
      announcementcategory: announcementcategory ?? this.announcementcategory,
      userType: userType ?? this.userType,
      course: course ?? this.course,
      building: building ?? this.building,
      creator: creator ?? this.creator,
      subjects: subjects ?? this.subjects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_type_id': userTypeId,
      'subject_id': subjectId,
      'year_id': yearId,
      'course_id': courseId,
      'building_id': buildingId,
      'announcement_category_id': announcementCategoryId,
      'title': title,
      'message': message,
      'file_path': filePath,
      'sand_at': sandAt,
      'status': status,
      'created_by': createdBy,
      'is_read': isRead,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'gender': gender,
      'shift': shift,
      'department_id': departmentId,
      'year': year,
      'announcementcategory': announcementcategory,
      'userType': userType,
      'course': course,
      'building': building,
      'creator': creator?.toMap(),
      'subjects': subjects,
    };
  }

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
      id: map['id'] != null ? map['id'] as int : null,
      userTypeId:
          map['user_type_id'] != null ? map['user_type_id'] as String : null,
      subjectId: map['subject_id'] != null ? map['subject_id'] as String : null,
      yearId: map['year_id'] != null ? map['year_id'] as String : null,
      courseId: map['course_id'] != null ? map['course_id'] as String : null,
      buildingId:
          map['building_id'] != null ? map['building_id'] as String : null,
      announcementCategoryId: map['announcement_category_id'] != null
          ? map['announcement_category_id'] as int
          : null,
      title: map['title'] != null ? map['title'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      filePath: map['file_path'] != null ? map['file_path'] as String : null,
      sandAt: map['sand_at'] != null ? map['sand_at'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      createdBy: map['created_by'] != null ? map['created_by'] as int : null,
      isRead: map['is_read'] != null ? map['is_read'] as int : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      shift: map['shift'] != null ? map['shift'] as String : null,
      departmentId:
          map['department_id'] != null ? map['department_id'] as String : null,
      year: map['year'] != null ? map['year'] as String : null,
      announcementcategory: map['announcementcategory'] != null
          ? map['announcementcategory'] as String
          : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      course: map['course'] != null ? map['course'] as String : null,
      building: map['building'] != null ? map['building'] as String : null,
      creator: map['creator'] != null
          ? Creator.fromMap(map['creator'] as Map<String, dynamic>)
          : null,
      subjects: map['subjects'] != null ? map['subjects'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationData.fromJson(String source) =>
      NotificationData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Creator extends Equatable {
  final int? id;
  final String? name;
  const Creator({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  Creator copyWith({
    int? id,
    String? name,
  }) {
    return Creator(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Creator.fromJson(String source) =>
      Creator.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
