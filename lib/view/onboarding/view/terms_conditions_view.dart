import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/status_messages.dart';
import 'package:msub/view/onboarding/view/complete_profile_view.dart';
import 'package:msub/widgets/custom_button.dart';

import '../../../common/services/launch_url.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/constants.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';
import '../controllers/terms_condition_controller.dart';

class TermsAndConditionsView extends StatelessWidget {
  final TermsController controller = Get.put(TermsController());

  TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.1),
                      bottomRight: Radius.circular(screenWidth * 0.1),
                    ),
                  ),
                ).paddingOnly(bottom: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_rounded, size: 30),
                      ),
                      const Row(
                        children: [
                          // Image.asset(Assets.announcementIcon, height: 25, width: 25),
                          SizedBox(width: 5),
                          CustomText("Terms & Conditions", fontSize: 24, fontWeight: FontWeight.w500),
                        ],
                      ),
                      const Width(width: 30),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            'University Code of Conduct Agreement',
                            fontSize: 18,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                          const Height(height: 10),
                          const Divider(
                            color: AppColors.grey,
                            thickness: 2,
                          ).paddingOnly(right: 70),
                          const Height(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomText(
                              'Our institution is dedicated to fostering a safe,\n'
                              'inclusive, and respectful environment. Please review and accept the following policies to proceed.',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          _policyText("Preamble",
                              "These terms establish the core guidelines for all students. Adherence to these rules is mandatory to maintain campus order and respect for university policies."),
                          _policyText("Jurisdiction",
                              "The University governs student behavior, enforcing strict measures against misconduct, including ragging or harassment on campus."),
                          _policyText("Code of Conduct",
                              "Students must follow the academic calendar, use Wi-Fi responsibly, park vehicles in designated areas, avoid water wastage, and refrain from unnecessary gatherings."),
                          _policyText("Academic Integrity",
                              "Uphold academic honesty, especially in research activities, following the guidelines in the university's research handbook."),
                          _policyText("Anti-Ragging & Anti-Harassment Policy",
                              "Ragging and racial harassment are strictly prohibited. Any such behavior will lead to immediate disciplinary action."),
                          _policyText("Disciplinary Rules",
                              "Non-academic activities require prior approval. Smoking, plastic use, and damage to infrastructure are prohibited. Cleanliness and punctuality are mandatory."),
                          _policyText("Resources Use",
                              "University resources are for official purposes only and must not be used for personal activities."),
                          _policyText("Grievance Redressal",
                              "Report any violations or grievances to the Grievance Cell. Misconduct will be addressed with appropriate actions."),
                          _policyText("Governance and Regulations",
                              "Students are encouraged to share suggestions to improve the university community and adhere to updates in academic and campus policies."),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Height(height: 20),
                        _checkBoxesSection(),
                        const Height(height: 40),
                        CustomButton(
                            onPressed: () {
                              if (controller.isChecked.value && controller.isAgreed.value) {
                                Get.to(() => CompleteProfileView());
                              } else {
                                showErrorMessage("Please select terms and policies ");
                              }
                            },
                            title: "I Agree & Continue")
                      ],
                    ),
                    const Height(height: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _policyText(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: const CustomText(
              '\u2022',
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Width(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Height(height: 5),

                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                ),
                // const Height(height: 5),
                //
                // const Text(
                //   'I agree to not engage in or encourage any such activities.',
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: AppColors.primary,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkBoxesSection() {
    return Column(
      children: [
        Obx(
          () => CheckboxListTile(
            value: controller.isChecked.value,
            activeColor: AppColors.primary,
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "I have read and understood ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: "the above policies.",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            onChanged: (value) => controller.toggleChecked(),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        Obx(
          () => CheckboxListTile(
            value: controller.isAgreed.value,
            activeColor: AppColors.primary,
            title: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "I agree to abide by ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: "these rules and acknowledge the consequences.",
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log("call");
                        UrlLauncherService.launchUrl(Constants.termsAndConditions);
                      },
                  ),
                ],
              ),
            ),
            onChanged: (value) => controller.toggleAgreed(),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
