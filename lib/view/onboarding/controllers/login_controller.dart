import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/dashboard_view.dart';
import '../../../common/services/cache_service.dart';
import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/login_view.dart';

class LoginController extends GetxController {
  var userIdController = TextEditingController();
  var otpController = TextEditingController();
  var passwordController = TextEditingController();
  var isUserIdEmpty = false.obs;
  var isVerify = false.obs;
  var isPassword = false.obs;
  late Timer timer;
  RxInt emailTimer = 75.obs;
  var isEmailResendOtp = false.obs;
  var userIdError = ''.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void startEmailTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (emailTimer.value == 0) {
          timer.cancel();
          isEmailResendOtp.value = true;
        } else {
          emailTimer.value--;
        }
      },
    );
  }

  void resetEmailTimer() {
    timer.cancel();
    isEmailResendOtp.value = false;
    emailTimer.value = 59;
    //startMobileTimer();
  }

  String get formattedEmailTimer {
    final minutes = (emailTimer.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (emailTimer.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void onLoginClick() {
    if (validate()) {
      //otpAdminApi();
    }
  }

  bool validate() {
    if (userIdController.text.isEmpty) {
      showErrorMessage("Please enter email");
      return false;
    } else if (passwordController.text.isEmpty) {
      showErrorMessage("Please enter password");
      return false;
    }
    return true;
  }

  Future<void> getUserIdLoginOtp() async {
    var body = {
      "email": userIdController.text,
    };
    var response = await RestHelper.postRequest(
      Constants.loginEmailOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      startEmailTimer();
      Get.to(() => SignInVerifyView());

      showSuccessMessage(response["message"]);
    } else {
      userIdError.value = response["message"];
    }
  }

  Future<void> emailVerify() async {
    var body = {
      "email": userIdController.text,
      "otp": otpController.text.replaceAll('-', '') ?? '',
    };
    var response = await RestHelper.postRequest(
      Constants.verifyLoginOTP,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> login() async {
    var body = {
      "email": userIdController.text,
      "password": passwordController.text,
      "device_id": "a123",
    };
    var response = await RestHelper.postRequest(
      Constants.userLogin,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      await CacheService.writeCache(key: Constants.token, value: response['data']["token"]);
      Get.offAll(() => DashboardView());

      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
