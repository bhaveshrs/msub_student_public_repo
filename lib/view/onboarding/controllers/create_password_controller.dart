import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:msub/common/services/cache_service.dart';

import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/complete_profile_view.dart';

class CreatePasswordController extends GetxController {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var isUserIdEmpty = false.obs;
  var isVerify = false.obs;
  var isPassword = false.obs;
  var prnNumber = "";
  var email = "";

  @override
  void onInit() async {
    prnNumber = Get.arguments[0];
    email = Get.arguments[1];
    super.onInit();
  }

  Future<void> createPassword() async {
    var body = {
      "prn_employee_id": prnNumber,
      "email": email,
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
      Get.to(() => CompleteProfileView());
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
