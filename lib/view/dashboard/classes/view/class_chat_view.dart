import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../widgets/custom_input_text.dart';
import '../../../../widgets/file_bubble.dart';
import '../../../../widgets/message_bubble.dart';

class ClassChatView extends StatelessWidget {
  ClassChatView({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {
        "text": "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis vitae sagittis ",
        "sender": "Dr. Lorium Ipsum",
        "time": "10:01 AM",
        "Type": "text"
      },
      {"text": "How are you doing?", "sender": "Amit", "time": "10:02 AM", "Type": "text"},
      {
        "fileName": "Lorem ipsum dolor",
        "size": "1.58 MB",
        "ext": ". PDF ",
        "Type": "file",
        "sender": "Amit",
        "time": "10:02 AM",
      },
      {"text": "All good here!", "sender": "Bhavesh", "time": "10:03 AM", "Type": "text"},
      {"text": "Great to hear that!", "sender": "Rahul", "time": "10:05 AM", "Type": "text"},
      {"text": "Let's meet up later.", "sender": "Bhavesh", "time": "10:07 AM", "Type": "text"},
      {"text": "Sure, works for me.", "sender": "Amit", "time": "10:08 AM", "Type": "text"},
    ];

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final previousSender = index > 0 ? messages[index - 1]['sender'] : null;
                  if (message["Type"] == "file") {
                    return FileBubble(
                      fileName: message['fileName'],
                      size: message['size'],
                      ext: message['ext'],
                      sender: message['sender'],
                      time: message['time'],
                      showSenderName: message['sender'] != previousSender && message['sender'] != "Bhavesh",
                    );
                  } else {
                    return ChatBubble(
                      message: message['text'],
                      sender: message['sender'],
                      time: message['time'],
                      showSenderName: message['sender'] != previousSender && message['sender'] != "Bhavesh",
                    );
                  }
                },
              ),
            ),
          ),
        ),
        // Input Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0) + const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Expanded(
                child: CustomTextInput(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: "Type a message...",
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.send_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
