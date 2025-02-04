import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/controller/profile_details_controller.dart';
import 'package:msub/widgets/size_space.dart';

class ProfileDetailsView extends StatelessWidget {
  final ProfileDetailsController controller = Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.white,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.profileIcon,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection("Personal Details", controller.isPersonalExpanded, [
                      buildDetailRow("Full Name", "Lorium Ipsum"),
                      buildDetailRow("Gender", "Male"),
                      buildDetailRow("Date of Birth", "DD/MM/YYYY"),
                      buildDetailRow("Marital Status", "Lorium Ipsum"),
                      buildDetailRow("Nationality", "Lorium Ipsum"),
                      buildDetailRow("Are you an NRI?", "Yes/No"),
                    ]),
                    buildSection("Contact Information", controller.isContactExpanded, [
                      buildDetailRow("Mobile Number", "+91 1234567899"),
                      buildDetailRow("Email Address", "abcd@gmail.com"),
                      buildDetailRow("Permanent Address", "Lorium Ipsum Lorium Ipsum 123456"),
                    ]),
                    buildSection("Family Details", controller.isFamilyExpanded, [
                      buildDetailRow("Father's Name", "Lorium Ipsum"),
                      buildDetailRow("Mother's Name", "Lorium Ipsum"),
                      buildDetailRow("Father's Occupation", "Lorium Ipsum"),
                      buildDetailRow("Mother's Occupation", "Lorium Ipsum"),
                      buildDetailRow("Family Annual Income", "Lorium Ipsum"),
                      buildDetailRow("Father's/Mother's Contact Number", "+91 1234567899"),
                    ]),
                    buildSection("Educational Details", controller.isEducationExpanded, [
                      buildDetailRow("Highest Level of Education Completed", "12th"),
                      buildDetailRow("School Board", "CBSE, ICSE, State Board, NIOS, etc."),
                      buildDetailRow("School Name", "Lorium Ipsum"),
                      buildDetailRow("Year of Passing", "2021"),
                      buildDetailRow("Percentage/CGPA", "100%"),
                    ]),
                    buildSection("Employment Details", controller.isEmploymentExpanded, [
                      buildDetailRow("Have you been employed previously?", "No"),
                    ]),
                    buildSection("Achievements", controller.isAchievementsExpanded, [
                      buildDetailRow("Level of Achievement", "Academic"),
                      buildDetailRow("Achievement Title", "Lorium Ipsum"),
                      buildDetailRow("Date of Achievement", "DD/MM/YYYY"),
                      buildDetailRow("Description (optional)", "Lorium Ipsum Lorium Ipsum"),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, RxBool isExpanded, List<Widget> children) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => isExpanded.value = !isExpanded.value,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Icon(isExpanded.value ? Icons.expand_less : Icons.expand_more, color: Colors.white),
                  ],
                ),
              ),
            ),
            if (isExpanded.value) ...children,
            const Height(height: 20)
          ],
        ));
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
