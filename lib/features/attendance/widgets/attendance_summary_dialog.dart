import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class AttendanceSummaryDialog extends StatelessWidget {
  final Function? onTap;
  const AttendanceSummaryDialog({super.key,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('Attendance Summary',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.rob16Medium(color: MyAppColors.blue3)),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
                'Review the attendance summary before submission. You can go back to make changes.',
                style: AppTextStyles.pop11ExLite()
                    .copyWith(fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            _buildSummaryRow('Subject :', 'Design Studio',
                needDivider: false, color: MyAppColors.blue3),
            const SizedBox(
              height: 14,
            ),
            _buildSummaryRow('Date :', '16/12/2024'),
            _buildSummaryRow('Time :', '09 - 10 AM', color: MyAppColors.blue3),
            _buildSummaryRow('Course :', 'BCom (3)'),
            _buildSummaryRow('Division :', '4'),
            _buildSummaryRow('Total Strength :', '100'),
            _buildSummaryRow('Present :', '74', color: MyAppColors.appleGreen),
            _buildSummaryRow('Absent :', '26', color: MyAppColors.darkRed),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: AppButton(
                borderRadius: 6,
                buttonName: "Submit",
                onPress: () {
                  onTap?.call();
                  // context.pushNamed(AppRouteNames.m)
                },
                btnPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                maxWidth: 70,
                textStyle: AppTextStyles.pop12Reg(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool needDivider = true, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.pop12Reg()),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(value,
                      textAlign: needDivider ? TextAlign.end : null,
                      style: AppTextStyles.pop12Reg(color: color)),
                ),
              ],
            ),
            if (needDivider)
              const Divider(
                color: MyAppColors.white2,
                thickness: 1,
              )
          ],
        ),
      ),
    );
  }
}
