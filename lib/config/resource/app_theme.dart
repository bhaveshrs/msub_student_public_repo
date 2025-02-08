import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msub/config/resource/app_colors.dart';

// class AppThemes {
//   static final kLightThemeData = ThemeData(
//     colorScheme: const ColorScheme.dark(
//         onPrimary: MyAppColors.white, // selected text color
//         onSurface: MyAppColors.white, // default text color
//         primary: MyAppColors.primaryColor // circle color
//         ),
//     dialogBackgroundColor: MyAppColors.backgroundColor,
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: MyAppColors.white,
//       ),
//     ),
//     primaryColor: MyAppColors.primaryColor,
//     secondaryHeaderColor: MyAppColors.secondary,
//     fontFamily: 'nunito',
//     primarySwatch: MyAppColors.deepOrange,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: MyAppColors.k2c2c2e,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarBrightness:
//             Brightness.dark, //<-- For iOS SEE HERE (dark icons)
//       ),
//     ),
//     scaffoldBackgroundColor: MyAppColors.k181818,
//   );
// }
class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: MyAppColors.blue3,
      onPrimary: MyAppColors.white,
      secondary: MyAppColors.blue2,
      onSurface: MyAppColors.black,
    ),
    primaryColor: MyAppColors.blue3,
    scaffoldBackgroundColor: MyAppColors.backgroundColor,
    fontFamily: 'Nunito', // Set default font family
    appBarTheme: const AppBarTheme(
      backgroundColor: MyAppColors.blue3,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, // Dark icons for iOS
          statusBarColor: Colors.transparent),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyAppColors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: MyAppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: MyAppColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: MyAppColors.blue3,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: MyAppColors.black,
      ),
    ),
  );
}
