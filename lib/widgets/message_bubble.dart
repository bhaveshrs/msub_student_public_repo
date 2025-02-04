import 'package:flutter/material.dart';

import '../common/utils/app_colors.dart';
import 'custom_text.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String sender;
  final String time;
  final bool showSenderName;

  const ChatBubble({
    super.key,
    required this.message,
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(1, 1),
                    blurRadius: 0,
                    spreadRadius: 0.5,
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
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        message,
                        fontSize: 14,
                        color: sender == "Bhavesh" ? Colors.white : Colors.black,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        time,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: sender == "Bhavesh" ? Colors.white70 : Colors.black54,
                        ),
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
