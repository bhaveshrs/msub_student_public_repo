import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_dropdown.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({super.key});

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  List<String> msgType = ["Assistance", "Enquiry", "Feedback"];

  List<String> mainCategory = [
    "Academics",
    "Administrative",
    "Technical",
    "Fee & Accounts",
    "Examinations"
  ];

  List<String> categoryAcademic = [
    "Class Schedule Issues",
    "Assignment Queries",
    "Attendance Problems",
    "Curriculum Concerns",
    "Others"
  ];
  List<String> categoryAdministrative = [
    "Hostel Accommodation",
    "ID Card/Documentation",
    "Transportation Issues",
    "Campus Services",
    "Others"
  ];
  List<String> categoryTechnical = [
    "Login Issues",
    "App Bug/Crash",
    "Feature Not Working",
    "Connectivity Problems",
    "Others"
  ];
  List<String> categoryFeesAccounts = [
    "Payment Errors",
    "Missing Transactions",
    "Scholarship Queries",
    "Refund Requests",
    "Others"
  ];
  List<String> categoryExaminations = [
    "Schedule Conflicts",
    "Hall Ticket Problems",
    "Results/Grade Queries",
    "Revaluation Requests",
    "Others"
  ];

  String? selectedValue;

  String? selectedValue1;

  String? selectedValue2;

  @override
  Widget build(BuildContext context) {
    List<String> getCategoryList() {
      switch (selectedValue1) {
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.helpAppBar),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Report an Issue",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            CommonDropdown(
                isExpanded: true,
                labelText: "Message Type",
                items: msgType,
                selectedValue: selectedValue,
                onChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                }),
            const SizedBox(
              height: 16,
            ),
            CommonDropdown(
                isExpanded: true,
                labelText: "Main Category",
                items: mainCategory,
                selectedValue: selectedValue1,
                onChanged: (value) {
                  selectedValue1 = value;
                  setState(() {});
                }),
            const SizedBox(
              height: 16,
            ),
            CommonDropdown(
                isExpanded: true,
                labelText: "Category",
                items: getCategoryList(),
                selectedValue: selectedValue2,
                onChanged: (value) {
                  selectedValue2 = value;
                  setState(() {});
                }),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ) +
            const EdgeInsets.only(bottom: 10),
        child: AppButton(
            buttonName: "Next",
            onPress: () {
              context.pushNamed(AppRouteNames.reportIssueSecStep);
            }),
      )),
    );
  }
}
