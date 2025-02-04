import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/file_download.dart';

class FilesView extends StatelessWidget {
  const FilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14,
      ) +
          const EdgeInsets.only(
            top: 14,
          ),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: CustomText(
                  "Today",
                 fontSize: 14,
                 color: AppColors.grey),

              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const FileDownloadWidget();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
