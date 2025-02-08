import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';


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
            title: Text(
              title,
              style: AppTextStyles.pop12Mid(color: MyAppColors.blue3),
            ),
            maintainState: true,
            iconColor: MyAppColors.blue3,
            collapsedIconColor: MyAppColors.blue3,
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
