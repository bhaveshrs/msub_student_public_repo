import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class SearchHistoryItem extends StatelessWidget {
  final String svg;
  const SearchHistoryItem({super.key, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(svg),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              "Academic Calendar",
              style: AppTextStyles.pop12Reg(),
            ),
          ),
          SvgPicture.asset(AppImages.upsideTiledArrow)
        ],
      ),
    );
  }
}
