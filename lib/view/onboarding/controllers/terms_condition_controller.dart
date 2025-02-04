

import 'package:get/get.dart';

class TermsController extends GetxController {
  // RxBool variables for checkbox states
  var isChecked = false.obs;
  var isAgreed = false.obs;

  // Toggle checkbox states
  void toggleChecked() => isChecked.value = !isChecked.value;

  void toggleAgreed() => isAgreed.value = !isAgreed.value;
}
