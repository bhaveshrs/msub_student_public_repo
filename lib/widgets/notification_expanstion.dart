import 'package:flutter/material.dart';

import '../common/utils/app_colors.dart';

class NotificationExpansion extends StatefulWidget {
  final String text;
  final bool needExpansion;
  final Function()? onTap;

  const NotificationExpansion({super.key, required this.text, this.needExpansion = true, this.onTap});

  @override
  _NotificationExpansionState createState() => _NotificationExpansionState();
}

class _NotificationExpansionState extends State<NotificationExpansion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AnimatedCrossFade(
            firstChild: Text(
              widget.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            secondChild: Text(
              widget.text,
              style: const TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (widget.needExpansion == false) {
              widget.onTap?.call();
            } else {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }
          },
          child: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_right_sharp,
            color: AppColors.grey,
            size: 24,
          ),
        ),
      ],
    );
  }
}
