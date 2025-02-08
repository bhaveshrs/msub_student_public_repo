import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/widgets/size_space.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.blue3,
      body: BackgroundScreen(
          firstCircleAngle: CircleAngle(x: -128, y: -90),
          secondCircleAngle: CircleAngle(x: -247, y: -245),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.welcome),
                const AppText(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.white,
                  text: "FACULTY OF COMMERCE",
                  fontFamily: "KoHo",
                ),
                // Spacer(),
              ],
            ),
          )),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        decoration: const BoxDecoration(
          color: MyAppColors.white2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Height(height: 50),
            const AppText(
              text: "Hello!",
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: MyAppColors.black,
            ),
            const Height(height: 10),
            const AppText(
              text:
                  "Log in to access your courses, timetable, and academic resources, or create a new account.",
              textAlign: TextAlign.center,
              fontFamily: "KoHo",
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const Height(height: 40),
            AppButton(
              onPress: () {
                context.pushNamed(AppRouteNames.signinRoute);
                // Get.to(() => SignInView());
              },
              buttonName: "Sign In",
            ),
            const Height(height: 30),
            AppButton(
              buttonColor: Colors.white,
              textStyle: AppTextStyles.pop14Semi(color: MyAppColors.blue3),
              onPress: () {
                // Get.to(SignUpView());
              },
              buttonName: "Sign Up",
              // fontSize: 20,
              // fontWeight: FontWeight.w600,
              // bgColor: AppColors.white,
              // borderColor: AppColors.white2,
              // color: AppColors.primary,
              // borderRadius: BorderRadius.circular(20),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        )),

        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     const AppText(
        //       text: "Welcome, Educator!",
        //       fontFamily: "KoHo",
        //       fontSize: 26,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     const SizedBox(
        //       height: 5,
        //     ),
        //     const AppText(
        //       text: "Log in to manage your classes and students.",
        //       textAlign: TextAlign.center,
        //       fontFamily: "KoHo",
        //       fontSize: 15,
        //       fontWeight: FontWeight.w400,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 40.0),
        //       child: AppButton(
        //           buttonName: "next",
        //           onPress: () {
        //             context.go(AppRouteNames.signinRoute);
        //             // context.go(AppRouteNames.dashboardRoute);
        //           }),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
