import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:get/get.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/assets.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/filteroption.dart';
import '../../../../widgets/size_space.dart';
import '../controller/calender_controller.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> with SingleTickerProviderStateMixin {
  final CalenderViewController controller = Get.put(CalenderViewController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;

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
                                child: CustomText(controller.options[index],
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                    fontSize: 14,
                                    color: isSelected ? AppColors.white : AppColors.black)),
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
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: <Widget>[
              Container(
                height: Get.height * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(Assets.calendarIcon, height: 27, width: 27,color: AppColors.primary,),
                      const Width(width: 5),
                      const CustomText(
                        "Calendar",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              const Height(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.filter_list, color: AppColors.black, size: 18),
                            Width(width: 8),
                            CustomText(
                              'Filter',
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonsTabBar(
                      controller: tabController,
                      height: 50,
                      duration: 400,
                      buttonMargin: const EdgeInsets.all(8),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      unselectedDecoration:
                          const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(26))),
                      decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(26))),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
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
                        Tab(
                          text: "Holidays Only",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    AllActives(
                      multipleMarkedDates: MultipleMarkedDates(markedDates: [
                        MarkedDate(
                          textStyle: const TextStyle(color: Colors.white),
                          color: AppColors.primary,
                          date: DateTime.now(),
                        )
                      ]),
                    ),
                    AssignmentsOnly(),
                    EventOnly(),
                    HolidayOnly()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllActives extends StatefulWidget {
  final MultipleMarkedDates? multipleMarkedDates;

  const AllActives({super.key, this.multipleMarkedDates});

  @override
  State<AllActives> createState() => _AllActivesState();
}

class _AllActivesState extends State<AllActives> {
  final DateTime _currentDate = DateTime.now();
  DateTime? _currentDate2;
  final String _currentMonth = DateFormat.yMMM().format(DateTime.now());

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2024, 12, 10): [
        Event(
          // textStyle: const TextStyle(color: Colors.red),
          // backgroundColor: Colors.red,
          dot: const SizedBox(),
          date: DateTime(2024, 12, 10),
          title: 'Event 2',
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        DateTime(2024, 12, 15),
        Event(
          dot: const SizedBox(),
          // backgroundColor: AppColors.assignmentColor,
          // textStyle: const TextStyle(color: AppColors.assignmentColor),
          date: DateTime(2024, 12, 15),
          title: 'Event 5',
        ));
    _markedDateMap.add(
        DateTime(2024, 12, 26),
        Event(
          dot: const SizedBox(),
          // backgroundColor: AppColors.purple,
          // textStyle: const TextStyle(color: AppColors.purple),
          date: DateTime(2019, 2, 25),
          title: 'Event 5',
        ));

    _markedDateMap.addAll(DateTime(2024, 12, 23), [
      Event(
        dot: Container(),
        // backgroundColor: AppColors.assignmentColor,
        // textStyle: const TextStyle(color: AppColors.assignmentColor),
        date: DateTime(2019, 2, 11),
        title: 'Event 3',
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 34),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
              child: CalendarCarousel<Event>(
                multipleMarkedDates: widget.multipleMarkedDates,
                //  MultipleMarkedDates(markedDates: [
                //   MarkedDate(
                //     textStyle: const TextStyle(color: Colors.white),
                //     color: Colors.red,
                //     date: DateTime(2024, 12, 10),
                //   )
                // ]),
                // markedDateCustomTextStyle:const TextStyle(color: Colors.amber),
                // daysHaveCircularBorder:true,
                markedDateMoreCustomDecoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),

                daysHaveCircularBorder: false,
                selectedDayButtonColor: AppColors.lighterGrey,
                weekdayTextStyle: const TextStyle(color: Colors.black),

                onDayPressed: (date, events) {
                  // setState(() => _currentDate2 = date);
                  // for (var event in events) {
                  //   print(event.title);
                  // }
                },
                showOnlyCurrentMonthDate: false,

                weekendTextStyle: const TextStyle(color: Colors.black),
                weekFormat: false,
                markedDatesMap: _markedDateMap,
                height: 400.0,
                selectedDateTime: _currentDate,
                selectedDayBorderColor: Colors.transparent,

                customGridViewPhysics: const NeverScrollableScrollPhysics(),
                markedDateCustomShapeBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                // const CircleBorder(side: BorderSide(color: Colors.yellow)),
                markedDateCustomTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
                // showHeader: false,
                iconColor: Colors.black,
                headerTextStyle: const TextStyle(color: AppColors.black),
                todayTextStyle: const TextStyle(color: AppColors.primary),
                // markedDateShowIcon: true,
                // markedDateIconMaxShown: 2,
                // markedDateIconBuilder: (event) {
                //   return event.icon;
                // },
                // markedDateMoreShowTotal:
                //     true,
                todayButtonColor: AppColors.primary,
                selectedDayTextStyle: const TextStyle(color: AppColors.primary),
                minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
                maxSelectedDate: _currentDate.add(const Duration(days: 360)),
                prevDaysTextStyle: const TextStyle(color: Colors.black),
                inactiveDaysTextStyle: const TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 16,
                ),
                onCalendarChanged: (DateTime date) {
                  // setState(() {
                  //   _targetDateTime = date;
                  //   _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                  // });
                },
                onDayLongPressed: (DateTime date) {
                  print('long pressed date $date');
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Schedules on January",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
            ),
            const Height(height: 15),
            const Text(
              "Events",
              style: TextStyle(fontSize: 16),
            ),
            const Height(height: 10),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Republic Day",
                            style: TextStyle(fontSize: 14, color: AppColors.purple, fontWeight: FontWeight.w600),
                          ),
                          // ),
                          Text(
                            "09 - 01 PM",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )

                      );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: 2),

            const Height(height: 15),
            const Text(
              "Assignment",
              style: TextStyle(fontSize: 16),
            ),
            const Height(height: 10),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Republic Day Holiday",
                            style: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.w600),
                          ),
                          // ),
                          Text(
                            "09 - 01 PM",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )

                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: 2),

            const Height(height: 15),
            const Text(
              "Holiday",
              style: TextStyle(fontSize: 16),
            ),
            const Height(height: 10),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lorium Ipsum Event",
                            style: TextStyle(fontSize: 14, color: AppColors.red, fontWeight: FontWeight.w600),
                          ),
                          // ),
                          Text(
                            "09 - 01 PM",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )

                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: 2),
            const Height(height: 10),
          ],
        ),
      ),
    );
  }
}

