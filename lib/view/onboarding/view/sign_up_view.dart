import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';
import '../controllers/sign_up_controller.dart';
import 'sign_up_verify_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with logo and title
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.backgroundImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Height(height: Get.height * .04),
                  Image.asset(
                    Assets.logo,
                    width: 350,
                  ),
                ],
              ),
            ),
          ),
          // Foreground with buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .58,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Height(height: 30),
                    const CustomText(
                      "Sign Up",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Enter your University Registration Number to set up your account.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.inActive,
                    ),
                    const Height(height: 40),
                    CustomTextInput(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.isUserIdEmpty.value = true;
                        } else {
                          controller.isUserIdEmpty.value = false;
                        }
                      },
                      controller: controller.pRNController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter PRN",
                      prefixIcon: Image.asset(
                        Assets.userIcon,
                        height: 40,
                        width: 40,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      successMessage: "",
                      errorMessage: "Please enter a valid PRN.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 10),
                    const Height(height: 50),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          controller.onPRNClick();
                          // Get.to(() => SignUpView2());
                        },
                        title: "Verify My Account",
                        fontSize: 20,
                        bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpView2 extends StatelessWidget {
  SignUpView2({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.backgroundImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Height(height: Get.height * .04),
                  Image.asset(
                    Assets.logo,
                    width: 350,
                  ),
                ],
              ),
            ),
          ),
          // Foreground with buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .58,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Height(height: 30),
                    const CustomText(
                      "Sign Up",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Enter your University Registration Number to set up your account.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.inActive,
                    ),
                    const Height(height: 40),
                    CustomTextInput(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.isUserIdEmpty.value = true;
                        } else {
                          controller.isUserIdEmpty.value = false;
                        }
                      },
                      controller: controller.pRNController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter PRN",
                      prefixIcon: Image.asset(
                        Assets.userIcon,
                        height: 40,
                        width: 40,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null; // Return null if all conditions are met
                      },
                      // successMessage: "Valid PRN",
                      errorMessage: "Please enter a valid PRN.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        "Student Name",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                        color: AppColors.inActive,

                      ),
                    ),
                    const Height(height: 10),
                    CustomTextInput(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.isUserIdEmpty.value = true;
                        } else {
                          controller.isUserIdEmpty.value = false;
                        }
                      },
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter Name",
                      enable: false,
                      // prefixIcon: Image.asset(
                      //   Assets.userIcon,
                      //   height: 40,
                      //   width: 40,
                      // ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name cannot be empty";
                        }
                        return null;
                      },
                      successMessage: "",
                      errorMessage: "Please enter a name.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 50),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          Get.to(() => SignUpVerifyView(), arguments: [controller.pRNController.text]);
                          // controller.updateUserName();
                        },
                        title: "Next",
                        fontSize: 20,
                        bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
