
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassesDetailsController extends GetxController{
  var selectedCategory = "All".obs;
  List<String> categories = ["Chat", "Files", "Assignments", "Syllabus" ];


  late TabController tabController;

  Color getCategoryColor(String category) {
    switch (category) {
      case "Chat":
        return Colors.purple;
      case "Files":
        return Colors.pink;
      case "Assignments":
        return Colors.orange;
      case "Syllabus":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}