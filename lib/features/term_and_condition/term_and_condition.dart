import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class ConductAgreementScreen extends StatefulWidget {
  const ConductAgreementScreen({super.key});

  @override
  _ConductAgreementScreenState createState() => _ConductAgreementScreenState();
}

class _ConductAgreementScreenState extends State<ConductAgreementScreen> {
  bool _hasReadPolicies = false;
  bool _agreesToRules = false;

  final List<Map<String, String>> policies = [
    {
      "title": "Preamble",
      "description":
          "These terms establish the core guidelines for all students. Adherence to these rules is mandatory to maintain campus order and respect for university policies."
    },
    {
      "title": "Jurisdiction",
      "description":
          "The University governs student behavior, enforcing strict measures against misconduct, including ragging or harassment on campus."
    },
    {
      "title": "Code of Conduct",
      "description":
          "Students must follow the academic calendar, use Wi-Fi responsibly, park vehicles in designated areas, avoid water wastage, and refrain from unnecessary gatherings."
    },
    {
      "title": "Academic Integrity",
      "description":
          "Uphold academic honesty, especially in research activities, following the guidelines in the university's research handbook."
    },
    {
      "title": "Anti-Ragging & Anti-Harassment Policy",
      "description":
          "Ragging and racial harassment are strictly prohibited. Any such behavior will lead to immediate disciplinary action."
    },
    {
      "title": "Disciplinary Rules",
      "description":
          "Non-academic activities require prior approval. Smoking, plastic use, and damage to infrastructure are prohibited. Cleanliness and punctuality are mandatory."
    },
    {
      "title": "Resources Use",
      "description":
          "University resources are for official purposes only and must not be used for personal activities."
    },
    {
      "title": "Grievance Redressal",
      "description":
          "Report any violations or grievances to the Grievance Cell. Misconduct will be addressed with appropriate actions."
    },
    {
      "title": "Governance and Regulations",
      "description":
          "Students are encouraged to share suggestions to improve the university community and adhere to updates in academic and campus policies."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.white2,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     if (widget.isFormNotification) {
        //       context.go(AppRouteNames.dashboardRoute);
        //     } else if (context.canPop()) {
        //       context.pop();
        //       print("allalaal");
        //     }
        //   },
        // ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: Image.asset(AppImages.announcement),
            ),
            // SvgPicture.asset(AppImages.bell),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Terms & Conditions",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "University Code of Conduct Agreement",
                        style:
                            AppTextStyles.rob16Medium(color: MyAppColors.blue3),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: MyAppColors.inActiveText,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Our institution is dedicated to fostering a safe, inclusive, and respectful environment. Please review and accept the following policies to proceed.",
                        style: AppTextStyles.pop12ExLite(),
                      ),
                      const SizedBox(height: 16),
                      _buildPolicyList(),

                      // _buildCheckbox(
                      //   text: "I have read and understood the above policies.",
                      //   value: _hasReadPolicies,
                      //   onChanged: (bool? value) {
                      //     setState(() {
                      //       _hasReadPolicies = value ?? false;
                      //     });
                      //   },
                      // ),
                      // _buildCheckbox(
                      //   text:
                      //       "I agree to abide by these rules and acknowledge the consequences of violations.",
                      //   value: _agreesToRules,
                      //   onChanged: (bool? value) {
                      //     setState(() {
                      //       _agreesToRules = value ?? false;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildCustomCheckbox(
                  text: "I have read and understood the above policies.",
                  value: _hasReadPolicies,
                  onChanged: (bool? value) {
                    setState(() {
                      _hasReadPolicies = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 12),
                _buildCustomCheckbox(
                  text:
                      "I agree to abide by these rules and acknowledge the consequences of violations.",
                  value: _agreesToRules,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreesToRules = value ?? false;
                    });
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                AppButton(
                  buttonName: "I Agree & Continue",
                  onPress: () {
                    if ((_hasReadPolicies && _agreesToRules)) {
                      context.go(AppRouteNames.completeProfileRoute);
                    }
                  },
                  buttonColor: (_hasReadPolicies && _agreesToRules)
                      ? MyAppColors.blue3
                      : MyAppColors.inActiveBtn,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPolicyList() {
    return Column(
      children: policies
          .map((policy) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0) +
                    const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ${policy['title']}",
                      style: AppTextStyles.pop12Reg(),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        policy['description']!,
                        style: AppTextStyles.pop12ExLite(),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'I agree to not engage in or encourage any such activities.',
                        style:
                            AppTextStyles.pop12ExLite(color: MyAppColors.blue3),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCustomCheckbox({
    required String text,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => onChanged(!value),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: value ? MyAppColors.blue3 : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: value ? MyAppColors.blue3 : Colors.transparent,
                  width: 2,
                ),
              ),
              child: value
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: AppTextStyles.pop12Reg()),
          ),
        ],
      ),
    );
  }
}
