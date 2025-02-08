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
import 'package:msub/features/signin/bloc/register_bloc.dart';
import 'package:msub/features/signin/bloc/register_state.dart';
import 'package:pinput/pinput.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with logo and title
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: size.height * .10),
//               Image.asset(
//                 AppImages.welcome,
//                 width: 350,
//               ),
//             ],
//           ),
//           // Foreground with buttons
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: size.height * .50,
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(40),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                   child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 50),
//                     const AppText(
//                       text: "Hello!",
//                       fontSize: 28,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     const SizedBox(height: 10),
//                     const AppText(
//                       text:
//                           "Log in to access your courses, timetable, and academic resources, or create a new account.",
//                       textAlign: TextAlign.center,
//                       fontSize: 16,
//                       color: MyAppColors.black,
//                     ),
//                     const SizedBox(height: 40),
//                     AppButton(
//                       onPress: () {},
//                       buttonName: "Sign In",
//                       // fontSize: 20,
//                       // fontWeight: FontWeight.w600,
//                       // borderRadius: BorderRadius.circular(20),
//                     ),
//                     const SizedBox(height: 30),
//                     AppButton(
//                       onPress: () {},
//                       buttonName: "Sign Up",
//                       // fontSize: 20,
//                       // fontWeight: FontWeight.w600,
//                       // bgColor: MyAppColors.white,
//                       // borderColor: MyAppColors.white2,
//                       // color: MyAppColors.primary,
//                       // borderRadius: BorderRadius.circular(20),
//                     ),
//                   ],
//                 ),
//               )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController facultyIdController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String otpTimerText = "0:00";
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

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
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          print(state.sendEmailOtpStatus);
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
          if (state.verifyOtpStatus.isSuccess) {
            _scrollToBottom();
          }
          if (state.registerStatus.isSuccess) {
            context.pushNamed(AppRouteNames.dashboardRoute);
          }
        },
        builder: (context, state) {
          return Stack(children: [
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
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const SizedBox(height: 30),
                        const AppText(
                          text: "Sign In",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: MyAppColors.black,
                        ),
                        const SizedBox(height: 10),
                        const AppText(
                          text:
                              "Enter your User ID to sign in to your account..",
                          textAlign: TextAlign.center,
                          fontSize: 12,
                          color: MyAppColors.inActiveText,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       AppText(
                            //         text: "Enter Faculty Id",
                            //         textAlign: TextAlign.start,
                            //         style: AppTextStyles.pop12Reg(),
                            //       ),
                            //     ]),
                            const SizedBox(height: 10),
                            CustomTextInput(
                              labelText: "Enter User Id",
                              readOnly: state.startFillOtp,
                              maxLines: 1,
                              textAlignment: TextAlign.start,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  enteredId = true;
                                  setState(() {});
                                }
                              },
                              controller: facultyIdController,
                              keyboardType: TextInputType.text,
                              hintText: "abcd@gmail.com",
                              prefixIcon: Image.asset(
                                AppImages.userIcon,
                                height: 40,
                                width: 40,
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
                        if (!state.startFillOtp) ...[
                          const SizedBox(height: 40),
                          AppButton(
                              loading: state.sendEmailOtpStatus.isInProgress,
                              onPress: () {
                                if (!state.sendEmailOtpStatus.isSuccess &&
                                    facultyIdController.text.isNotEmpty) {
                                  context.read<SignInBloc>().add(
                                      SentOtpViaEmailEvent(
                                          email:
                                              facultyIdController.text ?? ""));
                                }

                                // context.read<SignInBloc>().add(StartViaEmail(
                                //     email: facultyIdController.text ?? ""));
                              },
                              buttonName: "Get Otp",
                              buttonColor: enteredId
                                  ? MyAppColors.blue3
                                  : MyAppColors.inActiveBtn),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  height: 3,
                                  color: MyAppColors.inActiveText,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: AppText(
                                  style: AppTextStyles.pop12Reg(
                                      color: Colors.black),
                                  text: "or",
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  height: 2,
                                  color: MyAppColors.inActiveText,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SvgPicture.asset(AppImages.bioMatrix),
                          ),
                          AppText(
                            text: "Use Biometric",
                            style: AppTextStyles.pop14Reg(),
                          ),
                        ] else ...[
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Enter the OTP",
                                textAlign: TextAlign.start,
                                style: AppTextStyles.pop12Reg(),
                              ),
                              if (!state.verifyOtpStatus.isSuccess) ...[
                                (!(otpTimerText == "0:00"))
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (!state
                                              .verifyOtpStatus.isSuccess) ...[
                                            SvgPicture.asset(
                                              AppImages.timerIcon,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            AppText(
                                              text: otpTimerText,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyles.pop12Reg(),
                                            ),
                                          ]
                                        ],
                                      )
                                    : InkWell(
                                        onTap: () {
                                          context.read<SignInBloc>().add(
                                              SentOtpViaEmailEvent(
                                                  email: facultyIdController
                                                          .text ??
                                                      ""));
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
                                    if (mounted) {
                                      setState(() {});
                                    }
                                    debugPrint('onChanged: $value');
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: AppButton(
                                    loading: state
                                            .verifyOtpStatus.isInProgress ||
                                        state.sendEmailOtpStatus.isInProgress,
                                    buttonColor: state.verifyOtpStatus.isSuccess
                                        ? MyAppColors.appleGreen700
                                        : (state.sendEmailOtpStatus.isSuccess &&
                                                otpController.text.length == 4)
                                            ? MyAppColors.blue3
                                            : MyAppColors.inActiveBtn,
                                    onPress: () {
                                      _scrollToBottom();
                                      // if (!state.sendEmailOtpStatus.isSuccess &&
                                      //     facultyIdController.text.isNotEmpty) {
                                      //   context.read<SignInBloc>().add(
                                      //       SentOtpViaEmailEvent(
                                      //           email:
                                      //               facultyIdController.text ?? ""));
                                      // }

                                      if (state.sendEmailOtpStatus.isSuccess &&
                                          otpController.text.length >= 4) {
                                        context.read<SignInBloc>().add(
                                            OtpVerifyEvent(
                                                otp: otpController.text));
                                      }
                                    },
                                    buttonName: "Verify"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              AppText(
                                text: "Enter Password",
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox()
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomTextInput(
                            onChanged: (value) {
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            hintText: "Enter password",
                            prefixIcon: Image.asset(AppImages.passwordIcon,
                                height: 40, width: 40),
                            validator: (value) {
                              return null;
                            },
                            errorMessage: "Invalid password",
                            validateOnInputChange: true,
                            showValidationIcons: true,
                          ),
                          const SizedBox(height: 30),
                          Visibility(
                            visible: true,
                            child: GestureDetector(
                              onTap: () async {
                                await context
                                    .pushNamed(AppRouteNames.forgotPassRoute);
                              },
                              child: const AppText(
                                text: "Forgot Password?",
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          AppButton(
                            loading: state.registerStatus.isInProgress,
                            onPress: () {
                              if (state.verifyOtpStatus.isSuccess &&
                                  passwordController.text.isNotEmpty) {
                                context.read<SignInBloc>().add(
                                    RegisterAPICallEvent(
                                        password: passwordController.text,
                                        deviceId: "deviceId"));
                              }
                            },
                            buttonName: "Sign In",
                            buttonColor: passwordController.text.isEmpty
                                ? MyAppColors.inActiveBtn
                                : MyAppColors.blue3,
                          ),
                        ],
                      ]),
                    )),
              ),
            )
          ]);
        },
      ),
    );
  }
}
