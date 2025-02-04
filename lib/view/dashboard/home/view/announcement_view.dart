import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/size_space.dart';
import '../controller/announcement_view_controller.dart';
import 'announcement_detail_view.dart';

class AnnouncementView extends StatelessWidget {
  final AnnouncementViewController controller = Get.put(AnnouncementViewController());

  AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                height: screenHeight * 0.14,
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                      // Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(Icons.arrow_back_rounded, size: 30),
                          ),
                          Row(
                            children: [
                              Image.asset(Assets.announcementIcon, height: 25, width: 25),
                              const Width(width: 5),
                              const CustomText("Announcement", fontSize: 24, fontWeight: FontWeight.w500),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ),
                      Height(height: Get.height * 0.05),

                      Obx(
                        () => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("Filter button pressed");
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.filter_list, color: AppColors.black, size: 20),
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
                              Row(
                                children: controller.categories.map((category) {
                                  final isSelected = controller.selectedCategory.value == category;
                                  return GestureDetector(
                                    onTap: () => controller.selectedCategory.value = category,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected ? AppColors.primary : AppColors.white,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(color: isSelected ? AppColors.primary : AppColors.white, width: 1),
                                      ),
                                      child: CustomText(
                                        category,
                                        fontSize: 16,
                                        color: isSelected ? AppColors.white : AppColors.textPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Height(height: Get.height * 0.01),

          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.filteredItems.length,
                itemBuilder: (context, index) {
                  final item = controller.filteredItems[index];
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => AnnouncementDetailView());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.white, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  item["category"]!,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                const Width(width: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 20, color: AppColors.darkerGrey),
                                    const SizedBox(width: 4),
                                    CustomText(
                                      item["date"]!,
                                      color: AppColors.darkerGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    item["description"]!,
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: controller.getCategoryColor(item["category"]!),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: CustomText(
                                    item["category"]!,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const CustomText(
                                  "10:12 AM",
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
