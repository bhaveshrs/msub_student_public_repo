import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:msub/view/onboarding/view/terms_conditions_view.dart';
import '../../../common/services/cache_service.dart';
import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/complete_profile_view.dart';

class SignUpVerifyController extends GetxController {
  RxInt currentStep = 1.obs;
  RxInt currentPhase = 1.obs;

  void nextPhaseOrStep() {
    if (currentPhase.value == 1) {
      currentPhase.value = 2;
    } else if (currentStep.value < 3) {
      currentStep.value += 1;
      currentPhase.value = 1;
    } else {
      // Last step completed
      // Get.snackbar("Success", "You have completed all steps!");
    }
  }

  void previousPhaseOrStep() {
    if (currentPhase.value == 2) {
      currentPhase.value = 1;
    } else if (currentStep.value > 1) {
      currentStep.value -= 1;
      currentPhase.value = 2;
    }
  }

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  // var isUserIdEmpty = false.obs;
  var isVerify = false.obs;

  // var isPassword = false.obs;

  var mobileNumberController = TextEditingController();
  var mobileOtpController = TextEditingController();
  var emailController = TextEditingController();
  var emailOtpController = TextEditingController();
  var nameController = TextEditingController();
  var isUserIdEmpty = false.obs;
  var isMobileEmail = false.obs;
  var isVerifyEmail = false.obs;
  var isPassword = false.obs;
  var isEmailVerified = false.obs;
  var prnNumber = "";

  RxInt mobileTimer = 75.obs;
  RxInt emailTimer = 75.obs;
  var isMobileResendOtp = false.obs;
  var isEmailResendOtp = false.obs;
  late Timer timer;

  @override
  void onInit() async {
    prnNumber = Get.arguments[0];
    super.onInit();
  }

  Future<void> createPassword() async {
    var body = {
      "prn_employee_id": prnNumber,
      "email": emailController.text,
      "password": passwordController.text,
      "device_id": 'qwe',
    };
    var response = await RestHelper.postRequest(
      Constants.setPassword,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      await CacheService.writeCache(key: Constants.token, value: response["token"]);
      Get.to(() => TermsAndConditionsView());
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  void startMobileTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mobileTimer.value == 0) {
          timer.cancel();
          isMobileResendOtp.value = true;
        } else {
          mobileTimer.value--;
        }
      },
    );
  }

  void resetMobileTimer() {
    timer.cancel();
    isMobileResendOtp.value = false;
    mobileTimer.value = 59;
    startMobileTimer();
  }

  String get formattedMobileTime {
    final minutes = (mobileTimer.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (mobileTimer.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
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
    startEmailTimer();
    sendEmailOtp();
  }

  String get formattedEmailTimer {
    final minutes = (emailTimer.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (emailTimer.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  Future<void> sendEmailOtp() async {
    var body = {
      "role_id": "1",
      "prn_employee_id": prnNumber,
      "email": emailController.text,
    };
    var response = await RestHelper.postRequest(
      Constants.sendEmailOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      startEmailTimer();
      nextPhaseOrStep();
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> verifyEmailOtp() async {
    var body = {
      "prn_employee_id": prnNumber,
      "email": emailController.text,
      "otp": emailOtpController.text.replaceAll('-', '') ?? '',
    };
    var response = await RestHelper.postRequest(
      Constants.verifyEmailOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      isEmailVerified.value = true;
      startEmailTimer();
      nextPhaseOrStep();
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> sendMobileOtp() async {
    var body = {
      "country_mobile_code": "+91",
      "mobile": mobileNumberController.text,
      "prn_employee_id": prnNumber,
    };
    var response = await RestHelper.postRequest(
      Constants.sendMobileOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      startEmailTimer();
      nextPhaseOrStep();
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> verifyMobileOtp() async {
    var body = {
      "prn_employee_id": prnNumber,
      "mobile": mobileNumberController.text,
      "country_mobile_code": "+91",
      "otp": mobileOtpController.text.replaceAll('-', '') ?? '',
    };
    var response = await RestHelper.postRequest(
      Constants.verifyMobileOtp,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      isEmailVerified.value = true;
      startEmailTimer();
      nextPhaseOrStep();
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
