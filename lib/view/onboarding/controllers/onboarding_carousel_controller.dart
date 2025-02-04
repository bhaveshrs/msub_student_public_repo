import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingCarouselController extends GetxController {
  late PageController controller = PageController();
  RxInt pageNumber = 0.obs;
  var selectedLanguage = 'EN'.obs;

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.onInit();
    controller.addListener(updatePageNumber);
  }

  void updatePageNumber() {
    pageNumber.value = controller.page?.toInt() ?? 0;
  }

  @override
  void dispose() {
    controller.removeListener(updatePageNumber);
    super.dispose();
  }
}
