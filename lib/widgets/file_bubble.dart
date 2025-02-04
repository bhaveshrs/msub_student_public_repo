import 'package:flutter/material.dart';
import 'package:msub/common/utils/assets.dart';

import '../common/utils/app_colors.dart';
import 'custom_text.dart';

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
        mainAxisAlignment: sender == "Bhavesh" ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                  topLeft: sender == "Bhavesh" ? const Radius.circular(20) : Radius.zero,
                  topRight: sender == "Bhavesh" ? Radius.zero : const Radius.circular(20),
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
                      child: CustomText(
                        sender,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.fileIcon,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            fileName,
                            fontSize: 14,
                            color: sender == "Bhavesh" ? Colors.white : Colors.black,
                          ),
                          const SizedBox(height: 4),
                          CustomText("$size $ext", fontSize: 14, color: AppColors.grey)
                        ],
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
