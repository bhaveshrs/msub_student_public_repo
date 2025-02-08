import 'package:flutter/material.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final BoxShape shape;

  const ShimmerBox(
      {super.key,
      required this.height,
      required this.width,
      this.borderRadius,
      this.baseColor,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: baseColor ?? Colors.grey.withOpacity(0.5) ,
      highlightColor: MyAppColors.inActiveText.withOpacity(0.2),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
          //  borderRadius ?? BorderRadius.zero,
        ),
      ),
    );
  }
}
