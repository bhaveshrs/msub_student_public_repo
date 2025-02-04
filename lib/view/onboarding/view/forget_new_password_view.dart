import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../common/utils/status_messages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';
import '../controllers/forget_new_password_controller.dart';

class NewPasswordView extends StatelessWidget {
  NewPasswordView({super.key});

  final NewPasswordController newPasswordController = Get.put(NewPasswordController());

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
                      "Create New Password",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      " Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis vitae sagittis nisl.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.inActive,
                    ),
                    const Height(height: 40),
                    const Row(
                      children: [
                        CustomText(
                          "Set Password",
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.inActive,
                        ),
                        SizedBox()
                      ],
                    ),
                    const Height(height: 10),
                    CustomTextInput(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          newPasswordController.isUserIdEmpty.value = true;
                        } else {
                          newPasswordController.isUserIdEmpty.value = false;
                        }
                      },
                      controller: newPasswordController.setPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: "Password",
                      prefixIcon: Image.asset(
                        Assets.passwordIcon,
                        height: 40,
                        width: 40,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return "Password must contain letters, numbers, and a special character.";
                        }
                        return null;
                      },
                   //   successMessage: "Password meets requirements",
                      errorMessage: "Must contain letters, numbers, special character, and minimum 8 characters",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 20),
                    const Row(
                      children: [
                        CustomText(
                          "Confirm Password",
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.inActive,
                        ),
                        SizedBox()
                      ],
                    ),
                    const Height(height: 10),
                    CustomTextInput(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          newPasswordController.isPassword.value = true;
                        } else {
                          newPasswordController.isPassword.value = false;
                        }
                      },
                      controller: newPasswordController.confirmPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: "Confirm Password",
                      prefixIcon: Image.asset(
                        Assets.passwordIcon,
                        height: 40,
                        width: 40,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          newPasswordController.isPassword.value = false;
                          return "Password must be at least 8 characters long";
                        } else if (value != newPasswordController.confirmPasswordController.text) {
                          return "Passwords do not match";
                        }
                        newPasswordController.isPassword.value = true;
                        return null;
                      },
                      successMessage: "Password Verified",
                      errorMessage: "Passwords do not match",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),

                    const Height(height: 60),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          if (newPasswordController.setPasswordController.text ==
                              newPasswordController.confirmPasswordController.text)
                          {
                            newPasswordController.resetNewPassword();
                          } else {
                            showErrorMessage("Password not match");
                          }
                          // Get.to(()=>CompleteProfileView());
                        },
                        title: "Next",
                        fontSize: 20,
                        bgColor: !newPasswordController.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        borderColor: !newPasswordController.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
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
