import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" •  ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(item, style: AppTextStyles.pop12ExLite()),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
