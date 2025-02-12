import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/home/widgets/announcement_box.dart';
import 'package:msub/features/home/widgets/class_detail_box.dart';
import 'package:msub/features/home/widgets/search_history_item.dart';
import 'package:msub/features/home/widgets/title_more.dart';
import 'package:msub/features/home/widgets/top_welcom.dart';
import 'package:msub/view/dashboard/home/view/home_view.dart';

class HomeScreen extends StatefulWidget {
  final bool showFirstColumn;
  final AnimationController controller;
  final Animation<Offset> firstColumnAnimation;
  final Animation<Offset> secondColumnAnimation;
  final Animation<Offset> slideAnimation;
  final Animation<double> stretchAnimation;
  final double searchBoxTopPosition;
  final double searchBoxLeftRightPosition;
  final double containerHeight;
  final Function? toggleVisibility;
  const HomeScreen(
      {super.key,
      required this.showFirstColumn,
      required this.controller,
      required this.firstColumnAnimation,
      required this.secondColumnAnimation,
      required this.slideAnimation,
      required this.stretchAnimation,
      required this.searchBoxTopPosition,
      required this.containerHeight,
      this.toggleVisibility,
      required this.searchBoxLeftRightPosition});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> items = [
    //  {'title': 'Academic', 'image': Assets.academicIcon},
    // {'title': 'Exam', 'image': Assets.examIcon},
    // {'title': 'Events', 'image': Assets.eventIcon},
    // {'title': 'Sports', 'image': Assets.sportsIcon},
    // {'title': 'Placements', 'image': Assets.placementsIcon},
    // {'title': 'Milestone', 'image': Assets.milestoneIcon},
    // {'title': 'Assignments', 'image': Assets.assignmentsIcon},
    // {'title': 'Faculties', 'image': Assets.servicesIcon},
    // {'title': 'Services', 'image': Assets.servicesIcon},
    {'title': 'Academic', 'image': AppImages.academic},
    {'title': 'Exam', 'image': AppImages.exam},
    {'title': 'Events', 'image': AppImages.events},
    {'title': 'Sports', 'image': AppImages.sports},
    {'title': 'Placements', 'image': AppImages.placements},
    {'title': 'Milestone', 'image': AppImages.milestone},
    {'title': 'Assignments', 'image': AppImages.assignments},
    // {'title': 'Faculties', 'image': AppImages.services},
    {'title': 'Services', 'image': AppImages.services},
  ];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Welcome(
            searchBoxLeftRightPosition: widget.searchBoxLeftRightPosition,
            isEditable: !widget.showFirstColumn,
            onTap: widget.toggleVisibility,
            containerHeight: widget.containerHeight,
            stretchAnimation: widget.stretchAnimation,
            secondColumnAnimation: widget.slideAnimation,
            searchBoxTopPosition: widget.searchBoxTopPosition,
          ),
          if (widget.showFirstColumn) ...[
            SlideTransition(
              position: widget.firstColumnAnimation,
              child: Column(
                children: [
            
                  TitleMore(
                    title: "Discover",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 6) {
                              context.pushNamed(AppRouteNames.facultiesScreen);
                            }
                          },
                          child: Column(
                            children: [
                              // Image with a container and padding
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.065,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Image.asset(
                                  items[index]['image']!,
                                  // height: 80,
                                  // width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              AppText(
                                  text: items[index]['title']!,
                                  style: AppTextStyles.pop12Reg()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  TitleMore(
                    title: "Announcemnts",
                    onTap: () {
                      context.pushNamed(AppRouteNames.moreAnnouncementRoute);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //  AnnouncementBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0) +
                        const EdgeInsets.only(bottom: 22),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 14,
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const AnnouncementBox();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: NotesWidgets(
                                txt1: "IXD 260",
                                txt2: "Subject Name",
                              ),
                            ),
                            Expanded(
                              child: NotesWidgets(
                                selected: true,
                                txt1: "IXD 260",
                                txt2: "Subject Name",
                              ),
                            ),
                            Expanded(
                              child: NotesWidgets(
                                txt1: "IXD 260",
                                txt2: "Subject Name",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: NotesWidgets(
                                txt1: "01/08/24",
                                txt2: "Semester Starting Date",
                              ),
                            ),
                            Expanded(
                              child: NotesWidgets(
                                selected: true,
                                txt1: "01/08/24",
                                txt2: "Semester Closing Date",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 13),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.helpAndSupportBg),
                                fit: BoxFit.cover),
                            color: MyAppColors.blue3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Help & Support",
                                    style: AppTextStyles.rob20Semi(
                                            color: Colors.white)
                                        .copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text("Facing issues? We’re here to help!",
                                      style: AppTextStyles.pop12ExLite(
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .pushNamed(AppRouteNames.helpSupport);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: MyAppColors.white
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Contact Support",
                                        style: AppTextStyles.pop10Reg(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(AppImages.helpAndSupport)
                          ],
                        )),
                  )
                ],
              ),
            )
          ] else ...[
            SlideTransition(
                position: widget.secondColumnAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Search History",
                              style: AppTextStyles.pop12Reg(
                                  color: MyAppColors.inActiveText),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Divider(color: MyAppColors.inActiveText),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return SearchHistoryItem(
                            svg: AppImages.history,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Search History",
                              style: AppTextStyles.pop12Reg(
                                  color: MyAppColors.inActiveText),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Divider(color: MyAppColors.inActiveText),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return SearchHistoryItem(
                            svg: AppImages.leftUpTiledArrow,
                          );
                        },
                      )
                    ],
                  ),
                ))
          ]
        ],
      ),
    );
  }
}
