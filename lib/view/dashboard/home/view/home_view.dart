import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/view/dashboard/home/view/announcement_view.dart';
import 'package:msub/view/dashboard/home/view/facilities_view.dart';
import 'package:msub/view/dashboard/home/view/help_support_view.dart';
import 'package:msub/view/dashboard/home/view/profile_view.dart';
import 'package:msub/view/dashboard/home/view/search_view.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../../common/utils/assets.dart';
import '../../../../widgets/custom_text.dart';
import '../../../notification/view/notification_view.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final HomeController controller = Get.put(HomeController());
  late AnimationController _controller;
  late Animation<double> _containerHeight;
  late Animation<double> _stretchAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Define animations
    _containerHeight = Tween<double>(begin: 60.0, end: 300.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _stretchAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward(); // Start the animation
    Future.delayed(const Duration(milliseconds: 600), () {
      Get.to(() => SearchView()); // Navigate after the animation finishes
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.22,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.headerBgImg),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(screenWidth * 0.1),
                          bottomRight: Radius.circular(screenWidth * 0.1),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => ProfileView());
                                  },
                                  child: CircleAvatar(
                                    radius: screenWidth * 0.07,
                                    backgroundColor: AppColors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        Assets.profileIcon,
                                        fit: BoxFit.cover,
                                        width: screenWidth * 0.18,
                                        height: screenWidth * 0.18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Obx(() => Text(
                                      "Hi, ${controller.userName.value}",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    // Get.to(NotificationOldView());
                                    Get.to(() => const NotificationView());
                                  },
                                  child: Container(
                                    width: screenWidth * 0.13,
                                    height: screenWidth * 0.13,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.notification_add,
                                      color: AppColors.blueText,
                                      size: screenWidth * 0.06,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              top: screenHeight * 0.25,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Height(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Discover",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Toggle the "showAll" flag
                              controller.showAll.value =
                                  !controller.showAll.value;
                            },
                            child: Obx(() => Text(
                                  controller.showAll.value
                                      ? "Show Less"
                                      : "More",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                    fontFamily: 'Roboto',
                                  ),
                                )),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      Obx(() => GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: controller.showAll.value
                                ? controller.items.length
                                : 8,
                            itemBuilder: (context, index) {
                              if (index == 8) {
                                return AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: controller.showAll.value ? 1.0 : 0.0,
                                  child: controller.showAll.value
                                      ? _buildGridItem(
                                          controller.items[index],
                                          () {}, // No action for the last item
                                        )
                                      : const SizedBox.shrink(),
                                );
                              }
                              return _buildGridItem(
                                controller.items[index],
                                () {
                                  // Handle navigation
                                  if (controller.items[index]['title'] ==
                                      'Faculties') {
                                    Get.to(() => FacilitiesView());
                                  }
                                },
                              );
                            },
                          )),

                      const Height(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            "Announcements",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AnnouncementView());
                            },
                            child: const CustomText(
                              "More",
                              fontSize: 12,
                              color: AppColors.blueText,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      Height(height: screenHeight * 0.01),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.lineColors.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin:
                                EdgeInsets.only(bottom: screenHeight * 0.01),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 5,
                                  height: Get.height * 0.07,
                                  color: controller.lineColors[index],
                                  margin: const EdgeInsets.all(20),
                                ),
                                const Width(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        "Exam Results Published",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Height(height: screenHeight * 0.005),
                                      const CustomText(
                                        "Find semester results available now!",
                                        fontSize: 12,
                                        color: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const Height(height: 20),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: NotesWidgets(
                                  txt1: "28 Days",
                                  txt2: "left for Exam",
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
                                  txt1: "12/17/24",
                                  txt2: "Exam date",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Height(height: 20),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                      const Height(height: 20),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: NotesWidgets(
                                  txt1: "45 Days",
                                  txt2: "Completed",
                                ),
                              ),
                              Expanded(
                                child: NotesWidgets(
                                  selected: true,
                                  txt1: "60%",
                                  txt2: "Progress",
                                ),
                              ),
                              Expanded(
                                child: NotesWidgets(
                                  txt1: "75 Days",
                                  txt2: "Remaining",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Height(height: 30),

                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        child: Container(
                            height: 160,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 21, vertical: 13),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 12),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Assets.helpSupportImg),
                                    fit: BoxFit.fill),
                                color: AppColors.primary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        "Help & Support",
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Height(height: 10),
                                      const CustomText(
                                        "Facing issues?\nWe’re here to help!",
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      const Height(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          // context.pushNamed(AppRouteNames.helpSupport);
                                          Get.to(() => HelpSupportView());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                              color: AppColors.white
                                                  .withOpacity(0.20),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const CustomText(
                                            "Contact Support",
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )

                            //  Stack(
                            //   children: [
                            //     Positioned(
                            //       top: -112,
                            //       left: -129,
                            //       child: Container(
                            //         width: 285,
                            //         height: 285,
                            //         decoration: const BoxDecoration(
                            //           color: AppColors.blue1,
                            //           shape: BoxShape.circle,
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       top: -211,
                            //       left: 269,
                            //       child: Container(
                            //         width: 285,
                            //         height: 285,
                            //         decoration: const BoxDecoration(
                            //           color: AppColors.blue1,
                            //           shape: BoxShape.circle,
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       top: 64,
                            //       left: 237,
                            //       child: Container(
                            //         width: 156,
                            //         height: 156,
                            //         decoration: const BoxDecoration(
                            //           color: AppColors.blue1,
                            //           shape: BoxShape.circle,
                            //         ),
                            //       ),
                            //     ),

                            //   ],
                            // ),

                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.195,
              left: screenWidth * 0.07,
              right: screenWidth * 0.07,
              child: Center(
                child: Container(
                  width: screenWidth * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _onTap();
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            Assets.searchIcon,
                            height: 16,
                            width: 16,
                          ).paddingAll(14),
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 500),
            //   curve: Curves.easeInOut, // Smooth transition
            //   top: searchBoxTopPosition,
            //   left: searchBoxLeftRightPosition,
            //   right: searchBoxLeftRightPosition,
            //   child: Stack(
            //     children: [
            //       CustomTextInput(
            //         // onTap: () {
            //         //   onTap?.call();
            //         // },
            //         enable: isEditable,
            //         radius: 36, contentPadValue: 15, maxLines: 1,
            //         prefixIcon: const Icon(Icons.search),
            //         // SvgPicture.asset(
            //         //   AppImages.search,
            //         // ),
            //         hintText: "Search",
            //         controller: TextEditingController(),
            //         keyboardType: TextInputType.text,
            //       ),
            //       if (!isEditable)
            //         Positioned.fill(
            //           child: GestureDetector(
            //             behavior: HitTestBehavior.translucent,
            //             onTap: () {
            //               print("on tapmcalled");
            //               onTap?.call();
            //             },
            //             child: AbsorbPointer(
            //               child: Container(
            //                 color: Colors.transparent,
            //               ),
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ));
  }

  Widget _buildGridItem(Map<String, String> item, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: Get.width * 0.15,
            height: Get.height * 0.065,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item['title']!,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class NotesWidgets extends StatelessWidget {
  final String txt1;
  final String txt2;
  final bool selected;

  const NotesWidgets(
      {super.key,
      required this.txt1,
      required this.txt2,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          CustomText(
            txt1,
            color: selected ? AppColors.white : AppColors.primary,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          const SizedBox(
            height: 3,
          ),
          CustomText(txt2,
              fontSize: 14,
              color: selected ? AppColors.white : AppColors.black),
        ],
      ),
    );
  }
}
