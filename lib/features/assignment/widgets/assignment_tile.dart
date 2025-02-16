import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class AssignmentTile extends StatelessWidget {
  const AssignmentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouteNames.assignmentDetailsRoute);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Design Studio",
                      style: AppTextStyles.pop16Semi(color: MyAppColors.blue3),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Assignment 1",
                      style: AppTextStyles.pop12Reg(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Description : ",
                        style: AppTextStyles.pop12Reg(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem ipsum dolor sit amet. Est vitae dicta quo expedita architecto ut facere quos....",
                            style: AppTextStyles.pop12Reg(
                                color: MyAppColors.inActiveText),
                          ),
                        ],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const VerticalDivider(
                color: MyAppColors.blue3,
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
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          value: 0.8, // 80%
                          backgroundColor: MyAppColors.msuD4F1FF,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(MyAppColors.blue3),
                          strokeWidth: 5,
                        ),
                      ),
                      Text(
                        "80%",
                        style:
                            AppTextStyles.pop14Semi(color: MyAppColors.blue3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Marks: 80/100",
                    style: AppTextStyles.pop10Reg(),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12,
                color: MyAppColors.inActiveText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
