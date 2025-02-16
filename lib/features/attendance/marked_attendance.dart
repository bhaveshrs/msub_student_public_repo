import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/attendance/widgets/marked_attend_widget.dart';

class MarkedAttendance extends StatelessWidget {
  const MarkedAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Today",
                  style: AppTextStyles.pop10Reg(color: MyAppColors.grey),
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 6);
                },
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const MarkedAttendWidget();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
