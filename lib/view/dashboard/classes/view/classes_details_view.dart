import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/classes/controller/classes_details_controller.dart';
import 'package:msub/view/dashboard/classes/view/assignments_view.dart';
import 'package:msub/view/dashboard/classes/view/class_chat_view.dart';
import 'package:msub/view/dashboard/classes/view/files_view.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/assets.dart';
import '../../../../widgets/coming_soon.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/filteroption.dart';
import '../../../../widgets/size_space.dart';

class ClassDetailsView extends StatefulWidget {
  const ClassDetailsView({super.key});

  @override
  State<ClassDetailsView> createState() => _ClassDetailsViewState();
}

class _ClassDetailsViewState extends State<ClassDetailsView> with TickerProviderStateMixin {
  ClassesDetailsController controller = Get.put(ClassesDetailsController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  static List<String> dateOption = ["Today", "Yesterday", "Last", "Custom"];
  static List<String> sessionsOption = ["Morning Sessions", "Afternoon Sessions ", "Evening Sessions", "Custom Time Range"];
  static List<String> facultyOptions = ["Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma", "Prof. Sanjay Sharma"];
  static List<String> moduleOption = ["Module 1", "Module 2", "Module 3", "Module 4"];
  static List<String> options = ["Date", "Session", "Subject", "Module", "Faculty"];
  final List<List<String>> filterOption = [dateOption, sessionsOption, dateOption, moduleOption, facultyOptions];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(tabController.index);
    return Scaffold(
        backgroundColor: AppColors.white2,
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        // drawer: Drawer(
        //   child: SafeArea(
        //     child: ListView(
        //       padding: EdgeInsets.zero,
        //       children: [
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Image.asset(
        //               Assets.filterIcon,
        //               height: 18,
        //               width: 18,
        //             ),
        //             const SizedBox(
        //               width: 4,
        //             ),
        //             const CustomText(
        //               "Filter by",
        //               fontSize: 12,
        //             )
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Expanded(
        //                 child: ListView.separated(
        //               shrinkWrap: true,
        //               itemCount: options.length,
        //               separatorBuilder: (context, index) => const SizedBox(height: 1),
        //               itemBuilder: (context, index) {
        //                 final isSelected = index == selectedIndex;
        //                 return GestureDetector(
        //                   onTap: () {
        //                     setState(() {
        //                       selectedIndex = index;
        //                     });
        //                   },
        //                   child: Container(
        //                     padding: const EdgeInsets.symmetric(vertical: 10),
        //                     decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.white2),
        //                     child: CustomText(options[index],
        //                         textAlign: TextAlign.center, fontSize: 12, color: isSelected ? Colors.white : Colors.transparent),
        //                   ),
        //                 );
        //               },
        //             )),
        //             Expanded(
        //               flex: 3,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(12.0),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     CustomText(
        //                       "Filter by ${options[selectedIndex]}",
        //                       fontSize: 12,
        //                     ),
        //                     const SizedBox(
        //                       height: 15,
        //                     ),
        //                     Wrap(
        //                       children: List.generate(filterOption[selectedIndex].length, (index) {
        //                         return FilterOptionWidget(
        //                           label: filterOption[selectedIndex][index],
        //                           iconPath: Assets.calendarIcon,
        //                           onTap: () {
        //                             // Handle tap here
        //                             // print("${filterOptions[index]['label']} tapped!");
        //                           },
        //                         );
        //                       }),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_rounded, size: 30),
              ),
              Row(
                children: [
                  Image.asset(Assets.dsIcon, height: 25, width: 25),
                  const Width(width: 5),
                  const CustomText("Design Studio", fontSize: 24, fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 5,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  controller: tabController,
                  height: 50,
                  duration: 400,
                  buttonMargin: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  unselectedDecoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(26))),
                  decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(26))),
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "Chat",
                    ),
                    Tab(
                      text: "Files",
                    ),
                    Tab(
                      text: "Assignments",
                    ),
                    Tab(
                      text: "Syllabus",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[ClassChatView(), const FilesView(), const AssignmentsView(), const ComingSoon()],
                  ),
                ),
              ],
            ),
          ),
        ));
    // bottomNavigationBar: tabController.index == 0
    //     ? Container(
    //   padding:
    //   const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
    //   color: Colors.white,
    //   child: SafeArea(
    //     child: Row(
    //       children: [
    //         Expanded(
    //           flex: 3,
    //           child: Container(
    //             padding: const EdgeInsets.all(10),
    //             decoration: const BoxDecoration(
    //                 color: AppColors.white2,
    //                 borderRadius:
    //                 BorderRadius.all(Radius.circular(10))),
    //             child: Text(
    //               "Monday, 16 Sep",
    //               textAlign: TextAlign.center,
    //               style:
    //               AppTextStyles.pop12Reg(color: AppColors.blue3),
    //             ),
    //           ),
    //         ),
    //         const Spacer(),
    //         Expanded(
    //           flex: 3,
    //           child: GestureDetector(
    //             onTap: () {
    //               // _scaffoldKey.currentState?.openDrawer();
    //               showDialog(
    //                 context: context,
    //                 builder: (BuildContext context) {
    //                   return const AttendanceSummaryDialog();
    //                 },
    //               );
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(10),
    //               decoration: const BoxDecoration(
    //                   color: AppColors.blue3,
    //                   borderRadius:
    //                   BorderRadius.all(Radius.circular(10))),
    //               child: Text(
    //                 "Next",
    //                 textAlign: TextAlign.center,
    //                 style: AppTextStyles.pop12Reg(
    //                     color: AppColors.white),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // )
    //     : null,
    // floatingActionButton: tabController.index == 3
    //     ? SafeArea(
    //   child: FloatingActionButton(
    //     shape: const CircleBorder(),
    //     onPressed: () {
    //       context.pushNamed(AppRouteNames.addAssignmentRoute);
    //
    //       print("Floating Action Button Pressed");
    //     },
    //     child: const Icon(Icons.add),
    //   ),
    // )
    //     : null);
  }
}
