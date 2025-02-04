import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/constants.dart';

import '../../../common/services/cache_service.dart';
import '../../dashboard/dashboard_view.dart';
import '../view/onboarding_carousel_view.dart';

class SplashController extends GetxController {
  var token = "";

  @override
  void onInit() async {
    token = await CacheService.readCache(key: Constants.token);
    log("token >>> $token");

    super.onInit();
  }
  void navigateScreen(){
    // Future.delayed(const Duration(seconds: 300), () async {
      if (token == "") {
        Get.offAll(() => OnboardingCarouselView());
      } else {
        Get.offAll(() => DashboardView());
      }
    // });
  }
}
