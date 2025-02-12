import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/home/widgets/search_history_item.dart';


class CalenderSearchScreen extends StatelessWidget {
  const CalenderSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 19),
            child: CustomTextInput(
              enable: true,
              radius: 36, contentPadValue: 15, maxLines: 1,
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Search History",
                  style: AppTextStyles.pop12Reg(color: MyAppColors.inActiveText),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Divider(color: MyAppColors.inActiveText),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return SearchHistoryItem(
                svg: AppImages.history,
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
