import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle rob20Semi({
    Color? color,
  }) {
    //Sign In
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle rob16Medium({
    Color? color,
  }) {
    //Sign In
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color,
    );
  }

  static TextStyle rob12Medium({
    Color? color,
  }) {
    //Sign In
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: color,
    );
  }

  // static TextStyle subtitle({Color? color}) {
  //   return TextStyle(
  //     fontWeight: FontWeight.w400,
  //     fontSize: 12,
  //     color: color,
  //   );
  // }

  static TextStyle smallSubtitle({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: color,
    );
  }

  static TextStyle whiteTitle({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: color,
      fontFamily: "KoHo",
    );
  }

  static TextStyle pop15Reg({Color? color}) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop14Semi({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop18Semi({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop12Semi({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop11ExLite({Color? color, FontStyle? fontSty}) {
    return TextStyle(
      fontStyle: fontSty,
      fontSize: 11,
      fontWeight: FontWeight.w200,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop14ExLite({Color? color, FontStyle? fontSty}) {
    return TextStyle(
      fontStyle: fontSty,
      fontSize: 14,
      fontWeight: FontWeight.w200,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop12ExLite({Color? color, FontStyle? fontSty}) {
    return TextStyle(
      fontStyle: fontSty,
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop14Reg({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop12Reg({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop10Reg({Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop12Mid({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle pop18Mid({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: "Poppins",
    );
  }

  // static TextStyle linkText({Color? color}) {
  //   return TextStyle(
  //     fontSize: 12,
  //     fontWeight: FontWeight.w400,
  //     color: color,
  //     fontFamily: "Poppins",
  //     decoration: TextDecoration.underline,
  //   );
  // }

  static TextStyle errorText({Color? color}) {
    return TextStyle(
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
