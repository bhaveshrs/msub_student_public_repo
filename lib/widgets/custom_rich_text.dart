import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:msub/common/utils/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  String? thirdText;
  String? forthText;
  Color? firstTextColor;
  Color? secondTextColor;
  double? textSize;
  bool isUnderline;
  Function()? callBack;
  Function()? callBack2;

  CustomRichText(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.firstTextColor,
      this.secondTextColor,
      this.thirdText,
      this.forthText,
      this.textSize,
      this.isUnderline = true,
      this.callBack,
      this.callBack2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
              text: firstText,
              style: TextStyle(
                  color: firstTextColor ?? AppColors.textPrimary,
                  fontSize: textSize ?? 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Muli'),
              children: <TextSpan>[
            TextSpan(
                text: secondText,
                style: TextStyle(
                    color: secondTextColor ?? AppColors.primary,
                    fontSize: textSize ?? 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Koho',
                    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none),
                recognizer: TapGestureRecognizer()..onTap = callBack),
            TextSpan(
              text: thirdText,
              style: TextStyle(
                  color: firstTextColor ?? AppColors.textPrimary,
                  fontSize: textSize ?? 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Muli'),
            ),
            TextSpan(
                text: forthText,
                style: TextStyle(
                    color: secondTextColor ?? AppColors.primary,
                    fontSize: textSize ?? 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'KoHo',
                    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none),
                recognizer: TapGestureRecognizer()..onTap = callBack2),
            //
          ])),
    );
  }
}
