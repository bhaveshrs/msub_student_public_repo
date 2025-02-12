import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/signup_verify/bloc/sign_up_verify_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../common/utils/app_colors.dart';
import '../../../widgets/size_space.dart';

class SignUpVerifyView extends StatefulWidget {
  final String prnNumber;

  const SignUpVerifyView({super.key, required this.prnNumber});

  @override
  State<SignUpVerifyView> createState() => _SignUpVerifyViewState();
}

class _SignUpVerifyViewState extends State<SignUpVerifyView> {
  final TextEditingController mobileNumberController = TextEditingController();

  final TextEditingController mobileOtpController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController emailOtpController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  String otpTimerText = "0:00";
  String otpTimerTextForEmail = "0:00";
  String formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  bool isPasswordValid(String password) {
    final hasUppercase =
        RegExp(r'[A-Z]').hasMatch(password); // At least one uppercase letter
    final hasLowercase =
        RegExp(r'[a-z]').hasMatch(password); // At least one lowercase letter
    final hasNumber = RegExp(r'\d').hasMatch(password); // At least one number
    final hasSpecialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]')
        .hasMatch(password); // At least one special char

    return hasUppercase && hasNumber && hasSpecialCharacter;
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    margin: const EdgeInsets.symmetric(horizontal: 12),
    textStyle: AppTextStyles.pop15Reg(),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      // border: Border.all(color: MyAppColors.blue3),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpVerifyBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white2,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<SignUpVerifyBloc, SignUpVerifyState>(
          listener: (context, state) {
            if (state.createPasswordStatus.isSuccess) {
              context.go(AppRouteNames.termConditionsRoute);
            }

            if (state.startTimerForMobile == true) {
              otpTimerText = "0:00";
              int remainingSeconds = 300;
              setState(() {});

              Timer.periodic(const Duration(seconds: 1), (Timer timer) {
                if (remainingSeconds > 0) {
                  remainingSeconds--;
                  if (mounted) {
                    otpTimerText = formatTime(remainingSeconds);
                    setState(() {});
                  }
                } else {
                  timer.cancel();
                  if (mounted) {
                    otpTimerText = "0:00";
                    setState(() {});
                  }
                }
              });
            }
            if (state.startTimerForEmail == true) {
              otpTimerTextForEmail = "0:00";
              int remainingSeconds = 300;
              setState(() {});

              Timer.periodic(const Duration(seconds: 1), (Timer timer) {
                if (remainingSeconds > 0) {
                  remainingSeconds--;
                  if (mounted) {
                    otpTimerTextForEmail = formatTime(remainingSeconds);
                    setState(() {});
                  }
                } else {
                  timer.cancel();
                  if (mounted) {
                    otpTimerTextForEmail = "0:00";
                    setState(() {});
                  }
                }
              });
            }
          },
          child: BlocBuilder<SignUpVerifyBloc, SignUpVerifyState>(
            builder: (context, state) {
              print(otpTimerText);
              print(otpTimerTextForEmail);

              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProgressIndicator(state),
                      const Height(height: 30),
                      if (!state.verifyMobileOtpStatus.isSuccess) ...[
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.sendMobileOtpStatus.isSuccess
                                        ? "Enter OTP"
                                        : "Verify Mobile Number",
                                    style: AppTextStyles.rob20Semi(),
                                  ),
                                  const Height(height: 16),
                                  Text(
                                    state.sendMobileOtpStatus.isSuccess
                                        ? "Please verify your registered Mobile Number"
                                        : "Please verify your registered Mobile Number",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.pop12Reg(
                                        color: MyAppColors.inActiveText),
                                  ),
                                  const Height(height: 30),
                                  !state.sendMobileOtpStatus.isSuccess
                                      ? CustomTextInput(
                                          hintText: "1234567890",
                                          prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                  child: Text(
                                                "+91 |",
                                                style: AppTextStyles.pop15Reg(
                                                    color: MyAppColors
                                                        .inActiveText),
                                              )),
                                            ],
                                          ),
                                          labelText: "Enter Mobile Number",
                                          labelColor: MyAppColors.inActiveText,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          controller: mobileNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            return null;
                                          },
                                          validateOnInputChange: true,
                                          showValidationIcons: true,
                                        )
                                      : const SizedBox.shrink(),
                                  if (state.sendMobileOtpStatus.isSuccess) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Pinput(
                                            readOnly: state
                                                .verifyMobileOtpStatus
                                                .isSuccess,
                                            controller: mobileOtpController,
                                            defaultPinTheme: defaultPinTheme,
                                            separatorBuilder: (index) =>
                                                const SizedBox(width: 6),
                                            validator: (value) {
                                              return null;
                                            },
                                            hapticFeedbackType:
                                                HapticFeedbackType.lightImpact,
                                            onCompleted: (pin) {
                                              debugPrint('onCompleted: $pin');
                                            },
                                            onChanged: (value) {
                                              if (mounted) {
                                                setState(() {});
                                              }
                                              debugPrint('onChanged: $value');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    (!(otpTimerText == "0:00"))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            // crossAxisAlignment:
                                            // CrossAxisAlignment.center,
                                            children: [
                                              if (!state.verifyMobileOtpStatus
                                                  .isSuccess) ...[
                                                AppText(
                                                  text:
                                                      "Resend code in $otpTimerText",
                                                  textAlign: TextAlign.end,
                                                  style: AppTextStyles.pop12Reg(
                                                      color: MyAppColors
                                                          .inActiveText),
                                                ),
                                              ]
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  context
                                                      .read<SignUpVerifyBloc>()
                                                      .add(
                                                        SendMobileOtpEvent(
                                                            prn: widget
                                                                .prnNumber,
                                                            mobile:
                                                                mobileNumberController
                                                                    .text),
                                                      );
                                                },
                                                child: const AppText(
                                                  text: "Resend OTP",
                                                  textAlign: TextAlign.start,
                                                  fontSize: 14,
                                                  color: MyAppColors.blue3,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ]
                                ])),
                      ],
                      if (state.verifyMobileOtpStatus.isSuccess &&
                          !state.verifyEmailOtpStatus.isSuccess) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                state.sendEmailOtpStatus.isSuccess
                                    ? "Enter OTP"
                                    : "Verify Email Id",
                                style: AppTextStyles.rob20Semi(),
                              ),
                              const Height(height: 16),
                              Text(
                                "Please verify your registered Email Id",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.pop12Reg(
                                    color: MyAppColors.inActiveText),
                              ),
                              const Height(height: 30),
                              !state.sendEmailOtpStatus.isSuccess
                                  ? CustomTextInput(
                                      controller: emailController,
                                      keyboardType: TextInputType.text,
                                      hintText: "example@gmail.com",
                                      prefixIcon: IntrinsicHeight(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppImages.email,
                                              height: 25,
                                              width: 25,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              child: VerticalDivider(
                                                color: MyAppColors.blue3,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      labelText: "Enter Email Address",
                                      labelColor: MyAppColors.inActiveText,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      validateOnInputChange: true,
                                      showValidationIcons: true,
                                    )
                                  : const SizedBox.shrink(),
                              if (state.sendEmailOtpStatus.isSuccess) ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Pinput(
                                        readOnly: state
                                            .verifyEmailOtpStatus.isSuccess,
                                        controller: emailOtpController,
                                        defaultPinTheme: defaultPinTheme,
                                        separatorBuilder: (index) =>
                                            const SizedBox(width: 6),
                                        validator: (value) {
                                          return null;
                                        },
                                        hapticFeedbackType:
                                            HapticFeedbackType.lightImpact,
                                        onCompleted: (pin) {
                                          debugPrint('onCompleted: $pin');
                                        },
                                        onChanged: (value) {
                                          if (mounted) {
                                            setState(() {});
                                          }
                                          debugPrint('onChanged: $value');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                (!(otpTimerTextForEmail == "0:00"))
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // crossAxisAlignment:
                                        // CrossAxisAlignment.center,
                                        children: [
                                          if (!state.verifyEmailOtpStatus
                                              .isSuccess) ...[
                                            AppText(
                                              text:
                                                  "Resend code in $otpTimerTextForEmail",
                                              textAlign: TextAlign.end,
                                              style: AppTextStyles.pop12Reg(
                                                  color:
                                                      MyAppColors.inActiveText),
                                            ),
                                          ]
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<SignUpVerifyBloc>()
                                                  .add(
                                                    SendEmailOtpEvent(
                                                        prn: widget.prnNumber,
                                                        email: emailController
                                                            .text),
                                                  );
                                            },
                                            child: const AppText(
                                              text: "Resend OTP",
                                              textAlign: TextAlign.start,
                                              fontSize: 14,
                                              color: MyAppColors.blue3,
                                            ),
                                          ),
                                        ],
                                      ),
                              ]
                            ],
                          ),
                        )
                      ],
                      if (state.verifyMobileOtpStatus.isSuccess &&
                          state.verifyEmailOtpStatus.isSuccess &&
                          !state.isPasswordCreated) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                "Create New Password",
                                style: AppTextStyles.rob20Semi(),
                              ),
                              const Height(height: 16),
                              Text(
                                "Set a strong password to secure your account.",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.pop12Reg(
                                    color: MyAppColors.inActiveText),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              CustomTextInput(
                                labelText: "Set Password",
                                onChanged: (value) {
                                  // if (mounted) {
                                  setState(() {});
                                  // }
                                },
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                hintText: "Password",
                                validator: (value) {
                                  return null;
                                },
                                validateOnInputChange: false,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: passwordController
                                                    .text.isNotEmpty &&
                                                passwordController
                                                        .text.length >=
                                                    8
                                            ? SvgPicture.asset(
                                                AppImages.greenTik)
                                            : SvgPicture.asset(
                                                AppImages.redTik)),
                                  ),
                                  Expanded(
                                      child: AppText(
                                    text: "Minimum 8 characters",
                                    style: AppTextStyles.pop12Reg(
                                        color: AppColors.grey),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: isPasswordValid(
                                                passwordController.text)
                                            ? SvgPicture.asset(
                                                AppImages.greenTik)
                                            : SvgPicture.asset(
                                                AppImages.redTik)),
                                  ),
                                  Expanded(
                                    child: AppText(
                                      text:
                                          "Must contain letters, numbers, and a special character",
                                      style: AppTextStyles.pop12Reg(
                                          color: AppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              const Height(height: 20),
                              CustomTextInput(
                                labelText: "Confirm Password",
                                onChanged: (value) {
                                  // if (mounted) {
                                  setState(() {});
                                  // }
                                },
                                controller: confirmPasswordController,
                                keyboardType: TextInputType.text,
                                hintText: "Password",
                                validator: (value) {
                                  return null;
                                },
                                validateOnInputChange: false,
                              ),
                            ],
                          ),
                        )
                      ]
                    ]),
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<SignUpVerifyBloc, SignUpVerifyState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                  ) +
                  const EdgeInsets.only(bottom: 35),
              child: AppButton(
                  loading: (!state.verifyMobileOtpStatus.isSuccess &&
                          (state.sendMobileOtpStatus.isInProgress ||
                              state.verifyMobileOtpStatus.isInProgress)) ||
                      (state.verifyMobileOtpStatus.isSuccess &&
                          !state.verifyEmailOtpStatus.isSuccess &&
                          (state.sendEmailOtpStatus.isInProgress ||
                              state.verifyEmailOtpStatus.isInProgress)) ||
                      (state.verifyMobileOtpStatus.isSuccess &&
                          state.verifyEmailOtpStatus.isSuccess &&
                          !state.isPasswordCreated &&
                          state.createPasswordStatus.isInProgress),
                  buttonColor: ((!state.verifyMobileOtpStatus.isSuccess &&
                              (mobileNumberController.text.isEmpty ||
                                  (state.sendMobileOtpStatus.isSuccess &&
                                      mobileOtpController.text.isEmpty))) ||
                          (state.verifyMobileOtpStatus.isSuccess &&
                              !state.verifyEmailOtpStatus.isSuccess &&
                              (emailController.text.isEmpty ||
                                  (state.sendEmailOtpStatus.isSuccess &&
                                      emailOtpController.text.isEmpty))) ||
                          !(passwordController.text ==
                              confirmPasswordController.text))
                      ? MyAppColors.inActiveBtn
                      : MyAppColors.blue3,
                  onPress: () {
                    if (!state.verifyMobileOtpStatus.isSuccess) {
                      if (mobileNumberController.text.isNotEmpty &&
                          !state.sendMobileOtpStatus.isSuccess) {
                        context.read<SignUpVerifyBloc>().add(
                              SendMobileOtpEvent(
                                  prn: widget.prnNumber,
                                  mobile: mobileNumberController.text),
                            );
                      } else if (state.sendMobileOtpStatus.isSuccess &&
                          mobileOtpController.text.isNotEmpty) {
                        context.read<SignUpVerifyBloc>().add(
                              VerifyMobileOtpEvent(
                                  otp: mobileOtpController.text,
                                  prn: widget.prnNumber,
                                  mobile: mobileNumberController.text),
                            );
                      }
                    }
                    if (state.verifyMobileOtpStatus.isSuccess &&
                        !state.verifyEmailOtpStatus.isSuccess) {
                      if (!state.sendEmailOtpStatus.isSuccess &&
                          emailController.text.isNotEmpty) {
                        context.read<SignUpVerifyBloc>().add(
                              SendEmailOtpEvent(
                                  prn: widget.prnNumber,
                                  email: emailController.text),
                            );
                      } else if (state.sendEmailOtpStatus.isSuccess &&
                          emailOtpController.text.isNotEmpty) {
                        context.read<SignUpVerifyBloc>().add(
                              VerifyEmailOtpEvent(
                                  otp: emailOtpController.text,
                                  prn: widget.prnNumber,
                                  email: emailController.text),
                            );
                      }
                    }
                    if (state.verifyMobileOtpStatus.isSuccess &&
                        state.verifyEmailOtpStatus.isSuccess &&
                        !state.isPasswordCreated) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        context.read<SignUpVerifyBloc>().add(
                              CreatePasswordEvent(
                                  prn: widget.prnNumber,
                                  email: emailController.text,
                                  password: passwordController.text),
                            );
                      } else {
                        showCustomToast("Password does not match", true);
                      }
                    }
                  },
                  buttonName: ((!state.verifyMobileOtpStatus.isSuccess &&
                              !state.sendMobileOtpStatus.isSuccess) ||
                          (state.verifyMobileOtpStatus.isSuccess &&
                              !state.verifyEmailOtpStatus.isSuccess &&
                              !state.sendEmailOtpStatus.isSuccess))
                      ? "Send OTP"
                      : (state.verifyMobileOtpStatus.isSuccess &&
                              state.verifyEmailOtpStatus.isSuccess &&
                              !state.isPasswordCreated)
                          ? "Sign Up"
                          : "Verify"
                  // bgColor: AppColors.primary,
                  ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(SignUpVerifyState state) {
    int step = 1;
    if (state.verifyMobileOtpStatus.isSuccess) step = 2;
    if (state.verifyEmailOtpStatus.isSuccess) step = 3;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          bool isCompleted = step > index + 1;
          bool isActive = step == index + 1;

          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border:
                      isCompleted ? Border.all(color: AppColors.green) : null,
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.primary : AppColors.white,
                ),
                child: Text(
                  '${index + 1}',
                  style: AppTextStyles.rob16Medium(
                    color: isCompleted
                        ? AppColors.green
                        : isActive
                            ? AppColors.white
                            : AppColors.primary,
                  ),
                ),
              ),
              if (index != 2)
                SizedBox(
                  width: 55,
                  child: DottedLine(
                    dashColor:
                        isCompleted ? AppColors.green : AppColors.lightGrey,
                    lineThickness: 1,
                    dashLength: 5,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  // Enter Email Screen
  // Widget _buildEnterEmail(BuildContext context) {
  //   return

  // }

  // Set Password Screen
  // Widget _buildSetPassword(BuildContext context) {
  //   return

  // }
}
