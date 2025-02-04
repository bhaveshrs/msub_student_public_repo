import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/sign_up_verify_view.dart';
import '../view/sign_up_view.dart';

class SignUpController extends GetxController {
  var pRNController = TextEditingController();
  var dobController = TextEditingController();
  var mobileController = TextEditingController();
  var gmailController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var isUserIdEmpty = false.obs;
  var isVerify = false.obs;
  var isPassword = false.obs;
  String? selectedProgram;

  @override
  void onInit() async {
    super.onInit();
  }

  void onPRNClick() {
    if (validate()) {
      getUserApi();
    }
  }

  bool validate() {
    if (pRNController.text.isEmpty) {
      showErrorMessage("Please enter PRN ");
      return false;
    }
    return true;
  }

  Future<void> getUserApi() async {
    var body = {
      "prn_employee_id": pRNController.text,
    };
    var response = await RestHelper.postRequest(
      Constants.getUser,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      Get.to(() => SignUpView2());
      nameController.text = "${response["data"]["name"]}";
      log("${response["data"]["name"]}");
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }

  Future<void> updateUserName() async {
    var body = {
      "prn_employee_id": pRNController.text,
      "name": nameController.text,
      //"": "sharma",
    };
    var response = await RestHelper.postRequest(
      Constants.updateUserName,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      Get.to(() => SignUpVerifyView(), arguments: [pRNController.text]);

      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
