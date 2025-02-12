import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class CalenderListing extends StatelessWidget {
  final String type;
  const CalenderListing({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Saturday, Dec 28",
                    style:
                        AppTextStyles.pop12Reg(color: MyAppColors.inActiveText),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(child: Divider(color: MyAppColors.inActiveText))
                ],
              ),
            ),
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyAppColors.msC2CCFF)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "09 - 01 PM",
                      style: AppTextStyles.pop11ExLite(),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Design Studio Assignment",
                      style: AppTextStyles.pop12Reg(
                          color: type == "Assignments"
                              ? MyAppColors.assignmentColor
                              : type == "Events"
                                  ? MyAppColors.purple
                                  : MyAppColors.darkRed),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
