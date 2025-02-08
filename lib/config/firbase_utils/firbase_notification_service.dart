// import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationService {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// when app is open and got notification
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // handle interaction when app is active for android
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("notifications title:${notification!.title}");
        print("notifications body:${notification.body}");
        print('count:${android!.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
// Request notification permissions

    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // AppSettings.openAppSettings();
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      // message.notification!.android!.channelId.toString(),
      importance: Importance.max,
      showBadge: true,
      playSound: true,
    );
    final Directory tempDir = await getTemporaryDirectory();

    final File file = File('${tempDir.path}/notification_icon.png');

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      color: MyAppColors.blue3,
      importance: Importance.max,
      priority: Priority.high,
      showProgress: true,
      playSound: true,
      ticker: 'ticker',
      sound: channel.sound,
      channelDescription: 'media channel description',
      largeIcon: FilePathAndroidBitmap(file.path),
      styleInformation: const MediaStyleInformation(),
    );
    // AndroidNotificationDetails(
    //     channel.id.toString(), channel.name.toString(),
    //     channelDescription: 'your channel description',
    //     importance: Importance.high,
    //     priority: Priority.high,
    //     playSound: true,
    //     enableVibration: true,
    //     ticker: 'ticker',
    //     sound: channel.sound);

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  //function to get device token on which we will send the notifications
  Future<String?> getToken() async {
    // String? userId = _auth.currentUser?.uid;
    var aboutDevice = await deviceInfoPlugin.androidInfo;
    String? token = await _fcm.getToken();

    try {} catch (e) {
      print('i am --->>>>$e');
    }

    return token;
  }

  void isTokenRefresh() async {
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;

    if (!(await File('$tempPath/notification_icon.png').exists())) {
      final ByteData bytes =
          await rootBundle.load('assets/images/notification_icon.png');
      final Uint8List list = bytes.buffer.asUint8List();

      final File file = File('$tempPath/notification_icon.png');
      await file.writeAsBytes(list);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedToken = prefs.getString('fcm_token');

    if (storedToken == null || storedToken.isEmpty) {
      String? newToken = await _fcm.getToken();
      if (newToken != null) {
        await prefs.setString('fcm_token', newToken);
      }
      // await updateUserToken(userId: userId, newToken: newToken);
    }
    _fcm.onTokenRefresh.listen((newToken) async {
      newToken.toString();
      // await updateUserToken(userId: userId, newToken: newToken);
      await prefs.setString('fcm_token', newToken);
    });
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    final routeName = message.data['route_name'];
    if (routeName != null && routeName == "Announcement") {
      context.go(AppRouteNames.moreAnnouncementRoute,
          extra: {'isFormNotification': true});
    } else {
      context.go(AppRouteNames.notificationRoute,
          extra: {'isFormNotification': true});
    }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
