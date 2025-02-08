// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';


class BackgroundScreen extends StatelessWidget {
  final Widget child;
  final CircleAngle? firstCircleAngle;
  final CircleAngle? secondCircleAngle;
  const BackgroundScreen(
      {super.key,
      required this.child,
      this.firstCircleAngle,
      this.secondCircleAngle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyAppColors.blue3, // Background blue color
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: secondCircleAngle?.y ?? -158,
          left: secondCircleAngle?.x ?? -211,
          child: Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
              color: MyAppColors.blue2,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: firstCircleAngle?.y ?? -74,
          left: firstCircleAngle?.x ?? -82,
          child: Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              color: MyAppColors.blue1,
              shape: BoxShape.circle,
            ),
          ),
        ),
        child
      ],
    );
  }
}

class CircleAngle {
  double x;
  double y;
  CircleAngle({
    required this.x,
    required this.y,
  });
}
