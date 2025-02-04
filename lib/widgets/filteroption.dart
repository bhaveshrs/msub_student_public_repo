import 'package:flutter/material.dart';

import 'custom_text.dart';

class FilterOptionWidget extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color borderColor;
  final VoidCallback? onTap;

  const FilterOptionWidget({
    super.key,
    required this.label,
    required this.iconPath,
    this.borderColor = const Color(0xFFE0E0E0), // Default border color
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6) +
            const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 0.4),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              height: 12,
              width: 12,
            ),
            const SizedBox(width: 3),
            CustomText(
              label,
              fontSize: 14, // Replace with your text style
            ),
          ],
        ),
      ),
    );
  }
}
