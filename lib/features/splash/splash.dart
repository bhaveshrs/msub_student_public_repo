import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/storage_service.dart';
import 'package:msub/config/router/route_names.dart';

// import 'package:teachers_app/config/router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    final startTime = DateTime.now();

    String? token = await StorageService().getSessionToken();
    print(token);

    final elapsed = DateTime.now().difference(startTime).inMilliseconds;
    final remainingTime =
        2000 - elapsed; // Minimum splash screen time: 2000ms (2 seconds)

    if (remainingTime > 0) {
      await Future.delayed(Duration(milliseconds: remainingTime));
    }
    context.go(AppRouteNames.onboardingRoute);

    // if (token == null || token.isEmpty) {
    //   context.go(AppRouteNames.onboardingRoute);
    // } else {
    //   context.go(AppRouteNames.dashboardRoute);
    // }
    // String? token = await StorageService().getSessionToken();
    // print(token);
    // if (token == null || token.isEmpty) {
    //   context.go(AppRouteNames.signinRoute);
    // } else {
    //   context.go(AppRouteNames.dashboardRoute);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.0),
                    child: Image(image: AssetImage(AppImages.fullSplashImg)),
                  ),
                  SizedBox(
                    height: 100,
                  )
                  // const AppText(
                  //   text: "Faculty of Commerce",
                  //   fontSize: 33,
                  //   fontFamily: "KoHo",
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.white,
                  // )
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 30,
          //   right: 30,
          //   child: SafeArea(
          //     child: GestureDetector(
          //       onTap: () {
          //         context.go(AppRouteNames.onboardingRoute);
          //         // context.go(AppRouteNames.signinRoute);
          //         // Get.offAll(() => OnboardingCarouselView(), transition: Transition.fadeIn);
          //       },
          //       child: Container(
          //         width: 70,
          //         height: 40,
          //         decoration: BoxDecoration(
          //           color: AppColors.white,
          //           borderRadius: const BorderRadius.horizontal(
          //             left: Radius.circular(25),
          //             right: Radius.circular(25),
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.2),
          //               blurRadius: 10,
          //               offset: const Offset(0, 5),
          //             ),
          //           ],
          //         ),
          //         alignment: Alignment.center,
          //         child: const Text(
          //           'Next',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: AppColors.blue3,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
