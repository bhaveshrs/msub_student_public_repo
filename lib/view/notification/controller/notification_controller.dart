import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<String> dateOption = ["Today", "Yesterday", "Last", "Custom"];
  List<String> sessionsOption = ["Morning Sessions", "Afternoon Sessions ", "Evening Sessions", "Custom Time Range"];
  List<String> facultyOptions = ["Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma"];
  List<String> moduleOption = ["Module 1", "Module 2", "Module 3", "Module 4"];
  List<String> options = ["Date", "Session", "Subject", "Module", "Faculty"];

  late final List<List<String>> filterOption = [dateOption, sessionsOption, dateOption, moduleOption, facultyOptions];

  int selectedIndex = 0;
}
