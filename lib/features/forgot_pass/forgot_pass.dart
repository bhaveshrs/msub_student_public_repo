import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/forgot_pass/bloc/forgot_pass_bloc.dart';
import 'package:pinput/pinput.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  void initState() {
    super.initState();
    // final state = context.read<ForgotPassBloc>().state;
    // // Initialize the controller with the current state values
    //  emailController.text = state.email ?? '';
    // otpController.text = state.otp ?? '';
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController prnController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  String otpTimerText = "0:00";

  bool enteredId = false;
  bool otpDone = false;
  String formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: AppTextStyles.pop15Reg(),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      // border: Border.all(color: MyAppColors.blue3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => ForgotPassBloc(),
      child: BlocListener<ForgotPassBloc, ForgotPassState>(
        listener: (context, state) {
          if (state.startTimer == true) {
            int remainingSeconds = 300;

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
        },
        child: BlocBuilder<ForgotPassBloc, ForgotPassState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  BackgroundScreen(
                    firstCircleAngle: CircleAngle(x: -128, y: -90),
                    secondCircleAngle: CircleAngle(x: -141, y: -231),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * .04),
                          Image.asset(
                            AppImages.welcome,
                            width: 350,
                          ),
                          const AppText(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white,
                            text: "FACULTY OF COMMERCE",
                            fontFamily: "KoHo",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * .58,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: MyAppColors.white2,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(height: 30),
                          const AppText(
                            text: "Forgot Password",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: MyAppColors.black,
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text:
                                "Please enter your PRN, registered email ID, and OTP to reset your password.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.pop12Reg(
                                color: MyAppColors.inActiveText),
                          ),
                          const SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextInput(
                                labelText: "Enter PRN of Student",
                                readOnly: state.sendEmailOtpStatus.isSuccess,
                                maxLines: 1,
                                textAlignment: TextAlign.start,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: prnController,
                                keyboardType: TextInputType.text,
                                hintText: "Enter PRN",

                                prefixIcon: IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.profileDetail,
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
                                //  Image.asset(
                                //   AppImages.userIcon,
                                //   height: 40,
                                //   width: 40,
                                // ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Invalid PRN";
                                  }
                                  return null;
                                },
                                validateOnInputChange: false,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextInput(
                                labelText: "Enter Email Address",
                                readOnly: state.sendEmailOtpStatus.isSuccess,
                                maxLines: 1,
                                textAlignment: TextAlign.start,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: emailController,
                                keyboardType: TextInputType.text,
                                hintText: "example@gmail.com",
                                prefixIcon: IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                validator: (value) {
                                  if (value == null) {
                                    return "Invalid User Id";
                                  }
                                  return null;
                                },
                                successMessage:
                                    "OTP sent to the registered email.",
                                errorMessage: "Invalid User Id.",
                                validateOnInputChange: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                text: "Enter the OTP",
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              if (!state.verifyOtpStatus.isSuccess &&
                                  state.sendEmailOtpStatus.isSuccess) ...[
                                (!(otpTimerText == "0:00"))
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.timerIcon,
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          AppText(
                                            text: otpTimerText,
                                            textAlign: TextAlign.start,
                                            fontSize: 12,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      )
                                    : InkWell(
                                        onTap: () {
                                          context.read<ForgotPassBloc>().add(
                                              SentForgotPassOtpEvent(
                                                  email: emailController.text ??
                                                      "",
                                                  empId: prnController.text));
                                        },
                                        child: const AppText(
                                          text: "Resend OTP",
                                          textAlign: TextAlign.start,
                                          fontSize: 14,
                                          color: MyAppColors.blue3,
                                        ),
                                      ),
                              ]
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Pinput(
                                  readOnly: state.verifyOtpStatus.isSuccess,
                                  controller: otpController,
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
                                    setState(() {});
                                    debugPrint('onChanged: $value');
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: AppButton(
                                  loading: state.verifyOtpStatus.isInProgress ||
                                      state.sendEmailOtpStatus.isInProgress,
                                  buttonColor: state.verifyOtpStatus.isSuccess
                                      ? MyAppColors.green
                                      : (state.sendEmailOtpStatus.isSuccess &&
                                                  otpController.text.length ==
                                                      4) ||
                                              (!state.sendEmailOtpStatus
                                                      .isSuccess &&
                                                  emailController
                                                      .text.isNotEmpty &&
                                                  prnController.text.isNotEmpty)
                                          ? MyAppColors.blue3
                                          : MyAppColors.inActiveBtn,
                                  onPress: () {
                                    if (!state.verifyOtpStatus.isSuccess) {
                                      if (state.sendEmailOtpStatus.isSuccess &&
                                          otpController.text.length >= 4) {
                                        context.read<ForgotPassBloc>().add(
                                            OtpVerifyEvent(
                                                otp: otpController.text));
                                      } else if (!state
                                              .sendEmailOtpStatus.isSuccess &&
                                          emailController.text.isNotEmpty &&
                                          prnController.text.isNotEmpty) {
                                        context.read<ForgotPassBloc>().add(
                                            SentForgotPassOtpEvent(
                                                email: emailController.text,
                                                empId: prnController.text));
                                      }
                                    }
                                  },
                                  buttonName: state.sendEmailOtpStatus.isSuccess
                                      ? "Verify"
                                      : "Get OTP",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          AppButton(
                              onPress: () {
                                print(state.verifyOtpStatus.isSuccess);
                                if (state.verifyOtpStatus.isSuccess) {
                                  context.pushNamed(
                                    AppRouteNames.createNewPassRoute,
                                    extra: {
                                      'email': state.email,
                                      'prn': prnController.text
                                    },
                                  );
                                }
                              },
                              buttonName: "Next",
                              buttonColor: state.verifyOtpStatus.isSuccess
                                  ? MyAppColors.blue3
                                  : MyAppColors.inActiveBtn),
                        ]),
                      )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
