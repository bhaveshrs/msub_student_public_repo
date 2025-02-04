import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/assets.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/size_space.dart';
import '../controller/announcement_detail_controller.dart';

class AnnouncementDetailView extends StatelessWidget {
  final AnnouncementDetailsController controller = Get.put(AnnouncementDetailsController());

   AnnouncementDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              Image.asset(
                                Assets.announcementIcon,
                                height: 30,
                                width: 30,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.announcement, size: 30);
                                },
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Announcement",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ),
                       Height(height: Get.height*0.06),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                'AI in Modern Education',
                                color: AppColors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Lorem ipsum dolor sit amet consectetur. Lorem ipsum amet dignissim.',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(height: 16),
                              const Row(
                                children: [
                                   Icon(Icons.timer, size: 20, color: AppColors.darkerGrey),
                                   Width(width: 4),
                                  CustomText(
                                    '10:00 AM',
                                    color: AppColors.darkerGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Width(width: 15),
                                   Icon(Icons.calendar_today, size: 20, color: AppColors.darkerGrey),
                                   Width(width: 4),
                                  CustomText(
                                    '18/11/2024',
                                    color: AppColors.darkerGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              const Height(height: 16),
                              const Row(
                                children: [
                                  Icon(Icons.person, size: 16, color: Colors.grey),
                                   Width(width: 8),
                                  Expanded(
                                    child:  CustomText(
                                      'Dr. John Doe, AI Specialist',
                                      color: AppColors.darkerGrey,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Height(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Add to Calendar'),
                                  ),
                                  Obx(
                                    () => ElevatedButton(
                                      onPressed: controller.isRegistered.value
                                          ? null
                                          : () {
                                              controller.isRegistered.value = true;
                                            },
                                      child: Text(
                                        controller.isRegistered.value ? 'Registered' : 'Register',
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
