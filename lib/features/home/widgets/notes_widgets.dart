import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class NotesWidgets extends StatelessWidget {
  final String txt1;
  final String txt2;
  final bool selected;
  const NotesWidgets(
      {super.key,
      required this.txt1,
      required this.txt2,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
          color: selected ? MyAppColors.blue3 : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          Text(
            txt1,
            style: AppTextStyles.rob16Medium(
              color: selected ? Colors.white : MyAppColors.blue3,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            txt2,
            textAlign: TextAlign.center,
            style: AppTextStyles.pop12ExLite(
                color: selected ? Colors.white : null),
          ),
        ],
      ),
    );
  }
}
