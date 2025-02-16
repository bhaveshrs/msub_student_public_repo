
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/classes/bloc/classes_detail_bloc.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String sender;
  final String time;
  final bool showSenderName;
  final bool isSelected;
  final Function? onLongPress;
  final Function? onTap;

  const ChatBubble({
    super.key,
    required this.message,
    required this.sender,
    required this.time,
    required this.showSenderName,
    this.onLongPress,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesDetailBloc, ClassesDetailState>(
      builder: (context, state) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                onTap?.call();
              },
              onLongPress: () {
                onLongPress?.call();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: sender == "Bhavesh"
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(1, 1),
                              blurRadius: 0,
                              spreadRadius: 0.5,
                            ),
                          ],
                          color: sender == "Bhavesh"
                              ? Colors.blueAccent
                              : Colors.white,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  message,
                                  style: AppTextStyles.pop12Mid(
                                    color: sender == "Bhavesh"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  time,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: sender == "Bhavesh"
                                        ? Colors.white70
                                        : Colors.black54,
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
              ),
            ),
            if (isSelected)
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    color: MyAppColors.blue3.withOpacity(0.2),
                    margin: const EdgeInsets.symmetric(vertical: 2),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
