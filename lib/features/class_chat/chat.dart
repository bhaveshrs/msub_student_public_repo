import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/features/class_chat/widgets/file_bubble.dart';
import 'package:msub/features/class_chat/widgets/message_bubble.dart';
import 'package:msub/features/classes/bloc/classes_detail_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> messages = [
    {
      "text":
          "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis vitae sagittis ",
      "sender": "Dr. Lorium Ipsum",
      "time": "10:01 AM",
      "Type": "text",
      "isSelected": false
    },
    {
      "text": "How are you doing?",
      "sender": "Amit",
      "time": "10:02 AM",
      "Type": "text",
      "isSelected": false
    },
    {
      "fileName": "Lorem ipsum dolor",
      "size": "1.58 MB",
      "ext": ". PDF ",
      "Type": "file",
      "sender": "Amit",
      "time": "10:02 AM",
      "isSelected": false
    },
    {
      "text": "All good here!",
      "sender": "Bhavesh",
      "time": "10:03 AM",
      "Type": "text",
      "isSelected": false
    },
    {
      "text": "Great to hear that!",
      "sender": "Rahul",
      "time": "10:05 AM",
      "Type": "text",
      "isSelected": false
    },
    {
      "text": "Let's meet up later.",
      "sender": "Bhavesh",
      "time": "10:07 AM",
      "Type": "text",
      "isSelected": false
    },
    {
      "text": "Sure, works for me.",
      "sender": "Amit",
      "time": "10:08 AM",
      "Type": "text",
      "isSelected": false
    },
  ];
  OverlayEntry? _overlayEntry;
  final GlobalKey _textFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesDetailBloc, ClassesDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                decoration: const BoxDecoration(
                    color: MyAppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final previousSender =
                          index > 0 ? messages[index - 1]['sender'] : null;
                      if (message["Type"] == "file") {
                        return FileBubble(
                          fileName: message['fileName'],
                          size: message['size'],
                          ext: message['ext'],
                          sender: message['sender'],
                          time: message['time'],
                          showSenderName: message['sender'] != previousSender &&
                              message['sender'] != "Bhavesh",
                        );
                      } else {
                        return ChatBubble(
                          isSelected: message['isSelected'],
                          onTap: () {
                            if (message['isSelected'] == true) {
                              message['isSelected'] = false;
                              context.read<ClassesDetailBloc>().add(
                                  SelectItemForDelete(
                                      state.selectedItemCount - 1));
                              setState(() {});
                            }
                          },
                          onLongPress: () {
                            message['isSelected'] = true;
                            context.read<ClassesDetailBloc>().add(
                                SelectItemForDelete(
                                    state.selectedItemCount + 1));
                            setState(() {});
                          },
                          message: message['text'],
                          sender: message['sender'],
                          time: message['time'],
                          showSenderName: message['sender'] != previousSender &&
                              message['sender'] != "Bhavesh",
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            // Input Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0) +
                  const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextInput(
                      key: _textFieldKey,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      hintText: "Type a message...",
                      radius: 34,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            // _toggleShareOptions();
                          },
                          child: const Icon(Icons.attach_file)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: const BoxDecoration(
                      color: MyAppColors.blue3,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.send_outlined, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _toggleShareOptions() {
    if (_overlayEntry != null) {
      _removeOverlay();
    } else {
      _showShareOptions();
    }
  }

  void _showShareOptions() {
    final RenderBox textFieldRenderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final textFieldSize = textFieldRenderBox.size;
    final textFieldOffset = textFieldRenderBox.localToGlobal(Offset.zero);

    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    final spaceAbove = textFieldOffset.dy;
    final spaceBelow = screenHeight - textFieldOffset.dy - textFieldSize.height;

    final isAbove = spaceBelow < 200 && spaceAbove > spaceBelow;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 10,
        right: 10,
        bottom: isAbove
            ? screenHeight - spaceAbove + textFieldSize.height
            : keyboardHeight + textFieldSize.height + 10,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              shrinkWrap: true,
              children: [
                _buildShareOption(Icons.article, "Documents"),
                _buildShareOption(Icons.photo, "Photos"),
                _buildShareOption(Icons.videocam, "Videos"),
                _buildShareOption(Icons.camera_alt, "Camera"),
                _buildShareOption(Icons.poll, "Polling"),
                _buildShareOption(Icons.audiotrack, "Audio"),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildShareOption(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orangeAccent,
          child: Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
