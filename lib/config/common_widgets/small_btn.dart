import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';


class SmallBtn extends StatelessWidget {
  final String title;
  final Function? onTap;
  final EdgeInsetsGeometry? padding;
  const SmallBtn({super.key, required this.title, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
            color: MyAppColors.blue3,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(
          title,
          style:
              AppTextStyles.pop10Reg(color: Colors.white).copyWith(fontSize: 8),
        ),
      ),
    );
  }
}
