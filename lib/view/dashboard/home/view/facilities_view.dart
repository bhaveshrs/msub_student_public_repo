import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/controller/facilities_controller.dart';
import 'package:msub/view/dashboard/home/view/library_view.dart';
import 'package:msub/view/dashboard/home/view/scholarship.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../../common/utils/app_colors.dart';
import 'home_view.dart';

class FacilitiesView extends StatelessWidget {
  FacilitiesView({super.key});

  FacilitiesController controller = Get.put(FacilitiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.servicesIcon,
                          height: 35,
                          width: 35,
                        ),
                        const Width(width: 5),
                        const CustomText(
                          "Facilities",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Height(height: 20),
                  Container(
                    width: Get.width,
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
                          // Get.to(() => SearchView());
                        },
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              Assets.searchIcon,
                              height: 16,
                              width: 16,
                            ).paddingAll(14),
                            hintText: "Search Services, Locations, or Facilities...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Height(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Toggle the "showAll" flag
                          controller.showAll.value = !controller.showAll.value;
                        },
                        child: Obx(() => Text(
                              controller.showAll.value ? "Show Less" : "More",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontFamily: 'Roboto',
                              ),
                            )),
                      ),
                    ],
                  ),
                  const Height(height: 20),
                  Obx(
                    () => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: controller.showAll.value ? controller.items.length : 8,
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
                            if (controller.items[index]['title'] == 'Library') {
                              Get.to(() => LibraryView());
                            }else  if (controller.items[index]['title'] == 'Scholarship') {
                              Get.to(() => const Scholarship());
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const Height(height: 20),
                  const Text(
                    "Quick Access",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const Height(height: 20),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width * .7,
                          height: Get.height * .4,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20), // Rounded corners
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://as2.ftcdn.net/v2/jpg/05/16/64/45/500_F_516644575_wwbNGXJ1s2u9BVBkSxN6KOkLAdd13P7x.jpg",
                                  width: Get.width * .7,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "National Merit Scholarship",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Deadline : Feb 15, 2025",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(20), // Rounded corners
                                  ),
                                  child: const Text(
                                    "View More",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ).paddingOnly(right: 16);
                      },
                    ),
                  ),
                  const Height(height: 20),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: NotesWidgets(
                              txt1: "10+",
                              txt2: "Library",
                            ),
                          ),
                          Expanded(
                            child: NotesWidgets(
                              selected: true,
                              txt1: "2+",
                              txt2: "Computer Labs",
                            ),
                          ),
                          Expanded(
                            child: NotesWidgets(
                              txt1: "2+",
                              txt2: "Lorium",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Height(height: 20),
                ],
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
        ),
      ),
    );
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
