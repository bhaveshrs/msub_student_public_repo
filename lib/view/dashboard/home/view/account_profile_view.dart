import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/widgets/custom_text.dart';

class AccountProfileView extends StatelessWidget {
  AccountProfileView({super.key});

  final List<String> faqList = [
    "How to reset my password?",
    "How do I update my email address?",
    "Where to find my attendance?",
    "How can I add a profile picture?",
  ];

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
            const CustomText("Account & Profile", color: AppColors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: faqList.length,
            separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade300),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(faqList[index]),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Handle tap navigation or expansion
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