class AssignmentsOnly extends StatelessWidget {
  AssignmentsOnly({super.key});

  // Explicitly define the type of the assignments list
  final RxList<Map<String, dynamic>> assignments = <Map<String, dynamic>>[
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              var group = assignments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Header
                    Row(
                      children: [
                        Text(
                          group['date'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        const Width(width: 10),
                        const Expanded(
                            child: Divider(
                          thickness: .5,
                          color: AppColors.grey,
                        ))
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...((group['tasks'] as List<dynamic>?) ?? []).map<Widget>((task) {
                      // Safely map over the tasks
                      var taskMap = task as Map<String, String>;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.circle_outlined, size: 10, color: AppColors.grey),
                          const Width(width: 20),
                          Text(
                            taskMap['time']!,
                            style: const TextStyle(color: AppColors.grey, fontSize: 14),
                          ),
                          const Width(width: 20),
                          Text(
                            taskMap['title']!,
                            style: const TextStyle(color: AppColors.primary, fontSize: 16),
                          ),
                        ],
                      ).paddingOnly(bottom: 20);
                    }).toList(),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class EventOnly extends StatelessWidget {
  EventOnly({super.key});

  // Explicitly define the type of the assignments list
  final RxList<Map<String, dynamic>> assignments = <Map<String, dynamic>>[
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              var group = assignments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Header
                    Row(
                      children: [
                        Text(
                          group['date'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        const Width(width: 10),
                        const Expanded(
                            child: Divider(
                          thickness: .5,
                          color: AppColors.grey,
                        ))
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...((group['tasks'] as List<dynamic>?) ?? []).map<Widget>((task) {
                      // Safely map over the tasks
                      var taskMap = task as Map<String, String>;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.circle_outlined, size: 10, color: AppColors.grey),
                          const Width(width: 20),
                          Text(
                            taskMap['time']!,
                            style: const TextStyle(color: AppColors.grey, fontSize: 14),
                          ),
                          const Width(width: 20),
                          Text(
                            taskMap['title']!,
                            style: const TextStyle(color: AppColors.purple, fontSize: 16),
                          ),
                        ],
                      ).paddingOnly(bottom: 20);
                    }).toList(),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HolidayOnly extends StatelessWidget {
  HolidayOnly({super.key});

  // Explicitly define the type of the assignments list
  final RxList<Map<String, dynamic>> assignments = <Map<String, dynamic>>[
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Saturday, Dec 28",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Monday, Dec 30",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
    {
      "date": "Tuesday, Dec 31",
      "tasks": [
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
        {"time": "01 - 02 PM", "title": "Design Studio Assignment"},
      ]
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              var group = assignments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Header
                    Row(
                      children: [
                        Text(
                          group['date'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        const Width(width: 10),
                        const Expanded(
                            child: Divider(
                          thickness: .5,
                          color: AppColors.grey,
                        ))
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...((group['tasks'] as List<dynamic>?) ?? []).map<Widget>((task) {
                      // Safely map over the tasks
                      var taskMap = task as Map<String, String>;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.circle_outlined, size: 10, color: AppColors.grey),
                          const Width(width: 20),
                          Text(
                            taskMap['time']!,
                            style: const TextStyle(color: AppColors.grey, fontSize: 14),
                          ),
                          const Width(width: 20),
                          Text(
                            taskMap['title']!,
                            style: const TextStyle(color: AppColors.red, fontSize: 16),
                          ),
                        ],
                      ).paddingOnly(bottom: 20);
                    }).toList(),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
