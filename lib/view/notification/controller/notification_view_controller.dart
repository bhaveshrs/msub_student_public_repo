import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationViewOldController extends GetxController {
  var selectedCategory = "All".obs;
  List<String> categories = ["All", "Administrative", "Faculty", "Academic", "Sports"];

  var items = [
    {"category": "Administrative", "date": "11/04/2024", "description": "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis"},
    {
      "category": "Faculty",
      "date": "11/04/2024",
      "description": "Lorem ipsum dolor sit sagittis vitae sagittis nisl fringilla sem integer. Lacus est"
    },
    {"category": "Academic", "date": "11/04/2024", "description": "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis"},
    {"category": "Sports", "date": "11/04/2024", "description": "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum"},
  ].obs;

  List<Map<String, String>> get filteredItems {
    if (selectedCategory.value == "All") return items;
    return items.where((item) => item["category"] == selectedCategory.value).toList();
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case "Administrative":
        return Colors.purple;
      case "Faculty":
        return Colors.pink;
      case "Academic":
        return Colors.orange;
      case "Sports":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
