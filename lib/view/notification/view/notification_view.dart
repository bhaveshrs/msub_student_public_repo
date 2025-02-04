import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/notification/controller/notification_controller.dart';
import 'package:msub/widgets/coming_soon.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../common/utils/app_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/filteroption.dart';
import '../../../widgets/notification_expanstion.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationView> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  NotificationController controller = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      drawerEnableOpenDragGesture: false,
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.filterIcon,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const CustomText(
                    "Filter by",
                    fontSize: 12,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.options.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 1),
                    itemBuilder: (context, index) {
                      final isSelected = index == controller.selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedIndex = index;
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.white),
                            child: CustomText(controller.options[index],fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center, fontSize: 14, color: isSelected ? AppColors.white : AppColors.black)),
                      );
                    },
                  )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "Filter by ${controller.options[controller.selectedIndex]}",
                            fontSize: 12,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children: List.generate(controller.filterOption[controller.selectedIndex].length, (index) {
                              return FilterOptionWidget(
                                label: controller.filterOption[controller.selectedIndex][index],
                                iconPath: Assets.calendarIcon,
                                onTap: () {
                                  // Handle tap here
                                  // print("${filterOptions[index]['label']} tapped!");
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.notificationIcon,
              width: 20,
              height: 20,
            ),
            const CustomText(
              "Notifications",
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            InkWell(
                onTap: () {
                  Get.dialog(
                    _InfoPopup(),
                    barrierColor: Colors.black54,
                    barrierDismissible: true,
                  );
                },
                child: const Icon(
                  Icons.info_outline,
                  color: AppColors.grey,
                ))
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.filterIcon,
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CustomText(
                          "Filter",
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ),
                ButtonsTabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  height: 50,
                  duration: 400,
                  buttonMargin: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  unselectedDecoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(26))),
                  decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(26))),
                  unselectedLabelStyle: const TextStyle(fontSize: 12, color: AppColors.black),
                  labelStyle: const TextStyle(fontSize: 12, color: AppColors.white),
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Department",
                    ),
                    Tab(
                      text: "Year",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const <Widget>[
                // AllActives(),
                AllNotificationPage(),
                ComingSoon(),
                ComingSoon(),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}

class AllNotificationPage extends StatelessWidget {
  const AllNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    String text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
      child: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(17),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                  left: BorderSide(
                    color: Colors.green,
                    width: 3.0,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CustomText(
                              "Fee Payment Deadline for Fall Semester",
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            Assets.calendarIcon,
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 5),
                          const CustomText(
                            "11 Oct,2024",
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      NotificationExpansion(
                        text: text,
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

class _InfoPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(top: 50, right: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Height(height: 10),
            _LegendItem(color: AppColors.red, text: 'Important'),
            Height(height: 10),
            _LegendItem(color: AppColors.green, text: 'Neutral'),
            Height(height: 10),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
