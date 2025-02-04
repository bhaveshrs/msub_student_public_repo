import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/services/rest_service.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/status_messages.dart';
import '../view/complete_profile_view.dart';

class NewPasswordController extends GetxController {
  var setPasswordController = TextEditingController();
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

  Future<void> resetNewPassword() async {
    var body = {"email": email,
      "prn_employee_id":prnNumber ,
      "password": setPasswordController.text};
    var response = await RestHelper.postRequest(
      Constants.forgetPasswordReset,
      body,
      Get.overlayContext!,
    );
    if (response["status"] == "success") {
      // await CacheService.writeCache(key: Constants.token, value: response["token"]);
      Get.to(() => CompleteProfileView());
      showSuccessMessage(response["message"]);
    } else {
      showErrorMessage(response["message"]);
    }
  }
}
