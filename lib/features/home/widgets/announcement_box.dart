import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class AnnouncementBox extends StatelessWidget {
  const AnnouncementBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: IntrinsicHeight(
        //This class is relatively expensive. Avoid using it where possible.
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.green),
              width: 4,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Exam Results Published",
                          style: AppTextStyles.pop12Semi(),
                        ),
                        const Icon(
                          Icons.close,
                          size: 12,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      text:
                          "The university will remain closed on [Date] in observance of [Holiday Name]. Classes will resume as scheduled.",
                      style: AppTextStyles.pop11ExLite(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
