import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class MakeAttendance extends StatelessWidget {
  const MakeAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        children: [
          Text(
            "1.",
            style: AppTextStyles.pop12Reg(),
          ),
          const SizedBox(
            width: 27,
          ),
          CircleAvatar(
            radius: 17,
            child: Image.asset(AppImages.userReplacement),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            "Abhay Govind",
            style: AppTextStyles.pop12Reg(),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
                color: MyAppColors.white2,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Text(
              "Present",
              style: AppTextStyles.pop12Reg(color: MyAppColors.inActiveText),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
                color: MyAppColors.white2,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Text(
              "Absent",
              style: AppTextStyles.pop12Reg(color: MyAppColors.inActiveText),
            ),
          )
        ],
      ),
    );
  }
}
