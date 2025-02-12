import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/calender/bloc/calender_bloc.dart';
import 'package:msub/features/calender/widgets/custom_datetime.dart';
import 'package:msub/features/calender/widgets/schedules_list.dart';

class AllActives extends StatefulWidget {
  final MultipleMarkedDates? multipleMarkedDates;
  final bool isReset;
  const AllActives({super.key, this.multipleMarkedDates, this.isReset = false});

  @override
  State<AllActives> createState() => _AllActivesState();
}

class _AllActivesState extends State<AllActives> {
  final DateTime _currentDate = DateTime.now();
  List<String> types = ["Events", "Assignment", "Holiday"];

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2025, 1, 10): [
        Event(
          textStyle: const TextStyle(color: Colors.red),
          backgroundColor: Colors.red,
          dot: const SizedBox(),
          date: DateTime(2024, 12, 10),
          title: 'Event 2',
        ),
      ],
    },
  );

  @override
  void initState() {
    print("csbcjhbscsjhx");
    _markedDateMap.add(
        DateTime(2025, 1, 15),
        Event(
          dot: const SizedBox(),
          backgroundColor: MyAppColors.assignmentColor,
          textStyle: const TextStyle(color: MyAppColors.assignmentColor),
          date: DateTime(2024, 12, 15),
          title: 'Event 5',
        ));
    _markedDateMap.add(
        DateTime(2025, 1, 26),
        Event(
          dot: const SizedBox(),
          backgroundColor: MyAppColors.purple,
          textStyle: const TextStyle(color: MyAppColors.purple),
          date: DateTime(2019, 2, 25),
          title: 'Event 5',
        ));

    _markedDateMap.addAll(DateTime(2025, 1, 23), [
      Event(
        dot: Container(),
        backgroundColor: MyAppColors.assignmentColor,
        textStyle: const TextStyle(color: MyAppColors.assignmentColor),
        date: DateTime(2019, 2, 11),
        title: 'Event 3',
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderBloc, CalenderState>(
      builder: (context, state) {
        print(
          state.targetDateTime,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 15),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                context.read<CalenderBloc>().add(
                                    ChangeTargetDate(
                                        targetDateTime: DateTime(
                                            state.targetDateTime.year,
                                            state.targetDateTime.month - 1)));
                                // setState(() {
                                //   _targetDateTime = DateTime(
                                //       _targetDateTime.year,
                                //       _targetDateTime.month - 1);
                                //   _currentMonth =
                                //       DateFormat.yMMM().format(_targetDateTime);
                                // });
                              },
                              child: const Icon(
                                Icons.keyboard_arrow_left_outlined,
                                size: 15,
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => CustomDatePickerWidget(
                                    initialDate: state.targetDateTime,
                                    onDateSelected: (DateTime selectedDate) {
                                      context.read<CalenderBloc>().add(
                                          SelectDate(
                                              selectDateTime: selectedDate));
                                      // setState(() {
                                      //   _currentDate2 = selectedDate;
                                      //   // _targetDateTime = selectedDate;
                                      //   // _currentMonth = DateFormat.yMMM()
                                      //   //     .format(_targetDateTime);
                                      // });
                                    },
                                  ),
                                );
                              },
                              child: Text(state.currentMonth,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.pop14Reg()),
                            )),
                            if (state.targetDateTime.isBefore(DateTime(2030,
                                _currentDate.month - 1, _currentDate.day)))
                              GestureDetector(
                                child: const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  size: 15,
                                ),
                                onTap: () {
                                  context.read<CalenderBloc>().add(
                                      ChangeTargetDate(
                                          targetDateTime: DateTime(
                                              state.targetDateTime.year,
                                              state.targetDateTime.month + 1)));
                                },
                              )
                          ],
                        ),
                      ),
                      CalendarCarousel<Event>(
                        showHeader: false,
                        targetDateTime: state.targetDateTime,
                        multipleMarkedDates: widget.multipleMarkedDates,
                        // markedDateCustomTextStyle:const TextStyle(color: Colors.amber),
                        // daysHaveCircularBorder:true,
                        markedDateMoreCustomDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8))),

                        daysHaveCircularBorder: false,
                        selectedDayButtonColor: MyAppColors.blue3,
                        //     _currentDate2 == DateTime(2025, 1, 23)
                        //         ? MyAppColors.red
                        //         : MyAppColors.blue3,
                        weekdayTextStyle:
                            AppTextStyles.pop10Reg(color: Colors.black),

                        onDayPressed: (date, events) {
                          context
                              .read<CalenderBloc>()
                              .add(SelectDate(selectDateTime: date));
                          // setState(() => currentDate2 = date);
                          for (var event in events) {
                            print(event.title);
                          }
                        },
                        showOnlyCurrentMonthDate: false,

                        weekendTextStyle:
                            AppTextStyles.pop12Reg(color: Colors.black),
                        weekFormat: false,
                        markedDatesMap: _markedDateMap,
                        height: 300.0,
                        selectedDateTime: state.currentDate2,
                        selectedDayBorderColor: Colors.transparent,
                        todayBorderColor: Colors.transparent,

                        customGridViewPhysics:
                            const NeverScrollableScrollPhysics(),
                        markedDateCustomShapeBorder:
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                        // const CircleBorder(side: BorderSide(color: Colors.yellow)),
                        markedDateCustomTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                        // showHeader: false,
                        iconColor: Colors.black,
                        headerTextStyle:
                            AppTextStyles.pop14Reg(color: MyAppColors.black),
                        todayTextStyle:
                            const TextStyle(color: MyAppColors.blue3),
                        // markedDateShowIcon: true,
                        // markedDateIconMaxShown: 2,
                        // markedDateIconBuilder: (event) {
                        //   return event.icon;
                        // },
                        // markedDateMoreShowTotal:
                        //     true,
                        todayButtonColor: MyAppColors.todayBlue,
                        selectedDayTextStyle:
                            const TextStyle(color: MyAppColors.white),
                        // minSelectedDate:
                        //     _currentDate.subtract(const Duration(days: 360)),
                        maxSelectedDate: DateTime(
                            2030, _currentDate.month, _currentDate.day),
                        prevDaysTextStyle:
                            AppTextStyles.pop12Reg(color: Colors.grey),
                        inactiveDaysTextStyle: const TextStyle(
                          fontSize: 16,
                        ),

                        onCalendarChanged: (DateTime date) {},
                        onDayLongPressed: (DateTime date) {
                          print('long pressed date $date');
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  "Schedules ${state.currentDate2 != null ? DateFormat('dd/MM/yyyy').format(state.currentDate2!) : state.currentMonth}",
                  style: AppTextStyles.rob16Medium(),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (true) ...[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: types.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SchedulesList(
                        type: types[index],
                      );
                    },
                  )
                ] else ...[
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.noEvent))),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text(
                      "No activities scheduled for this date. Enjoy your free time!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.pop12Reg(
                          color: MyAppColors.inActiveText),
                    ),
                  )
                ]
                // Text(
                //   "Events",
                //   style: AppTextStyles.pop10Reg(color: MyAppColors.inActiveText),
                // ),
                // const SizedBox(
                //   height: 6,
                // ),
                // ListView.separated(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           const SchedulesWidget(textColor:  MyAppColors.purple,),
                //           if (index == 11)
                //             const SizedBox(
                //               height: 5,
                //             )
                //         ],
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return const SizedBox(
                //         height: 5,
                //       );
                //     },
                //     itemCount: 12)
              ],
            ),
          ),
        );
      },
    );
  }
}
