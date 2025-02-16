import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class FileBubble extends StatelessWidget {
  final String fileName;
  final String size;
  final String ext;
  final String sender;
  final String time;
  final bool showSenderName;

  const FileBubble({
    super.key,
    required this.fileName,
    required this.size,
    required this.ext,
    required this.sender,
    required this.time,
    required this.showSenderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: sender == "Bhavesh"
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
                color: sender == "Bhavesh" ? Colors.blueAccent : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: sender == "Bhavesh"
                      ? const Radius.circular(20)
                      : Radius.zero,
                  topRight: sender == "Bhavesh"
                      ? Radius.zero
                      : const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                  bottomLeft: const Radius.circular(20),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showSenderName)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        sender,
                        style: AppTextStyles.pop12Mid(
                          color: MyAppColors.blue3,
                        ),
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppImages.file),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileName,
                            style: AppTextStyles.pop12Mid(
                              color: sender == "Bhavesh"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("$size $ext",
                              style:
                                  AppTextStyles.pop12Reg(color: MyAppColors.grey))
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(AppImages.download)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
