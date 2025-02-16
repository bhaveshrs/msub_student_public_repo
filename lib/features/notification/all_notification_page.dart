import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/notification_expanstion.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/notification/bloc/notification_bloc.dart';

class AllNotificationPage extends StatelessWidget {
  const AllNotificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: ListView.separated(
            itemCount: state.notifications.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemBuilder: (context, index) {
              String title = state.notifications[index].title ?? 'No Title';
              String message =
                  state.notifications[index].message ?? 'No Message';
              String createdAt = state.notifications[index].createdAt ?? '';
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 17, right: 17),
                        padding: const EdgeInsets.only(left: 17),
                        decoration: const BoxDecoration(
                            border: Border(
                          left: BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AppText(
                                text: title,
                                style: AppTextStyles.rob16Medium(),
                              ),
                            ),
                            const SizedBox(width: 15),
                            SvgPicture.asset(
                              AppImages.calendar,
                              height: 14,
                              width: 14,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                                text: createdAt.isNotEmpty
                                    ? createdAt
                                        .split('T')
                                        .first // Extract the date from ISO format
                                    : 'N/A',
                                style: AppTextStyles.pop12ExLite()),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0) +
                            const EdgeInsets.only(bottom: 17),
                        child: NotificationExpansion(
                          text: message,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              createdAt.isNotEmpty
                                  ? createdAt
                                      .split('T')
                                      .last
                                      .split('.')
                                      .first // Extract time
                                  : 'N/A',
                              style: AppTextStyles.pop12ExLite(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
