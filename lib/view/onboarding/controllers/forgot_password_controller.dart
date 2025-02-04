import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/services/cache_service.dart';
import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/forget_new_password_view.dart';

class ForgotPasswordController extends GetxController {
  var userIdController = TextEditingController();
  var otpController = TextEditingController();
  var emailController = TextEditingController();
  var pnrController = TextEditingController();
  var isUserIdEmpty = false.obs;
  var isVerify = false.obs;
  var isPassword = false.obs;
  late Timer timer;
  RxInt emailTimer = 75.obs;
  var isEmailResendOtp = false.obs;
  var isEmailVerified = false.obs;
  var emailOtpController = TextEditingController();

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
      // otpAdminApi();
    }
  }

  bool validate() {
    if (userIdController.text.isEmpty) {
      showErrorMessage("Please enter email");
      return false;
    } else if (emailController.text.isEmpty) {
      showErrorMessage("Please enter password");
      return false;
    }
    return true;
  }

  Future<void> forgetPasswordEmailOtp() async {
    var body = {"email": emailController.text, "prn_employee_id": pnrController.text};
    var response = await RestHelper.postRequest(
      Constants.forgetPassword,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      startEmailTimer();
      //Get.to(() => SignInVerifyVi());

      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> verifyEmailOtp() async {
    var body = {
      "prn_employee_id": pnrController.text,
      "email": emailController.text,
      "otp": emailOtpController.text.replaceAll('-', '') ?? '',
    };
    var response = await RestHelper.postRequest(
      Constants.emailVerifyOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      Get.to(() => NewPasswordView(), arguments: [
        pnrController.text,
        emailController.text,
      ]);
      // isEmailVerified.value = true;
      // startEmailTimer();
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
