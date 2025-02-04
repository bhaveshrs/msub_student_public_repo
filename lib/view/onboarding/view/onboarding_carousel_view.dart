import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/onboarding/view/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_carousel_controller.dart';
class OnboardingCarouselView extends StatelessWidget {
  OnboardingCarouselView({super.key});

  final OnboardingCarouselController controller = Get.put(OnboardingCarouselController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.backgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // PageView Section
              Expanded(
                child: PageView(
                  controller: controller.controller,
                  children: [
                    Page(
                      subtitle:
                      'Receive real-time updates on essential campus announcements, deadlines, and events, all in one convenient place.',
                      title1: 'Important',
                      title2: 'Notices',
                      imagePath: Assets.introImg3,
                    ),
                    Page(
                      subtitle:
                      'Discover and join university events. Stay engaged with extracurriculars, seminars, and activities, all in one app.',
                      title1: 'Campus Events &',
                      title2: 'Activities',
                      imagePath: Assets.introImg4,
                    ),
                    Page(
                      subtitle: 'Find support and access essential resources whenever you need them, right within the app.',
                      title1: 'Support &',
                      title2: 'Resources',
                      imagePath: Assets.introImg5,
                    ),
                  ],
                ),
              ),

              // Page Indicator
              SizedBox(height: screenHeight * 0.02),
              SmoothPageIndicator(
                controller: controller.controller,
                count: 3,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 12,
                    height: 12,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  dotDecoration: DotDecoration(
                    width: 8,
                    height: 8,
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  spacing: 8.0,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAll(() => LoginView()), // Skip Action
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.pageNumber.value = controller.controller.page!.toInt();
                        if (controller.controller.page == 2) {
                          Get.offAll(() => LoginView());
                          return;
                        }
                        controller.controller.nextPage(
                            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Obx(
                              () => Text(
                            controller.pageNumber.value == 2 ? "Done" : "Next",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.blueText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title1;
  final String title2;
  final String subtitle;
  final String imagePath;

  const Page({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.1),

        // Image Section
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.05),

        // Titles and Subtitle
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titles
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      title2,
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


