import 'package:flutter/material.dart';
import 'package:msub/common/utils/assets.dart';

import '../common/utils/app_colors.dart';
import 'custom_text.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200, width: 200, child: Image.asset(Assets.comingSoon)),
            CustomText("Feature Coming Soon!", fontSize: 18, color: AppColors.primary),
            SizedBox(
              height: 5,
            ),
            CustomText("This feature is under development and will be available in future updates.",
                textAlign: TextAlign.center, fontSize: 12, color: AppColors.inActive)
          ],
        ),
      ),
    );
  }
}
