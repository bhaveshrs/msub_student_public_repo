import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;
  const AppText(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontFamily,
      this.fontWeight,
      this.overflow,
      this.maxLines,
      this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            
            fontSize: fontSize,
            color: color,
            fontFamily: fontFamily ?? "Roboto",
            fontWeight: fontWeight,
            overflow: overflow,
          ),
    );
  }
}
