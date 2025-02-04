import 'package:flutter/material.dart';

import '../common/utils/app_colors.dart';
import 'custom_text.dart';

class CommonExpansion extends StatelessWidget {
  final String title;
  final List<Widget> description;
  const CommonExpansion(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        dense: true,
        contentPadding: const EdgeInsets.all(0),
        child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(vertical: -4),
            title: CustomText(
              title,
             color: AppColors.primary,
            ),
            maintainState: true,
            iconColor: AppColors.primary,
            collapsedIconColor: AppColors.primary,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: description
            // const [
            //   Text(
            //       "Lorem ipsum dolor sit amet consectetur. Ornare risus amet quam eu non. Urna sit dignissim in amet. Iaculis elit lectus purus tristique venenatis fringilla mattis nisl in. Quis neque euismod in sed nullam suspendisse."),
            // ],
            ),
      ),
    );
  }
}
