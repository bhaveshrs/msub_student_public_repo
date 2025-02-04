import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/onboarding/view/terms_conditions_view.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../common/utils/status_messages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';
import '../controllers/sign_up_verify_controller.dart';
import 'complete_profile_view.dart';
import 'create_password_view.dart';

class SignUpVerifyView extends StatelessWidget {
  SignUpVerifyView({super.key});

  final SignUpVerifyController controller = Get.put(SignUpVerifyController());

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Positioned.fill(
    //         child: Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: AssetImage(Assets.backgroundImg),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Height(height: Get.height * .03),
    //               Image.asset(
    //                 Assets.logo,
    //                 width: 350,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       // Foreground with buttons
    //       Align(
    //         alignment: Alignment.bottomCenter,
    //         child: Container(
    //           height: Get.height * .58,
    //           width: double.infinity,
    //           padding: const EdgeInsets.all(16),
    //           decoration: const BoxDecoration(
    //             color: AppColors.white2,
    //             borderRadius: BorderRadius.vertical(
    //               top: Radius.circular(40),
    //             ),
    //           ),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 const Height(height: 30),
    //                 const CustomText(
    //                   "Verify",
    //                   fontSize: 28,
    //                   fontWeight: FontWeight.w700,
    //                   color: AppColors.black,
    //                 ),
    //                 const Height(height: 10),
    //                 const CustomText(
    //                   "Please verify your registered Mobile Number and Email.",
    //                   textAlign: TextAlign.center,
    //                   fontSize: 16,
    //                   color: AppColors.inActive,
    //                 ),
    //                 const Height(height: 40),
    //
    //
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const CustomText(
    //                       "Enter Mobile Number",
    //                       textAlign: TextAlign.start,
    //                       fontSize: 16,
    //                       color: AppColors.inActive,
    //                     ),
    //                     const Height(height: 10),
    //                     CustomTextInput(
    //                       onChanged: (value) {
    //                           if (controller.mobileNumberController.text.length == 10) {
    //                             controller.startMobileTimer();
    //                             // Show success message
    //                             controller.isUserIdEmpty.value = true;
    //                           } else {
    //                             controller.isUserIdEmpty.value = false;
    //                           }
    //                         // }
    //                       },
    //                       maxLength: 10,
    //                       controller: controller.mobileNumberController,
    //                       keyboardType: TextInputType.number,
    //                       hintText: "+91 XXXXXXXXXX",
    //
    //                       successMessage: "Mobile number verified. OTP has been sent.",
    //                       errorMessage: "Please enter a valid mobile number.",
    //                       validateOnInputChange: true,
    //                       showValidationIcons: true,
    //                     ),
    //                     const Height(height: 10),
    //
    //                     CustomButton(
    //                       onPressed: () {
    //                         controller.sendMobileOtp();
    //                       },
    //                       title: "Send OTP",
    //                       fontSize: 20,
    //                       bgColor: AppColors.primary,
    //                       borderColor: AppColors.primary,
    //                       fontWeight: FontWeight.w600,
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                     const Height(height: 10),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             const CustomText(
    //                               "Enter the OTP",
    //                               textAlign: TextAlign.start,
    //                               fontSize: 16,
    //                               color: AppColors.inActive,
    //                             ),
    //                             Obx(
    //                               () => controller.isMobileResendOtp.value == false
    //                                   ? Row(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       crossAxisAlignment: CrossAxisAlignment.center,
    //                                       children: [
    //                                         Image.asset(
    //                                           Assets.timerIcon,
    //                                           height: 20,
    //                                           width: 20,
    //                                         ),
    //                                         const Width(width: 5),
    //                                         CustomText(
    //                                           controller.formattedMobileTime,
    //                                           textAlign: TextAlign.start,
    //                                           fontSize: 16,
    //                                           color: AppColors.inActive,
    //                                         ),
    //                                       ],
    //                                     )
    //                                   : const CustomText(
    //                                       "Resend OTP",
    //                                       textAlign: TextAlign.start,
    //                                       fontSize: 14,
    //                                       color: AppColors.primary,
    //                                     ),
    //                             ),
    //                           ],
    //                         ),
    //                         const Height(height: 10),
    //                       ],
    //                     ),
    //                     const Height(height: 10),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Expanded(
    //                               child: CustomTextInput(
    //                                 validationMessageAlignment: TextAlign.center,
    //                                 textAlignment: TextAlign.center,
    //                                 onChanged: (value) {
    //                                   if (value.isNotEmpty) {
    //                                     String rawInput = value.replaceAll('-', '');
    //
    //                                     String formattedInput = rawInput
    //                                         .split('')
    //                                         .asMap()
    //                                         .entries
    //                                         .map((entry) => entry.key != rawInput.length - 1 ? '${entry.value}-' : entry.value)
    //                                         .join();
    //
    //                                     controller.mobileOtpController.text = formattedInput;
    //
    //                                     controller.mobileOtpController.selection = TextSelection.fromPosition(
    //                                       TextPosition(offset: formattedInput.length),
    //                                     );
    //
    //                                     controller.isMobileEmail.value = rawInput.length == 4;
    //                                   } else {
    //                                     controller.isMobileEmail.value = false;
    //                                   }
    //                                 },
    //                                 controller: controller.mobileOtpController,
    //                                 keyboardType: TextInputType.number,
    //                                 hintText: "4-5-5-0",
    //                                 validator: (value) {
    //                                   String rawValue = value?.replaceAll('-', '') ?? '';
    //                                   if (rawValue.isEmpty) {
    //                                     return "OTP cannot be empty";
    //                                   } else if (rawValue.length < 4) {
    //                                     return "OTP must be 4 characters long";
    //                                   } else if (rawValue.length > 4) {
    //                                     return "OTP cannot exceed 4 characters";
    //                                   }
    //                                   return null;
    //                                 },
    //                                 successMessage: "OTP verified",
    //                                 errorMessage: "Invalid OTP",
    //                                 validateOnInputChange: true,
    //                                 showValidationIcons: false,
    //                                 maxLength: 7,
    //                               ),
    //                             ),
    //                             const Width(width: 20),
    //                             Obx(
    //                               () => Expanded(
    //                                 child: CustomButton(
    //                                   onPressed: () {
    //                                     if (controller.isMobileEmail.value) {
    //                                       controller.verifyMobileOtp();
    //                                     }
    //                                   },
    //                                   title: "Verified",
    //                                   fontSize: 20,
    //                                   bgColor: !controller.isMobileEmail.value ? AppColors.inActive : AppColors.green,
    //                                   borderColor: !controller.isMobileEmail.value ? AppColors.inActive : AppColors.green,
    //                                   fontWeight: FontWeight.w600,
    //                                   borderRadius: BorderRadius.circular(20),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                     const Height(height: 10),
    //                     const CustomText(
    //                       "Enter Email Address",
    //                       textAlign: TextAlign.start,
    //                       fontSize: 16,
    //                       color: AppColors.inActive,
    //                     ),
    //                     const Height(height: 10),
    //                     CustomTextInput(
    //                       onChanged: (value) {
    //                         if (value.isNotEmpty) {
    //                           controller.isUserIdEmpty.value = true;
    //                         } else {
    //                           controller.isUserIdEmpty.value = false;
    //                         }
    //                       },
    //                       controller: controller.emailController,
    //                       keyboardType: TextInputType.text,
    //                       hintText: "example@gmail.com",
    //                       prefixIcon: Image.asset(
    //                         Assets.emailIcon,
    //                         height: 30,
    //                         width: 30,
    //                       ),
    //                       validator: (value) {
    //                         if (value == null || value.isEmpty) {
    //                           return "Email cannot be empty";
    //                         }
    //                         // controller.startEmailTimer();
    //                         return null;
    //                       },
    //                       successMessage: "Email verified OTP has been sent.",
    //                       errorMessage: "Please enter a valid email.",
    //                       validateOnInputChange: true,
    //                       showValidationIcons: true,
    //                     ),
    //                     const Height(height: 10),
    //                     CustomButton(
    //                       onPressed: () {
    //                         controller.sendEmailOtp();
    //                       },
    //                       title: "Send OTP",
    //                       fontSize: 20,
    //                       bgColor: AppColors.primary,
    //                       borderColor: AppColors.primary,
    //                       fontWeight: FontWeight.w600,
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                     const Height(height: 10),
    //
    //
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             const CustomText(
    //                               "Enter the OTP",
    //                               textAlign: TextAlign.start,
    //                               fontSize: 16,
    //                               color: AppColors.inActive,
    //                             ),
    //                             Obx(
    //                               () => controller.isEmailResendOtp.value == false
    //                                   ? Row(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       crossAxisAlignment: CrossAxisAlignment.center,
    //                                       children: [
    //                                         Image.asset(
    //                                           Assets.timerIcon,
    //                                           height: 20,
    //                                           width: 20,
    //                                         ),
    //                                         const Width(width: 5),
    //                                         CustomText(
    //                                           controller.formattedEmailTimer,
    //                                           textAlign: TextAlign.start,
    //                                           fontSize: 16,
    //                                           color: AppColors.inActive,
    //                                         ),
    //                                       ],
    //                                     )
    //                                   : InkWell(
    //                                       onTap: () {
    //                                         controller.resetEmailTimer();
    //                                       },
    //                                       child: const CustomText(
    //                                         "Resend OTP",
    //                                         textAlign: TextAlign.start,
    //                                         fontSize: 14,
    //                                         color: AppColors.primary,
    //                                       ),
    //                                     ),
    //                             ),
    //                           ],
    //                         ),
    //                         const Height(height: 10),
    //                       ],
    //                     ),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Expanded(
    //                               child: CustomTextInput(
    //                                 validationMessageAlignment: TextAlign.center,
    //                                 textAlignment: TextAlign.center,
    //                                 onChanged: (value) {
    //                                   if (value.isNotEmpty) {
    //                                     String rawInput = value.replaceAll('-', '');
    //                                     String formattedInput = rawInput
    //                                         .split('')
    //                                         .asMap()
    //                                         .entries
    //                                         .map((entry) => entry.key != rawInput.length - 1 ? '${entry.value}-' : entry.value)
    //                                         .join();
    //                                     controller.emailOtpController.text = formattedInput;
    //                                     controller.emailOtpController.selection = TextSelection.fromPosition(
    //                                       TextPosition(offset: formattedInput.length),
    //                                     );
    //                                     controller.isVerifyEmail.value = rawInput.length == 4;
    //                                   } else {
    //                                     controller.isVerifyEmail.value = false;
    //                                   }
    //                                 },
    //                                 controller: controller.emailOtpController,
    //                                 keyboardType: TextInputType.number,
    //                                 hintText: "4-5-5-0",
    //                                 validator: (value) {
    //                                   String rawValue = value?.replaceAll('-', '') ?? '';
    //                                   if (rawValue.isEmpty) {
    //                                     return "OTP cannot be empty";
    //                                   } else if (rawValue.length < 4) {
    //                                     return "OTP must be 4 characters long";
    //                                   } else if (rawValue.length > 4) {
    //                                     return "OTP cannot exceed 4 characters";
    //                                   }
    //                                   return null;
    //                                 },
    //                                 //  successMessage: "OTP verified",
    //                                 errorMessage: "Invalid OTP",
    //                                 validateOnInputChange: true,
    //                                 showValidationIcons: false,
    //                                 maxLength: 7, // 4 digits + 3 hyphens
    //                               ),
    //                             ),
    //                             const Width(width: 20),
    //                             Obx(
    //                               () => Expanded(
    //                                 child: CustomButton(
    //                                   onPressed: () {
    //                                     if (controller.isVerifyEmail.value) {
    //                                       controller.verifyEmailOtp();
    //                                     }
    //                                   },
    //                                   title: "Verified",
    //                                   fontSize: 20,
    //                                   bgColor: !controller.isVerifyEmail.value ? AppColors.inActive : AppColors.green,
    //                                   borderColor: !controller.isVerifyEmail.value ? AppColors.inActive : AppColors.green,
    //                                   fontWeight: FontWeight.w600,
    //                                   borderRadius: BorderRadius.circular(20),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         Obx(
    //                           () => Visibility(
    //                             visible: controller.isVerifyEmail.value,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(top: 5.0),
    //                               child: Align(
    //                                 alignment: Alignment.centerRight,
    //                                 child: GestureDetector(
    //                                   onTap: () {
    //                                     // controller.resendOtp();
    //                                   },
    //                                   child: const CustomText(
    //                                     "Resend OTP?",
    //                                     fontSize: 14,
    //                                     color: AppColors.textPrimary,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 const Height(height: 50),
    //                 Obx(
    //                   () => CustomButton(
    //                     onPressed: () {
    //                       if (controller.isEmailVerified.value == true) {
    //                         Get.to(() => CreatePasswordView(), arguments: [controller.prnNumber, controller.emailController.text]);
    //                       } else {
    //                         showErrorMessage("Please verify Email or Phone first");
    //                       }
    //                     },
    //                     title: "Next",
    //                     fontSize: 20,
    //                     bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
    //                     borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
    //                     fontWeight: FontWeight.w600,
    //                     borderRadius: BorderRadius.circular(20),
    //                   ),
    //                 ),
    //               ],
    //             ).paddingSymmetric(horizontal: 24),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressIndicator(controller.currentStep.value),
              const Height(height: 30),
              if (controller.currentStep.value == 1 && controller.currentPhase.value == 1) _buildEnterMobileNumber(),
              if (controller.currentStep.value == 1 && controller.currentPhase.value == 2) _buildEnterMobileOTP(),
              if (controller.currentStep.value == 2 && controller.currentPhase.value == 1) _buildEnterEmail(),
              if (controller.currentStep.value == 2 && controller.currentPhase.value == 2) _buildEnterEmailOTP(),
              if (controller.currentStep.value == 3) _buildSetPassword(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProgressIndicator(int step) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          bool isCompleted = step > index + 1;
          bool isActive = step == index + 1;

          return Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: isCompleted
                    ? AppColors.green
                    : isActive
                        ? AppColors.primary
                        : AppColors.white,
                child: CustomText(
                  '${index + 1}',
                  color: isCompleted || isActive ? AppColors.white : AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (index != 2)
                SizedBox(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: DottedLine(
                      dashColor: isCompleted ? AppColors.green : AppColors.lightGrey,
                      lineThickness: 1,
                      dashLength: 5,
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  // Enter Mobile Number Screen
  Widget _buildEnterMobileNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Height(height: 20),
          const CustomText(
            "Verify Mobile Number",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          const Height(height: 10),
          const CustomText(
            "Please verify your registered Mobile Number",
            textAlign: TextAlign.center,
            fontSize: 16,
            color: AppColors.inActive,
          ),
          const Height(height: 40),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              "Enter Mobile Number",
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.inActive,
            ),
          ),
          const Height(height: 10),
          CustomTextInput(
            onChanged: (value) {
              if (controller.mobileNumberController.text.length == 10) {
                controller.startMobileTimer();
                // Show success message
                controller.isUserIdEmpty.value = true;
              } else {
                controller.isUserIdEmpty.value = false;
              }
              // }
            },
            maxLength: 10,
            controller: controller.mobileNumberController,
            keyboardType: TextInputType.number,
            hintText: "+91 XXXXXXXXXX",
            successMessage: "Mobile number verified. OTP has been sent.",
            errorMessage: "Please enter a valid mobile number.",
            validateOnInputChange: true,
            showValidationIcons: true,
          ),
          Height(height: Get.height * .4),
          CustomButton(
            onPressed: () {
              // controller.nextPhaseOrStep();
              controller.sendMobileOtp();
            },
            title: "Send OTP",
            fontSize: 20,
            bgColor: AppColors.primary,
            borderColor: AppColors.primary,
            fontWeight: FontWeight.w600,
            borderRadius: BorderRadius.circular(20),
          ),
          const Height(height: 10),
        ],
      ),
    );
  }

  // Enter mobile OTP Screen
  Widget _buildEnterMobileOTP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Height(height: 20),
          const CustomText(
            "Enter OTP",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          const Height(height: 10),
          const CustomText(
            "Please verify your registered Mobile Number",
            textAlign: TextAlign.center,
            fontSize: 16,
            color: AppColors.inActive,
          ),
          const Height(height: 40),
          Align(
            alignment: Alignment.center,
            child: PinCodeTextField(
              maxLength: 4,
              controller: controller.mobileOtpController,
              pinBoxHeight: Get.height * .062,
              pinBoxWidth: Get.width * .13,
              defaultBorderColor: AppColors.white,
              pinBoxColor: AppColors.white,
              hasTextBorderColor: AppColors.primary,
              pinBoxRadius: 20,
              pinTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              pinBoxBorderWidth: 1,
              pinBoxOuterPadding: const EdgeInsets.symmetric(horizontal: 10),
              onTextChanged: (text) {
                controller.isMobileEmail.value = text.length == 4;
              },
            ),
          ),
          Obx(
            () => controller.isMobileResendOtp.value == false
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
                        controller.formattedMobileTime,
                        textAlign: TextAlign.start,
                        fontSize: 16,
                        color: AppColors.inActive,
                      ),
                    ],
                  )
                : const CustomText(
                    "Resend OTP",
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
          ),
          Height(height: Get.height * .45),
          Obx(
            () => CustomButton(
              onPressed: () {
                // controller.nextPhaseOrStep();
                controller.verifyMobileOtp();
              },
              title: "Verified",
              fontSize: 20,
              bgColor: !controller.isMobileEmail.value ? AppColors.inActive : AppColors.green,
              borderColor: !controller.isMobileEmail.value ? AppColors.inActive : AppColors.green,
              fontWeight: FontWeight.w600,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  // Enter Email Screen
  Widget _buildEnterEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Height(height: 20),
          const CustomText(
            "Verify Email Id",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          const Height(height: 10),
          const CustomText(
            "Please verify your registered Email Id",
            textAlign: TextAlign.center,
            fontSize: 16,
            color: AppColors.inActive,
          ),
          const Height(height: 40),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              "Enter Email Address",
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
            controller: controller.emailController,
            keyboardType: TextInputType.text,
            hintText: "example@gmail.com",
            prefixIcon: Image.asset(
              Assets.emailIcon,
              height: 30,
              width: 30,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email cannot be empty";
              }
              // controller.startEmailTimer();
              return null;
            },
            // successMessage: "Email verified OTP has been sent.",
            // errorMessage: "Please enter a valid email.",
            validateOnInputChange: true,
            showValidationIcons: false,
          ),
          Height(height: Get.height * .45),
          CustomButton(
            onPressed: () {
              if (controller.emailController.text.isNotEmpty) {
                controller.sendEmailOtp();
              } else {
                showErrorMessage("Please enter email id");
              }

              // controller.nextPhaseOrStep();
            },
            title: "Get OTP",
            fontSize: 20,
            bgColor: AppColors.primary,
            borderColor: AppColors.primary,
            fontWeight: FontWeight.w600,
            borderRadius: BorderRadius.circular(20),
          ),
          const Height(height: 10),
        ],
      ),
    );
  }

  // Enter email OTP Screen
  Widget _buildEnterEmailOTP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Height(height: 20),
          const CustomText(
            "Enter OTP",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          const Height(height: 10),
          const CustomText(
            "Please verify your registered Email Id",
            textAlign: TextAlign.center,
            fontSize: 16,
            color: AppColors.inActive,
          ),
          const Height(height: 40),
          Align(
            alignment: Alignment.center,
            child: PinCodeTextField(
              maxLength: 4,
              controller: controller.emailOtpController,
              pinBoxHeight: Get.height * .062,
              pinBoxWidth: Get.width * .13,
              defaultBorderColor: AppColors.white,
              pinBoxColor: AppColors.white,
              hasTextBorderColor: AppColors.primary,
              pinBoxRadius: 20,
              pinTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              pinBoxBorderWidth: 1,
              pinBoxOuterPadding: const EdgeInsets.symmetric(horizontal: 10),
              onTextChanged: (text) {
                controller.isVerifyEmail.value = text.length == 4;
              },
            ),
          ),

          Height(height: Get.height * .45),
          Obx(
            () => CustomButton(
              onPressed: () {
                controller.verifyEmailOtp();
                // controller.nextPhaseOrStep();
              },
              title: "Verified",
              fontSize: 20,
              bgColor: !controller.isVerifyEmail.value ? AppColors.inActive : AppColors.green,
              borderColor: !controller.isVerifyEmail.value ? AppColors.inActive : AppColors.green,
              fontWeight: FontWeight.w600,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // Obx(
          //   () => CustomButton(
          //     onPressed: () {
          //       // if (controller.isEmailVerified.value == true) {
          //         Get.to(() => CreatePasswordView(), arguments: [controller.prnNumber, controller.emailController.text]);
          //       // } else {
          //       //   showErrorMessage("Please verify Email or Phone first");
          //       // }
          //     },
          //     title: "Next",
          //     fontSize: 20,
          //     bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
          //     borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
          //     fontWeight: FontWeight.w600,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Set Password Screen
  Widget _buildSetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                if (controller.passwordController.text == controller.confirmPasswordController.text) {
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
      ),
    );
  }
}
