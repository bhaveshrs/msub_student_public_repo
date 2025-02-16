import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

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
            SvgPicture.asset(AppImages.file),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "fileName",
                    style: AppTextStyles.pop12Mid(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("1.58 MB . PDF ",
                      style: AppTextStyles.pop12Reg(color: MyAppColors.grey))
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset(AppImages.download)
          ],
        ),
      ),
    );
  }
}
