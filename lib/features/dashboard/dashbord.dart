import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/coming_soon.dart';
import 'package:msub/config/common_widgets/filteroption.dart';
import 'package:msub/config/firbase_utils/firbase_notification_service.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/calender/bloc/calender_bloc.dart';
import 'package:msub/features/calender/calender_screen.dart';
import 'package:msub/features/calender/calender_search_screen.dart';
import 'package:msub/features/classes/classes.dart';
import 'package:msub/features/home/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  PushNotificationService pushNotificationService = PushNotificationService();

  int _currentIndex = 0;
  bool _showFirstColumn = true;
  bool isReset = false;
  late AnimationController _controller;
  late Animation<Offset> _firstColumnAnimation;
  late Animation<Offset> _secondColumnAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _stretchAnimation;
  double _searchBoxTopPosition = 150;
  double _searchBoxLeftRightPosition = 30;
  double _containerHeight = 170;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onNavItemTapped(int index) {
    setState(() {
      if (!_showFirstColumn) {
        _toggleVisibility();
      } else {
        _currentIndex = index;
      }
    });
  }

  void _toggleVisibility() async {
    if (_showFirstColumn) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (_searchBoxTopPosition == 150) {
      _searchBoxTopPosition = 50;
    } else if (_searchBoxTopPosition == 50) {
      _searchBoxTopPosition = 150;
    }
    if (_searchBoxLeftRightPosition == 30) {
      _searchBoxLeftRightPosition = 10;
    } else if (_searchBoxLeftRightPosition == 10) {
      _searchBoxLeftRightPosition = 30;
    }
    if (_containerHeight == 170) {
      _containerHeight = 80;
    } else if (_containerHeight == 80) {
      _containerHeight = 170;
    }

    setState(() {
      _showFirstColumn = !_showFirstColumn;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pushNotificationService.firebaseInit(
        context,
      );
      pushNotificationService.setupInteractMessage(context);
    });
    pushNotificationService.requestNotificationPermission();

    pushNotificationService.isTokenRefresh();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _firstColumnAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _secondColumnAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    _stretchAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  String? selectedMenu;
  List<String> menuItems = ["Search", "Info", "Reset"];
  List<String> svgImages = [
    AppImages.searchSvg,
    AppImages.info,
    AppImages.reset
  ];
  List<String> colorGuide = ["Selected", "Holidays", "Assignment", "Event"];
  List<Color> colorForGuide = [
    MyAppColors.blue3,
    MyAppColors.darkRed,
    MyAppColors.assignmentColor,
    MyAppColors.purple
  ];

  static List<String> dateOption = [
    "Today",
    "This Week",
    "This Month",
  ];

  int selectedIndex = 0;

  static List<String> options = [
    "Activities",
    "By date",
  ];
  final List<List<String>> filterOption = [
    dateOption,
    dateOption,
  ];

  void _showSecondaryMenu(BuildContext context) {
    showMenu<String>(
      elevation: 3,
      menuPadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      position: RelativeRect.fromLTRB(
          MediaQuery.sizeOf(context).width - 56,
          AppBar().preferredSize.height +
              MediaQuery.paddingOf(context).top -
              15,
          0,
          0.0),
      items: List.generate(
        colorGuide.length,
        (int index) => PopupMenuItem<String>(
          height: 30,
          value: colorGuide[index],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: colorForGuide[index],
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(width: 8),
                Text(colorGuide[index]),
                // Container(color: Colors.amber,width: 10 ,height: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(kMinInteractiveDimension);
    return WillPopScope(
        onWillPop: () {
          if (_currentIndex != 0) {
            if (_currentIndex == 2 && selectedMenu == "Search") {
              selectedMenu = null;
              setState(() {});
              return Future<bool>.value(false);
            } else {
              _currentIndex = 0;
              setState(() {});

              return Future<bool>.value(false);
            }
          } else {
            _currentIndex = 0;
            setState(() {});
            if (_showFirstColumn) {
              return Future<bool>.value(true);
            } else {
              _toggleVisibility();

              return Future<bool>.value(false);
            }
            // return Future<bool>.value(true);
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? MyAppColors.blue3
                                        : MyAppColors.white2),
                                child: Text(options[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.pop12Reg(
                                        color:
                                            isSelected ? Colors.white : null)),
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
                                      filterOption[selectedIndex].length,
                                      (index) {
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
            appBar: _currentIndex == 1
                ? AppBar(
                    leading: const SizedBox(),
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.classes,
                          color: MyAppColors.blue3,
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: "Classes",
                          style: AppTextStyles.rob16Medium(color: Colors.black),
                        )
                      ],
                    ),
                  )
                : _currentIndex == 2
                    ? AppBar(
                        leading: const SizedBox(),
                        centerTitle: true,
                        actions: [
                          PopupMenuButton<String>(
                            elevation: 3,
                            menuPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onSelected: (String value) {
                              if (value == "Info") {
                                _showSecondaryMenu(context);
                              } else {
                                context.read<CalenderBloc>().add(
                                    ChangeTargetDate(
                                        targetDateTime: DateTime.now()));
                                setState(() => selectedMenu = value);
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return List.generate(
                                menuItems.length,
                                (int index) => PopupMenuItem<String>(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 5),
                                  height: 30,
                                  value: menuItems[index],
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(svgImages[index]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        menuItems[index],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.more_vert),
                            offset: const Offset(0, 40),
                          ),
                        ],
                        backgroundColor: Colors.white,
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.calendar,
                              color: MyAppColors.blue3,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: "Calendar",
                              style: AppTextStyles.rob16Medium(
                                  color: MyAppColors.blue3),
                            ),
                          ],
                        ),
                      )
                    : null,
            body: [
              HomeScreen(
                searchBoxLeftRightPosition: _searchBoxLeftRightPosition,
                containerHeight: _containerHeight,
                controller: _controller,
                firstColumnAnimation: _firstColumnAnimation,
                searchBoxTopPosition: _searchBoxTopPosition,
                secondColumnAnimation: _secondColumnAnimation,
                showFirstColumn: _showFirstColumn,
                slideAnimation: _slideAnimation,
                stretchAnimation: _stretchAnimation,
                toggleVisibility: _toggleVisibility,
              ),
              const ClassesScreen(),
              selectedMenu == "Search"
                  ? const CalenderSearchScreen()
                  : CalenderScreen(
                      isRest: isReset,
                    ),
              const ComingSoon(),
            ][_currentIndex],
            bottomNavigationBar: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.0,
                        color: MyAppColors.inActiveBtn,
                        blurRadius: 0.0,
                        offset: Offset(0, -1),
                      ),
                    ],
                    color: MyAppColors.white,
                  ),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavBarItem(
                          label: "Home",
                          iconPath: AppImages.home,
                          index: 0,
                          currentIndex: _currentIndex,
                          onTap: _onNavItemTapped,
                        ),
                        _buildNavBarItem(
                          label: "Classes",
                          iconPath: AppImages.classes,
                          index: 1,
                          currentIndex: _currentIndex,
                          onTap: _onNavItemTapped,
                        ),
                        _buildNavBarItem(
                          label: "Calendar",
                          iconPath: AppImages.calendar,
                          index: 2,
                          currentIndex: _currentIndex,
                          onTap: _onNavItemTapped,
                        ),
                        _buildNavBarItem(
                          label: "More",
                          iconPath: AppImages.more,
                          index: 3,
                          currentIndex: _currentIndex,
                          onTap: _onNavItemTapped,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: _getIndicatorPosition(_currentIndex),
                  top: 0,
                  child: Container(
                    height: 4,
                    width: 34,
                    decoration: BoxDecoration(
                      color: MyAppColors.blue3,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: _currentIndex == 1
                ? SafeArea(
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        context.pushNamed(AppRouteNames.addClassRoute);

                        print("Floating Action Button Pressed");
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                : null));
  }

  double _getIndicatorPosition(int index) {
    double tabWidth = MediaQuery.sizeOf(context).width / 4;
    return (tabWidth * index) + (tabWidth / 2) - 17;
  }

  Widget _buildNavBarItem({
    required String label,
    required String iconPath,
    required int index,
    required int currentIndex,
    required Function(int) onTap,
  }) {
    final bool isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SvgPicture.asset(
              iconPath,
              color: isActive ? MyAppColors.blue3 : MyAppColors.inactiveNavBtn,
              height: 24,
              width: 24,
            ),
            const SizedBox(height: 4),
            AppText(
              text: label,
              fontSize: 12,
              color: isActive ? MyAppColors.blue3 : MyAppColors.inactiveNavBtn,
            ),
          ],
        ),
      ),
    );
  }
}
