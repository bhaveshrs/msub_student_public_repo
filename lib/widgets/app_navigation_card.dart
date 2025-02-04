import 'package:flutter/material.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/widgets/size_space.dart';

class AppNavigationTitle extends StatelessWidget {
  final String name;
  final String number;

  const AppNavigationTitle({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            '#$number',
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          Height.make(10),
          Text(
            name,
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.textSecondary,
          )
        ],
      ),
    );
  }
}
