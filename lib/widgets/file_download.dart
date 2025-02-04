import 'package:flutter/material.dart';
import 'package:msub/common/utils/assets.dart';

import '../common/utils/app_colors.dart';
import 'custom_text.dart';

class FileDownloadWidget extends StatelessWidget {
  const FileDownloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.fileIcon, height: 40, width: 40),
            const SizedBox(
              width: 5,
            ),
            const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "fileName",
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  SizedBox(height: 4),
                  CustomText("1.58 MB . PDF ", color: AppColors.grey)
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              Assets.downloadIcon,
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
