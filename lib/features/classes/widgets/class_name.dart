import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class ClassName extends StatelessWidget {
  const ClassName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 22),
            child: Row(
              children: [
                AppText(
                  text: "Design Studio",
                  style: AppTextStyles.pop18Semi(color: MyAppColors.blue3),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: const BoxDecoration(
                      color: MyAppColors.blue3,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          bottomLeft: Radius.circular(21))),
                  child: AppText(
                    text: "Subject Type (3)",
                    style: AppTextStyles.pop12Reg(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 22),
            child: Row(
              children: [
                AppText(
                  text: "Faculty : Ajith Singh",
                  style: AppTextStyles.pop12Reg(),
                ),
                const Spacer(),
                AppText(
                  text: "Room : 6-108",
                  style: AppTextStyles.pop12Reg(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
