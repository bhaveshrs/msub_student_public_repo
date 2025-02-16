import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/notification_expanstion.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class AnnouncementCard extends StatelessWidget {
  final String text;
  final String role;

  const AnnouncementCard({super.key, required this.text, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    text: "Lorem Ipsum dolor sit",
                    style: AppTextStyles.rob16Medium(),
                  ),
                ),
                SvgPicture.asset(
                  AppImages.calendar,
                  height: 14,
                  width: 14,
                ),
                const SizedBox(width: 5),
                AppText(
                    text: "11 Oct,2024", style: AppTextStyles.pop12ExLite()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            NotificationExpansion(
              onTap: () {
                context.pushNamed(AppRouteNames.detailedViewAnnouncement);
              },
              needExpansion: false,
              text: text,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      color: role == "Administrative"
                          ? MyAppColors.darkOrange
                          : role == "Faculty"
                              ? MyAppColors.facultyColor
                              : role == "Academic"
                                  ? MyAppColors.darkGreen
                                  : role == "Sports"
                                      ? MyAppColors.sDarkRed
                                      : null,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(22))),
                  child: Text(
                    role,
                    style: AppTextStyles.pop10Reg(color: Colors.white)
                        .copyWith(fontSize: 8),
                  ),
                ),
                const Spacer(),
                Text(
                  "10:12 AM",
                  style: AppTextStyles.pop11ExLite().copyWith(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
