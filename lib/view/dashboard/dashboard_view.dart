import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/calendar/view/calendar_view.dart';
import 'package:msub/view/dashboard/classes/view/classes_view.dart';
import 'package:msub/view/dashboard/dashboard_controller.dart';
import 'package:msub/view/dashboard/home/view/home_view.dart';
import 'package:msub/view/dashboard/more/view/More_view.dart';

import '../../common/utils/app_colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.put(DashboardController());

  final List<Widget> tabs = [
    HomeView(),
    const ClassesView(),
    CalendarView(),
    const MoreView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // appBar: AppBar(
      //   backgroundColor: AppColors.white,
      //   automaticallyImplyLeading: false,
      //   scrolledUnderElevation: 0,
      //   shadowColor: AppColors.primary,
      //   elevation: 0,
      //   title: const Text(""),
      // ),
      //body: _buildBody(controller.currentIndex.value),
      body: Obx(
        () => PageView(
          children: [tabs[controller.currentIndexNavBottom.value]],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: AppColors.lighterGrey,
                  blurRadius: 0.0,
                  offset: Offset(0, -1)),
            ],
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.currentIndexNavBottom.value = 0;
                },
                child: SizedBox(
                  height: 67,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: controller.currentIndexNavBottom.value == 0
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        height: 8,
                        width: 50,
                      ),
                      const SizedBox(height: 7),
                      Image.asset(Assets.homeIcon,
                          width: 24.0,
                          height: 24.0,
                          color: controller.currentIndexNavBottom.value == 0
                              ? AppColors.primary
                              : AppColors.inActive),
                      Text("Home",
                          style: TextStyle(
                              color: controller.currentIndexNavBottom.value == 0
                                  ? AppColors.primary
                                  : AppColors.inActive)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.currentIndexNavBottom.value = 1;
                },
                child: SizedBox(
                  height: 67,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: controller.currentIndexNavBottom.value == 1
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        height: 8,
                        width: 50,
                      ),
                      const SizedBox(height: 7),
                      Image.asset(Assets.classesIcon,
                          width: 24.0,
                          height: 24.0,
                          color: controller.currentIndexNavBottom.value == 1
                              ? AppColors.primary
                              : AppColors.inActive),
                      Text("Classes",
                          style: TextStyle(
                              color: controller.currentIndexNavBottom.value == 1
                                  ? AppColors.primary
                                  : AppColors.inActive)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.currentIndexNavBottom.value = 2;
                },
                child: SizedBox(
                  height: 67,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: controller.currentIndexNavBottom.value == 2
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        height: 8,
                        width: 50,
                      ),
                      const SizedBox(height: 7),
                      Image.asset(Assets.calendarIcon,
                          width: 24.0,
                          height: 24.0,
                          color: controller.currentIndexNavBottom.value == 2
                              ? AppColors.primary
                              : AppColors.inActive),
                      Text("Calendar",
                          style: TextStyle(
                              color: controller.currentIndexNavBottom.value == 2
                                  ? AppColors.primary
                                  : AppColors.inActive)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.currentIndexNavBottom.value = 3;
                },
                child: SizedBox(
                  height: 67,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: controller.currentIndexNavBottom.value == 3
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        height: 8,
                        width: 50,
                      ),
                      const SizedBox(height: 7),
                      Image.asset(Assets.moreIcon,
                          width: 24.0,
                          height: 24.0,
                          color: controller.currentIndexNavBottom.value == 3
                              ? AppColors.primary
                              : AppColors.inActive),
                      Text("More",
                          style: TextStyle(
                              color: controller.currentIndexNavBottom.value == 3
                                  ? AppColors.primary
                                  : AppColors.inActive)),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
