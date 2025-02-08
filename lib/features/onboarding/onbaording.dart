import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/router/route_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": AppImages.onb_1,
      "title1": "Important",
      "title2": " Notices",
      "description":
          "Receive real-time updates on essential campus announcements, deadlines, and events, all in one convenient place."
    },
    {
      "image": AppImages.onb_2,
      "title1": "Campus Events &",
      "title2": " Activities",
      "description":
          "Discover and join university events. Stay engaged with extracurriculars, seminars, and activities, all in one app."
    },
    {
      "image": AppImages.onb_3,
      "title1": "Support &",
      "title2": " Resources",
      "description":
          "Find support and access essential resources whenever you need them, right within the app."
    },
  ];

  void _onSkip() {
    _pageController.jumpToPage(_onboardingData.length - 1);
  }

  void _onNext(BuildContext context) {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage >= _onboardingData.length - 1) {
      context.go(AppRouteNames.welcomeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        data["image"]!,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: data["title1"],
                                style: const TextStyle(
                                  fontFamily: "KoHo",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: data["title2"],
                                style: const TextStyle(
                                  fontFamily: "KoHo",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppText(
                          fontFamily: "KoHo",
                          text: data["description"]!,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 130,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _currentPage < _onboardingData.length - 1
                          ? _onSkip
                          : () {},
                      child: !(_currentPage < _onboardingData.length - 1)
                          ? const SizedBox()
                          : const AppText(
                              fontWeight: FontWeight.w600,
                              text: "Skip",
                              fontSize: 14,
                              color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => _onNext(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 10),
                        decoration: const BoxDecoration(
                            color: MyAppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: AppText(
                            fontWeight: FontWeight.w600,
                            text: _currentPage == _onboardingData.length - 1
                                ? "Done"
                                : "Next",
                            fontSize: 14,
                            color: MyAppColors.blue2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
