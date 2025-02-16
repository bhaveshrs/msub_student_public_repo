import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class TextAndValueWidget extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? myWidget;
  const TextAndValueWidget(
      {super.key, required this.title,  this.value, this.myWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.pop12Reg(),
        ),
        const Spacer(),
        myWidget ?? Text(value ?? "", style: AppTextStyles.pop12Reg())
      ],
    );
  }
}
