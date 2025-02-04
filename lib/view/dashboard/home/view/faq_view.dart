import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/view/account_profile_view.dart';
import 'package:msub/widgets/custom_text.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'View by Categories',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ).paddingAll(20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 3.5,
              ),
              itemCount: 8, // Number of documents
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => AccountProfileView());
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.userProfileIcon,
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 12),
                        const CustomText(
                          'Account & Profile',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).paddingSymmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
