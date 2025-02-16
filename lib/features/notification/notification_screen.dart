import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/coming_soon.dart';
import 'package:msub/config/common_widgets/filteroption.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/notification/all_notification_page.dart';
import 'package:msub/features/notification/bloc/notification_bloc.dart';
import 'package:msub/features/notification/widgets/shimmer_notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, this.isFormNotification = false});
  final bool isFormNotification;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  // late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  static List<String> dateOption = ["Today", "Yesterday", "Last", "Custom"];
  static List<String> sessionsOption = [
    "Morning Sessions",
    "Afternoon Sessions ",
    "Evening Sessions",
    "Custom Time Range"
  ];
  static List<String> facultyOptions = [
    "Prof. Sanjay Sharma",
    "Prof. Sanjay Sharma",
    "Prof. Sanjay Sharma",
    "Prof. Sanjay Sharma"
  ];
  static List<String> moduleOption = [
    "Module 1",
    "Module 2",
    "Module 3",
    "Module 4"
  ];
  static List<String> options = [
    "Date",
    "Session",
    "Subject",
    "Module",
    "Faculty"
  ];
  final List<List<String>> filterOption = [
    dateOption,
    sessionsOption,
    dateOption,
    moduleOption,
    facultyOptions
  ];
  int selectedIndex = 0;
  List<String> colorGuide = [
    "Important",
    "Neutral",
  ];
  List<Color> colorForGuide = [
    MyAppColors.darkRed,
    MyAppColors.msu27AE60,
  ];
  @override
  void initState() {
    context.read<NotificationBloc>().add(const LoadNotifications());
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (widget.isFormNotification == true) {
          context.go(AppRouteNames.dashboardRoute);
          return Future<bool>.value(false);
          // return Future<bool>.value(true);
        } else {
          return Future<bool>.value(true);
        }
      },
      child: Scaffold(
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
                    const Spacer(),
                    SvgPicture.asset(AppImages.filter),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Filter by",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.pop12Reg(),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Icon(
                            Icons.clear,
                            size: 14,
                          ),
                        ))
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
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 1),
                      itemBuilder: (context, index) {
                        final isSelected = index == selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? MyAppColors.blue3
                                    : MyAppColors.white2),
                            child: Text(options[index],
                                textAlign: TextAlign.center,
                                style: AppTextStyles.pop12Reg(
                                    color: isSelected ? Colors.white : null)),
                          ),
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
                            Text(
                              "Filter by ${options[selectedIndex]}",
                              style: AppTextStyles.pop12Mid(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              children: List.generate(
                                  filterOption[selectedIndex].length, (index) {
                                return FilterOptionWidget(
                                  label: filterOption[selectedIndex][index],
                                  iconPath: AppImages.calendar,
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
              if (widget.isFormNotification) {
                context.go(AppRouteNames.dashboardRoute);
              } else if (context.canPop()) {
                context.pop();
                print("allalaal");
              }
            },
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.bell),
              const SizedBox(
                width: 5,
              ),
              AppText(
                text: "Notifications",
                style: AppTextStyles.rob16Medium(color: Colors.black),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              elevation: 3,
              menuPadding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) {
                return List.generate(
                  colorGuide.length,
                  (int index) => PopupMenuItem<String>(
                    padding: const EdgeInsets.only(left: 12, right: 5),
                    height: 30,
                    value: colorGuide[index],
                    child: Row(
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: colorForGuide[index],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(colorGuide[index]),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.more_vert),
              offset: const Offset(0, 40),
            ),
          ],
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImages.filter),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Filter",
                                style: AppTextStyles.pop12Reg(),
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
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        unselectedDecoration: const BoxDecoration(
                            color: MyAppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(26))),
                        decoration: const BoxDecoration(
                            color: MyAppColors.blue3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(26))),
                        unselectedLabelStyle:
                            AppTextStyles.pop12Reg(color: Colors.black),
                        labelStyle: AppTextStyles.pop12Reg(
                          color: Colors.white,
                        ),
                        tabs: const [
                          Tab(
                            text: "All Actives",
                          ),
                          Tab(
                            text: "Assignments Only",
                          ),
                          Tab(
                            text: "Events Only",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children: state.loadNotificationStatus.isInProgress
                          ? const <Widget>[
                              // AllActives(),

                              ShimmerNotificationCard(),
                              ComingSoon(),
                              ComingSoon()
                            ]
                          : state.loadNotificationStatus.isSuccess
                              ?  <Widget>[
                                  // AllActives(),
                                  AllNotificationPage(),
                                  ComingSoon(),
                                  ComingSoon(),
                                ]
                              : [
                                  const Center(
                                    child: Text('no data available'),
                                  ),
                                  const Center(
                                    child: Text('no data available'),
                                  ),
                                  const Center(
                                    child: Text('no data available'),
                                  ),
                               
                                ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
