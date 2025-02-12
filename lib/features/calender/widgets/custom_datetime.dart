import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomDatePickerWidget({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  _CustomDatePickerWidgetState createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  late int _selectedMonth;
  late int _selectedDay;
  late int _selectedYear;

  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _yearController;

  final List<String> _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  final int _minYear = 2000;
  final int _maxYear = 2030;

  @override
  void initState() {
    super.initState();
    _selectedMonth = widget.initialDate.month;
    _selectedDay = widget.initialDate.day;
    _selectedYear = widget.initialDate.year;

    _monthController =
        FixedExtentScrollController(initialItem: _selectedMonth - 1);
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);
    _yearController =
        FixedExtentScrollController(initialItem: _selectedYear - _minYear);
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    DateTime selectedDate =
        DateTime(_selectedYear, _selectedMonth, _selectedDay);
    print(selectedDate);
    widget.onDateSelected(selectedDate);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 30),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Month Picker
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    controller: _monthController,
                    itemExtent: 40,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      // _selectedDay = 1;
                      // _dayController.jumpToItem(_selectedDay - 1);
                      setState(() {
                        _selectedMonth = index + 1;
                        int maxDaysInMonth =
                            DateTime(_selectedYear, _selectedMonth + 1, 0).day;
                        if (_selectedDay > maxDaysInMonth) {
                          _selectedDay = 1;
                          _dayController.jumpToItem(_selectedDay - 1);
                        }
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(_months[index],
                              style: index + 1 == _selectedMonth
                                  ? AppTextStyles.rob20Semi(
                                      color: MyAppColors.blue3)
                                  : AppTextStyles.pop12Reg(
                                      color: MyAppColors.inActiveText)
                              // TextStyle(
                              //   fontSize: 16,
                              //   fontWeight: FontWeight.bold,
                              //   color: index + 1 == _selectedMonth
                              //       ? Colors.blue
                              //       : Colors.grey,
                              // ),
                              ),
                        );
                      },
                      childCount: _months.length,
                    ),
                  ),
                ),
                // Day Picker
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    controller: _dayController,
                    itemExtent: 40,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedDay = index + 1;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text("${index + 1}",
                              style: index + 1 == _selectedDay
                                  ? AppTextStyles.rob20Semi(
                                      color: MyAppColors.blue3)
                                  : AppTextStyles.pop12Reg(
                                      color: MyAppColors.inActiveText)),
                        );
                      },
                      childCount: DateTime(_selectedYear, _selectedMonth + 1, 0)
                          .day, // Days in the selected month
                    ),
                  ),
                ),
                // Year Picker
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    controller: _yearController,
                    itemExtent: 40,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedYear = _minYear + index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text("${_minYear + index}",
                              style: _minYear + index == _selectedYear
                                  ? AppTextStyles.rob20Semi(
                                      color: MyAppColors.blue3)
                                  : AppTextStyles.pop12Reg(
                                      color: MyAppColors.inActiveText)),
                        );
                      },
                      childCount: _maxYear - _minYear + 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: MyAppColors.inActiveText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pop(context),
                  behavior: HitTestBehavior.translucent,
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.rob16Medium(),
                  ),
                ),
                TextButton(
                  onPressed: _onConfirm,
                  child: Text(
                    "OK",
                    style: AppTextStyles.rob16Medium(color: MyAppColors.blue3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
