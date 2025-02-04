import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/widgets/app_dropdown.dart';
import 'package:msub/widgets/custom_button.dart';

import '../../../../widgets/custom_input_text.dart';
import '../../../../widgets/custom_text.dart';
import '../controller/report_controller.dart';

class ReportView extends StatelessWidget {
  ReportView({super.key});

  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.helpIcon,
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 5),
            const CustomText("Report an Issue", color: AppColors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Message Type Dropdown
            Obx(() => CommonDropdown(
                  isExpanded: true,
                  labelText: "Message Type",
                  items: controller.msgType,
                  selectedValue: controller.selectedValue.value,
                  onChanged: (value) {
                    controller.selectedValue.value = value;
                  },
                )),
            const SizedBox(height: 16),

            // Main Category Dropdown
            Obx(() => CommonDropdown(
                  isExpanded: true,
                  labelText: "Main Category",
                  items: controller.mainCategory,
                  selectedValue: controller.selectedValue1.value,
                  onChanged: (value) {
                    controller.selectedValue1.value = value;
                    // Clear the subcategory when the main category changes
                    controller.selectedValue2.value = null;
                  },
                )),
            const SizedBox(height: 16),

            // Category Dropdown (depends on Main Category)
            Obx(() => CommonDropdown(
                  isExpanded: true,
                  labelText: "Category",
                  items: controller.getCategoryList(),
                  selectedValue: controller.selectedValue2.value,
                  onChanged: (value) {
                    controller.selectedValue2.value = value;
                  },
                )),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: CustomButton(
            title: "Next",
            onPressed: () {
              Get.to(() => ReportIssueSecStep());
            },
          ),
        ),
      ),
    );
  }
}

class ReportIssueSecStep extends StatelessWidget {
  ReportIssueSecStep({super.key});

  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.helpIcon,
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 5),
            const CustomText("Report an Issue", color: AppColors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 19,
            ),
            CustomTextInput(
              prefixIcon: const IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: Text("+91 |")),
                  ],
                ),
              ),
              labelText: "Contact Number",
              onChanged: (value) {},
              controller: controller.contactNumberController,
              keyboardType: TextInputType.number,
              validator: (value) {
                return null;
              },
              validateOnInputChange: true,
              showValidationIcons: true,
            ),
            const SizedBox(height: 16),
            const CustomText(
              "Attach Files ",
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: CustomText(
                      "Upload File",
                      color: AppColors.inActive,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomTextInput(
              labelText: "Description",
              minLines: 6,
              onChanged: (value) {},
              controller: controller.descriptionController,
              keyboardType: TextInputType.text,
              hintText: "Type something here...",
              validator: (value) {
                return null;
              },
              validateOnInputChange: true,
              showValidationIcons: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: CustomButton(
            title: "Submit",
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
