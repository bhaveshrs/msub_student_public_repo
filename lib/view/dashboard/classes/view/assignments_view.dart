import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/classes/view/assignment_details_view.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class AssignmentsView extends StatelessWidget {
  const AssignmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0) +
          const EdgeInsets.only(
            top: 14,
          ),
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemBuilder: (context, index) {
          return const AssignmentTile();
        },
      ),
    );
  }
}

class AssignmentTile extends StatelessWidget {
  const AssignmentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const AssignmentDetailsView());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomText(
                    "Design Studio",
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomText(
                    "Assignment 1",
                    fontSize: 12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Description: ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Lorem ipsum dolor sit amet. Est vitae dicta quo expedita architecto ut facere quos....",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.inActive,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: AppColors.primary,
              width: 2,
              height: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        value: 0.8, // 80%
                        backgroundColor: AppColors.inActive.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                        strokeWidth: 5,
                      ),
                    ),
                    const CustomText(
                      "80%",
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const CustomText(
                  "Marks: 80/100",
                  fontSize: 12,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
