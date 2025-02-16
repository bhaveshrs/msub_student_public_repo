import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/files/widgets/file_download.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

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
          color: MyAppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
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
