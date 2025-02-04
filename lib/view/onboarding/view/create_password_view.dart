import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../common/utils/status_messages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';
import '../controllers/create_password_controller.dart';

class CreatePasswordView extends StatelessWidget {
  CreatePasswordView({super.key});

  final CreatePasswordController controller = Get.put(CreatePasswordController());

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
                      "Create Password",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Set a strong password to secure your account.",
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
                          controller.isUserIdEmpty.value = true;
                        } else {
                          controller.isUserIdEmpty.value = false;
                        }
                      },
                      controller: controller.passwordController,
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
                        return null; // Return null if all conditions are met
                      },
                    //  successMessage: "Password meets requirements",
                      errorMessage: "Must contain letters, numbers, special character, and minimum 8 characters",
                      validateOnInputChange: true,
                    //  showValidationIcons: true,
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
                          controller.isPassword.value = true;
                        } else {
                          controller.isPassword.value = false;
                        }
                      },
                      controller: controller.confirmPasswordController,
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
                          controller.isPassword.value = false;
                          return "Password must be at least 8 characters long";
                        } else if (value != controller.confirmPasswordController.text) {
                          // Check if Confirm Password matches Set Password
                          return "Passwords do not match";
                        }
                        controller.isPassword.value = true;
                        return null;
                      },
                     // successMessage: "Password Verified",
                      errorMessage: "Passwords do not match",
                      validateOnInputChange: true,
                     // showValidationIcons: true,
                    ),
                    const Height(height: 30),
                    const Height(height: 30),
                    Obx(
                          () => CustomButton(
                        onPressed: () {
                          if (controller.passwordController.text == controller.confirmPasswordController.text)
                          {
                            controller.createPassword();
                          } else {
                            showErrorMessage("Password not match");
                          }
                          // Get.to(()=>CompleteProfileView());
                        },
                        title: "Sign Up",
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
