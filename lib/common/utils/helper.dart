import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'app_colors.dart';

extension WidEx on Widget {
  Widget get beResponsive => ResponsiveWrapper.builder(
        this,
        defaultScale: true,
        defaultScaleFactor: 1.05,
        breakpoints: [
          const ResponsiveBreakpoint.resize(800, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      );
}

 Widget height({double? height}) {
   return SizedBox(
     height: height ?? 10,
   );
 }

Widget divider({Color? color, double? size}) {
  return Divider(
    color: color ?? AppColors.grey,
    thickness: size ?? 2,
  );
}

Widget vertical20() {
  return const SizedBox(
    height: 20,
  );
}

Widget widht10({double? height}) {
  return SizedBox(
    width: height ?? 10,
  );
}

Widget horizontal20() {
  return const SizedBox(
    width: 20,
  );
}

String formatDuration(Duration duration) {
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String twoDigitMilliseconds(int n) {
    return (n ~/ 10).toString().padLeft(2, '0');
  }

  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  String milliseconds = twoDigitMilliseconds(duration.inMilliseconds.remainder(1000));

  return '$minutes:$seconds:$milliseconds';
}
