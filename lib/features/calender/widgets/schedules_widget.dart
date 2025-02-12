import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class SchedulesWidget extends StatelessWidget {
  final Color? textColor;
  const SchedulesWidget({super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Republic Day",
                  style: AppTextStyles.pop12Mid(
                      color: textColor ?? MyAppColors.purple),
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: MyAppColors.msC2CCFF)),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "09 - 01 PM",
                style: AppTextStyles.pop11ExLite(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
