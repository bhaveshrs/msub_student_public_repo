import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class MarkedAttendWidget extends StatelessWidget {
  const MarkedAttendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: MyAppColors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "10 - 11 AM",
                  style: AppTextStyles.rob16Medium(color: MyAppColors.blue3),
                ),
              ),
              Text(
                "74",
                style: AppTextStyles.rob16Medium(color: MyAppColors.blue3),
              ),
              Text(
                "/100",
                style: AppTextStyles.rob16Medium(),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(AppImages.edit)
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: MyAppColors.white2,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "15/12/2024",
                  style: AppTextStyles.pop12Reg(),
                ),
              ),
              Text(
                "Absent :",
                style: AppTextStyles.pop12Reg(),
              ),
              Text(
                " 74",
                style: AppTextStyles.pop12Reg(color: MyAppColors.darkRed),
              ),
            ],
          )
        ],
      ),
    );
  }
}
