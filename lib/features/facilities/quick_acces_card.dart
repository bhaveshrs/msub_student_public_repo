import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/small_btn.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class QuickAccessCard extends StatelessWidget {
  const QuickAccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207,
      height: 208,
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 125,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.govBg), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
              ),
              Positioned(
                right: 12,
                top: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: MyAppColors.green),
                      ),
                      const SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        "Open",
                        style: AppTextStyles.pop10Reg().copyWith(fontSize: 8),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "National Merit Scholarship",
            style: AppTextStyles.rob16Medium(color: MyAppColors.blue3)
                .copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: MyAppColors.blue3)),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "Deadline : Feb 15, 2025",
                style: AppTextStyles.pop10Reg(),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Align(
              alignment: Alignment.bottomRight,
              child: SmallBtn(
                title: "View More",
              ))
        ],
      ),
    );
  }
}
