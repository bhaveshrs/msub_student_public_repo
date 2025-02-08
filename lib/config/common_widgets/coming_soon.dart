import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';


class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(AppImages.comingSoon)),
        
            Text(
              "Feature Coming Soon!",
              style: AppTextStyles.pop18Semi(color: MyAppColors.blue3)
                  .copyWith(fontSize: 16),
            ),
            SizedBox(height: 5,),
            Text(
                "This feature is under development and will be available in future updates.",
                textAlign: TextAlign.center,
                style: AppTextStyles.pop12Reg(color: MyAppColors.inActiveText))
          ],
        ),
      ),
    );
  }
}
