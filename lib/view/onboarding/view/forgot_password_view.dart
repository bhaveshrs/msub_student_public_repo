import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/onboarding/controllers/forgot_password_controller.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

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
              height: Get.height * .57,
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
                    const Height(height: 20),
                    const CustomText(
                      "Forgot Password",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const Height(height: 10),
                    const CustomText(
                      "Please enter your PRN,register email ID and OTP to reset your password.",
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: AppColors.inActive,
                    ),
                    const Height(height: 40),
                    const Row(
                      children: [
                        CustomText(
                          "Enter PRN of Student",
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
                      controller: controller.pnrController,
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
                     // successMessage: "Vaild PRN",
                      errorMessage: "Please enter a valid PRN.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Row(
                      children: [
                        CustomText(
                          "Enter Email Address",
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
                      controller: controller.emailController,
                      keyboardType: TextInputType.text,
                      hintText: "example@gmail.com",
                      prefixIcon: Image.asset(
                        Assets.emailIcon,
                        height: 30,
                        width: 30,
                      ),
                      validator: (value) {
                        if (value == null || !value.contains("@")) {
                          return "Invalid email";
                        }
                        return null;
                      },
                  //    successMessage: "Email verified. OTP has been sent.",
                      errorMessage: "This email does not match our records.",
                      validateOnInputChange: true,
                      showValidationIcons: true,
                    ),
                    const Height(height: 10),
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
                                  controller.resetEmailTimer();
                                  controller.forgetPasswordEmailOtp();
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
                    const Height(height: 10),
                    CustomButton(
                      onPressed: () {
                        controller.forgetPasswordEmailOtp();
                      },
                      title: "Send OTP",
                      fontSize: 20,
                      bgColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    const Height(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        .map((entry) =>
                                            entry.key != rawInput.length - 1 ? '${entry.value}-' : entry.value)
                                        .join();

                                    controller.emailOtpController.text = formattedInput;

                                    controller.emailOtpController.selection = TextSelection.fromPosition(
                                      TextPosition(offset: formattedInput.length),
                                    );

                                    controller.isVerify.value = rawInput.length == 4;
                                  } else {
                                    controller.isVerify.value = false;
                                  }
                                },
                                controller: controller.emailOtpController,
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
                               // successMessage: "OTP verified",
                                errorMessage: "Invalid OTP",
                                validateOnInputChange: true,
                                showValidationIcons: false,
                                maxLength: 7, // 4 digits + 3 hyphens
                              ),
                            ),
                            const SizedBox(width: 20),
                            Obx(
                              () => Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    // if (controller.isVerify.value) {
                                    //   controller.verifyEmailOtp();
                                    //   controller.otpController.clear();
                                    // }
                                  },
                                  title: "Verified",
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

                      ],
                    ),
                    const Height(height: 40),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          if (controller.isVerify.value) {
                            controller.verifyEmailOtp();
                            controller.otpController.clear();
                          }

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
