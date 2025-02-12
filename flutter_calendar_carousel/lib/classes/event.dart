// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Event implements EventInterface {
  final DateTime date;
  final String? title;
  final String? description;
  final String? location;
  final Widget? icon;
  final Widget? dot;
  final int? id;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  Event({
    required this.date,
    this.title,
    this.description,
    this.location,
    this.icon,
    this.dot,
    this.id,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  bool operator ==(dynamic other) {
    return date == other.date &&
        title == other.title &&
        description == other.description &&
        location == other.location &&
        icon == other.icon &&
        dot == other.dot &&
        id == other.id &&
        textStyle == other.textStyle &&
        backgroundColor == other.backgroundColor;
  }

  @override
  int get hashCode => Object.hash(date, description, location, title, icon, id, backgroundColor, textStyle);

  @override
  DateTime getDate() {
    return date;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  Widget? getDot() {
    return dot;
  }

  @override
  Widget? getIcon() {
    return icon;
  }

  @override
  String? getTitle() {
    return title;
  }

  @override
  String? getDescription() {
    return description;
  }

  @override
  String? getLocation() {
    return location;
  }
}

abstract class EventInterface {
  DateTime getDate();
  String? getTitle();
  String? getDescription();
  String? getLocation();
  Widget? getIcon();
  Widget? getDot();
  int? getId();
}
