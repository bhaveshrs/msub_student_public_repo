// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class FeaturedTopicWidget extends StatelessWidget {
  final String txt;
  const FeaturedTopicWidget({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyAppColors.inActiveText,
              blurRadius: 0.1,
              offset: Offset(0, 0.5)
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        children: [
          Expanded(
              child: Text(
            txt,
            style: AppTextStyles.pop14ExLite(),
          )),
          const Icon(Icons.arrow_forward_ios,size: 12,)
        ],
      ),
    );
  }
}
