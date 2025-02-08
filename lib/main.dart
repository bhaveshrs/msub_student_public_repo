import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:msub/app.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/config/firbase_utils/firebase_options.dart';
import 'package:msub/view/onboarding/view/splash_view.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final String? msgTitle = message.notification!.title;
  final String? msgBody = message.notification!.body;
  if (msgTitle != null && msgBody != null) {
    print("Handling a background message: ${message.messageId}");
    print("onBackgroundMessage $message");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}



Future<void> main2() async {
  runApp(const msub());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const msub());
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // await Firebase.initializeApp();

//   print(message);
//   final String? msgTitle = message.notification!.title;
//   final String? msgBody = message.notification!.body;
//   if (msgTitle != null && msgBody != null) {
//     print("Handling a background message: ${message.messageId}");
//     print("onBackgroundMessage $message");
//   }
// }

class msub extends StatelessWidget {
  const msub({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor primary = const MaterialColor(0xff1D5257, {
      50: AppColors.primary,
      100: AppColors.primary,
      200: AppColors.primary,
      300: AppColors.primary,
      400: AppColors.primary,
      500: AppColors.primary,
      600: AppColors.primary,
      700: AppColors.primary,
      800: AppColors.primary,
      900: AppColors.primary
    });
    return GetMaterialApp(
        title: 'MSUB',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                  systemNavigationBarColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.black,
              ),
          primarySwatch: primary,
          scaffoldBackgroundColor: const Color(0xffffffff),
          fontFamily: "KoHo",
        ).copyWith(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: AppColors.primary)),
        home: SplashView());
  }
}
