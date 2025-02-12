import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/calender/widgets/schedules_widget.dart';


class SchedulesList extends StatelessWidget {
  final String type;
  const SchedulesList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: AppTextStyles.pop10Reg(color: MyAppColors.inActiveText),
        ),
        const SizedBox(
          height: 6,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouteNames.eventDetailedView);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SchedulesWidget(
                        textColor: type == "Events"
                            ? MyAppColors.purple
                            : type == "Assignment"
                                ? MyAppColors.assignmentColor
                                : type == "Holiday"
                                    ? MyAppColors.darkRed
                                    : MyAppColors.purple),
                    if (index == 1)
                      const SizedBox(
                        height: 15,
                      )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: 2)
      ],
    );
  }
}
