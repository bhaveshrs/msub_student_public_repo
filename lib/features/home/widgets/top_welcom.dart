import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class Welcome extends StatelessWidget {
  final double searchBoxTopPosition;
  final double searchBoxLeftRightPosition;
  final bool isEditable;
  final Function? onTap;
  final double containerHeight;
  final Animation<Offset> secondColumnAnimation;
  final Animation<double> stretchAnimation;
  const Welcome(
      {super.key,
      required this.searchBoxTopPosition,
      required this.secondColumnAnimation,
      required this.stretchAnimation,
      required this.containerHeight,
      this.onTap,
      required this.isEditable,
      required this.searchBoxLeftRightPosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500), // Animation speed
                curve: Curves.easeInOut, // Animation curve
                height: containerHeight,
                // height: 170,
                decoration: const BoxDecoration(
                  color: MyAppColors.blue3,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Stack(
                  children: [
                    // Circle 1 (Largest Circle)
                    Positioned(
                      top: -89,
                      left: -136,
                      child: Container(
                        width: 335,
                        height: 335,
                        decoration: const BoxDecoration(
                          color: MyAppColors.blue2,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Circle 2 (Smaller Circle)
                    Positioned(
                      top: -28,
                      left: -117,
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: const BoxDecoration(
                          color: MyAppColors.blue1,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: secondColumnAnimation,
                      child: AnimatedBuilder(
                        animation: stretchAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scaleX: stretchAnimation.value,
                            scaleY: 1.0, // No vertical stretching
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context.pushNamed(
                                                AppRouteNames.profile);
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                                AppImages.userReplacement,
                                                fit: BoxFit.cover,
                                                width: 47,
                                                height: 47),
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        AppText(
                                          text: "Good Morning , Abhay",
                                          style: AppTextStyles.rob20Semi(
                                              color: Colors.white),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            context.pushNamed(AppRouteNames
                                                .notificationRoute);
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.notification_add,
                                              color: MyAppColors.blue3,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            )
          ],
        ),
        // Positioned(
        //   top: 150,
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut, // Smooth transition
          top: searchBoxTopPosition,
          left: searchBoxLeftRightPosition,
          right: searchBoxLeftRightPosition,
          child: Stack(
            children: [
              CustomTextInput(
                // onTap: () {
                //   onTap?.call();
                // },
                enable: isEditable,
                radius: 36, contentPadValue: 15, maxLines: 1,
                prefixIcon: const Icon(Icons.search),
                // SvgPicture.asset(
                //   AppImages.search,
                // ),
                hintText: "Search",
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
              ),
              if (!isEditable)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print("on tapmcalled");
                      onTap?.call();
                    },
                    child: AbsorbPointer(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
