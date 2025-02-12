// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:msub/config/common_widgets/apptext.dart';
// import 'package:msub/config/common_widgets/coming_soon.dart';
// import 'package:msub/config/common_widgets/filteroption.dart';
// import 'package:msub/config/resource/app_colors.dart';
// import 'package:msub/config/resource/app_colors.dart';
// import 'package:msub/config/resource/app_images.dart';
// import 'package:msub/config/resource/app_textstyles.dart';
// import 'package:msub/config/router/route_names.dart';
// import 'package:msub/features/assignment/assignments.dart';
// import 'package:msub/features/attendance/attendance.dart';
// import 'package:msub/features/attendance/marked_attendance.dart';
// import 'package:msub/features/attendance/widgets/attendance_summary_dialog.dart';
// import 'package:msub/features/class_chat/chat.dart';
// import 'package:msub/features/classes/bloc/classes_detail_bloc.dart';
// import 'package:msub/features/files/files_screen.dart';

// class ClassDetails extends StatefulWidget {
//   const ClassDetails({super.key});

//   @override
//   State<ClassDetails> createState() => _ClassDetailsState();
// }

// class _ClassDetailsState extends State<ClassDetails>
//     with TickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   late TabController tabController;
//   static List<String> dateOption = ["Today", "Yesterday", "Last", "Custom"];
//   static List<String> sessionsOption = [
//     "Morning Sessions",
//     "Afternoon Sessions ",
//     "Evening Sessions",
//     "Custom Time Range"
//   ];
//   static List<String> facultyOptions = [
//     "Prof. Sanjay Sharma",
//     "Prof. Sanjay Sharma",
//     "Prof. Sanjay Sharma",
//     "Prof. Sanjay Sharma"
//   ];
//   static List<String> moduleOption = [
//     "Module 1",
//     "Module 2",
//     "Module 3",
//     "Module 4"
//   ];
//   static List<String> options = [
//     "Date",
//     "Session",
//     "Subject",
//     "Module",
//     "Faculty"
//   ];
//   final List<List<String>> filterOption = [
//     dateOption,
//     sessionsOption,
//     dateOption,
//     moduleOption,
//     facultyOptions
//   ];

