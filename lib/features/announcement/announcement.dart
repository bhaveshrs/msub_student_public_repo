import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/filteroption.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/announcement/all_announcement.dart';
import 'package:msub/features/announcement/widgets/custom_button_bar.dart';

class AnnouncementScreen extends StatefulWidget {
  final bool isFormNotification;
  const AnnouncementScreen({
    super.key,
    this.isFormNotification = false,
  });

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen>
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
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
                    SvgPicture.asset(AppImages.filter),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Filter by",
                      style: AppTextStyles.pop12Reg(),
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
              SizedBox(
                height: 18,
                width: 18,
                child: Image.asset(AppImages.announcement),
              ),
              // SvgPicture.asset(AppImages.bell),
              const SizedBox(
                width: 5,
              ),
              AppText(
                text: "Announcement",
                style: AppTextStyles.rob16Medium(color: Colors.black),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               
                  Flexible(
                    child: CustomButtonsTabBar(
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      height: 50,
                      duration: 400,
                      buttonMargin: const EdgeInsets.all(8),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      unselectedDecoration: const BoxDecoration(
                          color: MyAppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      decoration: const BoxDecoration(
                          color: MyAppColors.blue3,
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      unselectedLabelStyle:
                          AppTextStyles.pop12Reg(color: Colors.black),
                      labelStyle: AppTextStyles.pop12Reg(
                        color: Colors.white,
                      ),
                      tabs: const [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "Administrative",
                        ),
                        Tab(
                          text: "Faculty",
                        ),
                        Tab(
                          text: "Academic",
                        ),
                        Tab(
                          text: "Sports",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  // AllActives(),
                  AllAnnouncement(
                    role: "Administrative",
                  ),
                  AllAnnouncement(
                    role: "Administrative",
                  ),
                  AllAnnouncement(
                    role: "Faculty",
                  ),
                  AllAnnouncement(
                    role: "Academic",
                  ),
                  AllAnnouncement(
                    role: "Sports",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
