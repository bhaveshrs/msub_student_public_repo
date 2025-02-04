import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var msgType = ["Assistance", "Enquiry", "Feedback"].obs;

  var mainCategory = ["Academics", "Administrative", "Technical", "Fee & Accounts", "Examinations"].obs;

  var categoryAcademic = ["Class Schedule Issues", "Assignment Queries", "Attendance Problems", "Curriculum Concerns", "Others"];
  var categoryAdministrative = ["Hostel Accommodation", "ID Card/Documentation", "Transportation Issues", "Campus Services", "Others"];
  var categoryTechnical = ["Login Issues", "App Bug/Crash", "Feature Not Working", "Connectivity Problems", "Others"];
  var categoryFeesAccounts = ["Payment Errors", "Missing Transactions", "Scholarship Queries", "Refund Requests", "Others"];
  var categoryExaminations = ["Schedule Conflicts", "Hall Ticket Problems", "Results/Grade Queries", "Revaluation Requests", "Others"];

  // Observables for selected values
  var selectedValue = Rxn<String>();
  var selectedValue1 = Rxn<String>();
  var selectedValue2 = Rxn<String>();

  // Method to get the appropriate category list dynamically
  List<String> getCategoryList() {
    switch (selectedValue1.value) {
      case "Academics":
        return categoryAcademic;
      case "Administrative":
        return categoryAdministrative;
      case "Technical":
        return categoryTechnical;
      case "Fee & Accounts":
        return categoryFeesAccounts;
      case "Examinations":
        return categoryExaminations;
      default:
        return [];
    }
  }

  TextEditingController descriptionController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
}
