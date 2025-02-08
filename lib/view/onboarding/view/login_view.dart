import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/onboarding/controllers/login_controller.dart';
import 'package:msub/view/onboarding/view/forgot_password_view.dart';
import 'package:msub/view/onboarding/view/sign_up_view.dart';
import 'package:msub/widgets/custom_button.dart';
import 'package:msub/widgets/custom_input_text.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());

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
              child:
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Height(height: Get.height * .10),
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
              height: Get.height * .50,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child:
               SingleChildScrollView(
                child: 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Height(height: 50),
                    const CustomText(
                      "Hello!",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Log in to access your courses, timetable, and academic resources, or create a new account.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    const Height(height: 40),
                    CustomButton(
                      onPressed: () {
                        Get.to(() => SignInView());
                      },
                      title: "Sign In",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    const Height(height: 30),
                    CustomButton(
                      onPressed: () {
                        Get.to(SignUpView());
                      },
                      title: "Sign Up",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      bgColor: AppColors.white,
                      borderColor: AppColors.white2,
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
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

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final LoginController controller = Get.put(LoginController());

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Height(height: 30),
                    const CustomText(
                      "Sign In",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextInput(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.userIdError.value = ''; // Clear the error on input change
                            }
                          },
                          controller: controller.userIdController,
                          keyboardType: TextInputType.text,
                          hintText: "Enter User Id",
                          prefixIcon: Image.asset(
                            Assets.userIcon,
                            height: 40,
                            width: 40,
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Invalid User Id";
                            }
                            return null;
                          },
                          successMessage: "OTP sent to the registered email.",
                          errorMessage: "Invalid User Id.",
                          validateOnInputChange: false,
                        ),
                        Obx(() {
                          return controller.userIdError.value.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    controller.userIdError.value,
                                    style: const TextStyle(color: Colors.red, fontSize: 12),
                                  ),
                                )
                              : const SizedBox.shrink();
                        }),
                      ],
                    ),
                    const Height(height: 40),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          controller.getUserIdLoginOtp();
                        },
                        title: "Get OTP",
                        fontSize: 20,
                        bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const Height(height: 50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 3,
                            color: AppColors.inActive,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomText(
                            "or",
                            textAlign: TextAlign.center,
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 3,
                            color: AppColors.inActive,
                          ),
                        ),
                      ],
                    ),
                    const Height(height: 30),
                    Image.asset(
                      Assets.biometricIcon,
                      height: 80,
                      width: 80,
                    ),
                    const CustomText(
                      "Use Biometric",
                      textAlign: TextAlign.center,
                      fontSize: 20,
                      color: AppColors.black,
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

class SignInVerifyView extends StatelessWidget {
  SignInVerifyView({super.key});

  final LoginController controller = Get.put(LoginController());

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
                      "Sign In",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Enter your User ID to sign in to your account.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.inActive,
                    ),
                    const Height(height: 40),
                    const Row(
                      children: [
                        CustomText(
                          "Enter User Id",
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
                      controller: controller.userIdController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter User Id",
                      prefixIcon: Image.asset(
                        Assets.userIcon,
                        height: 40,
                        width: 40,
                      ),
                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                      successMessage: "OTP sent to the registered email.",
                      errorMessage: "Invalid email address.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              "Enter the OTP",
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              color: AppColors.inActive,
                            ),
                            Obx(
                              () => controller.isEmailResendOtp.value == false
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.timerIcon,
                                          height: 20,
                                          width: 20,
                                        ),
                                        const Width(width: 5),
                                        CustomText(
                                          controller.formattedEmailTimer,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.inActive,
                                        ),
                                      ],
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.getUserIdLoginOtp();
                                        controller.resetEmailTimer();
                                      },
                                      child: const CustomText(
                                        "Resend OTP",
                                        textAlign: TextAlign.start,
                                        fontSize: 14,
                                        color: AppColors.primary,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const Height(height: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextInput(
                            validationMessageAlignment: TextAlign.center,
                            textAlignment: TextAlign.center,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                String rawInput = value.replaceAll('-', '');

                                String formattedInput = rawInput
                                    .split('')
                                    .asMap()
                                    .entries
                                    .map((entry) => entry.key != rawInput.length - 1 ? '${entry.value}-' : entry.value)
                                    .join();

                                controller.otpController.text = formattedInput;

                                controller.otpController.selection = TextSelection.fromPosition(
                                  TextPosition(offset: formattedInput.length),
                                );

                                controller.isVerify.value = rawInput.length == 4;
                              } else {
                                controller.isVerify.value = false;
                              }
                            },
                            controller: controller.otpController,
                            keyboardType: TextInputType.number,
                            hintText: "4-5-5-0",
                            validator: (value) {
                              String rawValue = value?.replaceAll('-', '') ?? '';
                              if (rawValue.isEmpty) {
                                return "OTP cannot be empty";
                              } else if (rawValue.length < 4) {
                                return "OTP must be 4 characters long";
                              } else if (rawValue.length > 4) {
                                return "OTP cannot exceed 4 characters";
                              }
                              return null;
                            },
                            //successMessage: "OTP verified",
                            errorMessage: "Invalid OTP",
                            validateOnInputChange: true,
                            showValidationIcons: false,
                            maxLength: 7, // 4 digits + 3 hyphens
                          ),
                        ),
                        const Width(width: 20),
                        Obx(
                          () => Expanded(
                            child: CustomButton(
                              onPressed: () {
                                controller.emailVerify();
                              },
                              title: "Verify",
                              fontSize: 20,
                              bgColor: !controller.isVerify.value ? AppColors.inActive : AppColors.green,
                              borderColor: !controller.isVerify.value ? AppColors.inActive : AppColors.green,
                              fontWeight: FontWeight.w600,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Height(height: 20),
                    const Row(
                      children: [
                        CustomText(
                          "Enter Password",
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
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter password",
                      prefixIcon: Image.asset(Assets.passwordIcon, height: 40, width: 40),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          controller.isPassword.value = false;
                          return "Password must be at least 6 characters long";
                        }
                        controller.isPassword.value = true;
                        return null;
                      },
                      //    successMessage: "Password Verified",
                      errorMessage: "Invalid password",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 30),
                    Obx(
                      () => Visibility(
                        visible: !controller.isPassword.value,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPasswordView());
                          },
                          child: const CustomText(
                            "Forgot Password?",
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                    const Height(height: 40),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          controller.login();
                        },
                        title: "Sign In",
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
