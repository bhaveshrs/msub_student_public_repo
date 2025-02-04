import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.splashImg,
              fit: BoxFit.cover,
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     Assets.splashImg,
          //     width: 300,
          //   ),
          // ),
          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                controller.navigateScreen();
                // Get.offAll(() => OnboardingCarouselView(), transition: Transition.fadeIn);
              },
              child: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(25),
                    right: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blueText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
