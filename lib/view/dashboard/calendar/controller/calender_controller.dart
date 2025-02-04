import 'package:get/get.dart';

class CalenderViewController extends GetxController {
  // Filter
  List<String> dateOption = ["Today", "Yesterday", "Last", "Custom"];
  List<String> sessionsOption = ["Morning Sessions", "Afternoon Sessions ", "Evening Sessions", "Custom Time Range"];
  List<String> facultyOptions = ["Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma"];
  List<String> moduleOption = ["Module 1", "Module 2", "Module 3", "Module 4"];
  List<String> options = ["Date", "Session", "Subject", "Module", "Faculty"];

  late final List<List<String>> filterOption = [dateOption, sessionsOption, dateOption, moduleOption, facultyOptions];

  int selectedIndex = 0;

  //

  var selectedDate = DateTime.now().obs;
  var events = ["Lorium Holiday", "Republic Day"].obs;

  // List of holiday dates
  final holidayDates = [
    DateTime(2024, 1, 10),
    DateTime(2024, 1, 26),
  ];

  String getMonthName(int month) {
    const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return monthNames[month - 1];
  }

  void onDateSelected(DateTime date) {
    selectedDate.value = date;

    // Update events based on the selected date
    if (date.day == 10 && date.month == 1) {
      events.value = ["Lorium Holiday"];
    } else if (date.day == 26 && date.month == 1) {
      events.value = ["Republic Day"];
    } else {
      events.value = ["No events for this date"];
    }
  }

  void onMonthChanged(DateTime focusedDay) {
    selectedDate.value = focusedDay;
  }
}