//   void showDeleteMessageDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Close button
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Icon(
//                       CupertinoIcons.clear,
//                       size: 12,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 // Title
//                 Text("Delete Message",
//                     style: AppTextStyles.rob16Medium(color: MyAppColors.blue3)),
//                 const SizedBox(height: 8),

//                 // Subtitle
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Text("What would you like to do with this message?",
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.pop12ExLite(
//                               color: MyAppColors.inActiveText)
//                           .copyWith(fontStyle: FontStyle.italic)),
//                 ),
//                 const SizedBox(height: 15),
//                 const Divider(
//                   color: MyAppColors.inActiveText,
//                   thickness: 0.3,
//                 ),
//                 // Delete Button
//                 GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onTap: () {
//                     // Perform delete action
//                     Navigator.pop(context);
//                     print("Message deleted for everyone");
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Delete for everyone",
//                           style:
//                               AppTextStyles.pop12Reg(color: MyAppColors.red)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   int selectedIndex = 0;
//   bool markedAttendance = false;
//   List<String> menuItems = ["Search", "Info", "Reset"];
//   List<String> svgImages = [
//     AppImages.searchSvg,
//     AppImages.info,
//     AppImages.reset
//   ];
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 5, vsync: this);
//     tabController.addListener(
//       () {
//         setState(() {});
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(tabController.index);
//     return BlocBuilder<ClassesDetailBloc, ClassesDetailState>(
//       builder: (context, state) {
//         return Scaffold(
//             drawerEnableOpenDragGesture: false,
//             key: _scaffoldKey,
//             drawer: Drawer(
//               child: SafeArea(
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(AppImages.filter),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         Text(
//                           "Filter by",
//                           style: AppTextStyles.pop12Reg(),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                             child: ListView.separated(
//                           shrinkWrap: true,
//                           itemCount: options.length,
//                           separatorBuilder: (context, index) =>
//                               const SizedBox(height: 1),
//                           itemBuilder: (context, index) {
//                             final isSelected = index == selectedIndex;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? MyAppColors.blue3
//                                         : MyAppColors.white2),
//                                 child: Text(options[index],
//                                     textAlign: TextAlign.center,
//                                     style: AppTextStyles.pop12Reg(
//                                         color:
//                                             isSelected ? Colors.white : null)),
//                               ),
//                             );
//                           },
//                         )),
//                         Expanded(
//                           flex: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Filter by ${options[selectedIndex]}",
//                                   style: AppTextStyles.pop12Mid(),
//                                 ),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Wrap(
//                                   children: List.generate(
//                                       filterOption[selectedIndex].length,
//                                       (index) {
//                                     return FilterOptionWidget(
//                                       label: filterOption[selectedIndex][index],
//                                       iconPath: AppImages.calendar,
//                                       onTap: () {
//                                         // Handle tap here
//                                         // print("${filterOptions[index]['label']} tapped!");
//                                       },
//                                     );
//                                   }),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             appBar: AppBar(
//               centerTitle: true,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   context.pop();
//                 },
//               ),
//               automaticallyImplyLeading: false,
//               backgroundColor: Colors.white,
//               title: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     minRadius: 12,
//                     backgroundColor: MyAppColors.blue3,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: AppText(
//                         text: state.selectedItemCount > 0
//                             ? state.selectedItemCount.toString()
//                             : "DS",
//                         fontSize: 12,
//                         fontWeight: FontWeight.w800,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Center(
//                     child: AppText(
//                       text: state.selectedItemCount > 0
//                           ? "Delete"
//                           : "Design Studio",
//                       style: AppTextStyles.rob16Medium(color: Colors.black),
//                     ),
//                   )
//                 ],
//               ),
//               actions: state.selectedItemCount > 0
//                   ? [
//                       GestureDetector(
//                           onTap: () {
//                             showDeleteMessageDialog(context);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 10.0),
//                             child: SvgPicture.asset(AppImages.delete),
//                           ))
//                     ]
//                   : [
//                       PopupMenuButton<String>(
//                         elevation: 3,
//                         menuPadding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         onSelected: (String value) {},
//                         itemBuilder: (BuildContext context) {
//                           return List.generate(
//                             menuItems.length,
//                             (int index) => PopupMenuItem<String>(
//                               padding:
//                                   const EdgeInsets.only(left: 12, right: 5),
//                               height: 30,
//                               value: menuItems[index],
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset(svgImages[index]),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   Text(
//                                     menuItems[index],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         icon: const Icon(Icons.more_vert),
//                         offset: const Offset(0, 40),
//                       ),
//                     ],
//             ),
//             body: SafeArea(
//               child: DefaultTabController(
//                 length: 5,
//                 child: Column(
//                   children: <Widget>[
//                     ButtonsTabBar(
//                       controller: tabController,
//                       height: 50,
//                       duration: 400,
//                       buttonMargin: const EdgeInsets.all(8),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 8),
//                       unselectedDecoration: const BoxDecoration(
//                           color: MyAppColors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(26))),
//                       decoration: const BoxDecoration(
//                           color: MyAppColors.blue3,
//                           borderRadius: BorderRadius.all(Radius.circular(26))),
//                       unselectedLabelStyle:
//                           const TextStyle(color: Colors.black),
//                       labelStyle: const TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                       tabs: const [
//                         Tab(
//                           text: "Attendance",
//                         ),
//                         Tab(
//                           text: "Chat",
//                         ),
//                         Tab(
//                           text: "Files",
//                         ),
//                         Tab(
//                           text: "Assignments",
//                         ),
//                         Tab(
//                           text: "Syllabus",
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         controller: tabController,
//                         children: <Widget>[
//                           if (!markedAttendance)
//                             const Attendance()
//                           else
//                             const MarkedAttendance(),
//                           const ChatScreen(),
//                           const FilesScreen(),
//                           const Assignments(),
//                           const ComingSoon()
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             bottomNavigationBar: tabController.index == 0
//                 ? Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 21, vertical: 14),
//                     color: Colors.white,
//                     child: SafeArea(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: const BoxDecoration(
//                                   color: MyAppColors.white2,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               child: Text(
//                                 "Monday, 16 Sep",
//                                 textAlign: TextAlign.center,
//                                 style: AppTextStyles.pop12Reg(
//                                     color: MyAppColors.blue3),
//                               ),
//                             ),
//                           ),
//                           const Spacer(),
//                           Expanded(
//                             flex: 3,
//                             child: GestureDetector(
//                               onTap: () {
//                                 if (!markedAttendance) {
//                                   // _scaffoldKey.currentState?.openDrawer();
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AttendanceSummaryDialog(
//                                         onTap: () {
//                                           markedAttendance = true;
//                                           context.pop();
//                                           setState(() {});
//                                         },
//                                       );
//                                     },
//                                   );
//                                 }
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: const BoxDecoration(
//                                     color: MyAppColors.blue3,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10))),
//                                 child: Text(
//                                   markedAttendance ? "Filter" : "Next",
//                                   textAlign: TextAlign.center,
//                                   style: AppTextStyles.pop12Reg(
//                                       color: MyAppColors.white),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 : null,
//             floatingActionButton: tabController.index == 3
//                 ? SafeArea(
//                     child: FloatingActionButton(
//                       shape: const CircleBorder(),
//                       onPressed: () {
//                         context.pushNamed(AppRouteNames.addAssignmentRoute);

//                         print("Floating Action Button Pressed");
//                       },
//                       child: const Icon(Icons.add),
//                     ),
//                   )
//                 : null);
//       },
//     );
//   }
// }
