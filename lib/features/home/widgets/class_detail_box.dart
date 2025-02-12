import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class ClassDetailBox extends StatelessWidget {
  const ClassDetailBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: MediaQuery.sizeOf(context).width * 0.4,
      // height: MediaQuery.sizeOf(context).width * 0.24,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Long Subject Name",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.pop12Mid(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "M4-FM",
                  style: AppTextStyles.pop10Reg(),
                ),
                AppText(text: "FS B.com 3", style: AppTextStyles.pop10Reg()),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: MyAppColors.blue3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
            child: AppText(
              text: "08 - 10 AM",
              textAlign: TextAlign.center,
              style: AppTextStyles.pop12Reg(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
