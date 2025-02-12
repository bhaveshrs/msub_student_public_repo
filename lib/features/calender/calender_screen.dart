import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/features/calender/all_actives.dart';
import 'package:msub/features/calender/calender_listing_view.dart';


class CalenderScreen extends StatefulWidget {
  final bool isRest;
  const CalenderScreen({super.key, required this.isRest});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
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
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0) +
                  const EdgeInsets.only(top: 20),
              child: ButtonsTabBar(
                controller: tabController,
                height: 50,
                duration: 400,
                buttonMargin: const EdgeInsets.all(8),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                unselectedDecoration: const BoxDecoration(
                    color: MyAppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                decoration: const BoxDecoration(
                    color: MyAppColors.blue3,
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
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
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  AllActives(
                    isReset: widget.isRest,
                    multipleMarkedDates: MultipleMarkedDates(markedDates: [
                      MarkedDate(
                        textStyle: const TextStyle(color: Colors.white),
                        color: MyAppColors.blue3,
                        date: DateTime.now(),
                      )
                    ]),
                  ),
                  const CalenderListingView(
                    type: "Assignments",
                  ),
                  const CalenderListingView(
                    type: "Events",
                  ),
                  const CalenderListingView(
                    type: "Holidays",
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
