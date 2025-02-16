import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/forgot_pass/bloc/forgot_pass_bloc.dart';
import 'package:pinput/pinput.dart';

class CreateNewPass extends StatefulWidget {
  final String? email;
  final String? prn;
  const CreateNewPass({super.key, required this.email, required this.prn});

  @override
  State<CreateNewPass> createState() => _CreateStateNewPass();
}

class _CreateStateNewPass extends State<CreateNewPass> {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  late ForgotPassBloc bloc;
  bool isPasswordValid(String password) {
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);
    final hasSpecialCharacter =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    return hasLetter && hasNumber && hasSpecialCharacter;
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
      body: BlocProvider(
        create: (context) => ForgotPassBloc(),
        child: BlocListener<ForgotPassBloc, ForgotPassState>(
          listener: (context, state) {
            if (state.resetPassStatus.isSuccess) {
              context.go(AppRouteNames.dashboardRoute);
            }
            // TODO: implement listener
          },
          child: BlocBuilder<ForgotPassBloc, ForgotPassState>(
            builder: (context, state) {
              return Stack(
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
                  // Background with logo and title

                  // Foreground with buttons
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
                            text: "Create New Password",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: MyAppColors.black,
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text:
                                "Set a strong password to secure your account.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.pop12Reg(),
                            // fontSize: 12,
                            // color: MyAppColors.inActiveText,
                            // fontFamily: "Poppins",
                            // fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: AppText(
                                      text: "Set Password",
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.pop12Reg(
                                          color: MyAppColors.grey),
                                    ),
                                  ),
                                  const SizedBox()
                                ],
                              ),
                              CustomTextInput(
                                onChanged: (value) {
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                controller: passController,
                                keyboardType: TextInputType.text,
                                hintText: "Password",

                                validator: (value) {
                                  return null;

                                  // if (value == null) {
                                  //   return "Invalid User Id";
                                  // }
                                  // return null;
                                },
                                // successMessage: "OTP sent to the registered email.",
                                // errorMessage: "Invalid User Id.",
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
                                        child: passController.text.isNotEmpty &&
                                                passController.text.length >= 8
                                            ? SvgPicture.asset(
                                                AppImages.greenTik)
                                            : SvgPicture.asset(
                                                AppImages.redTik)),
                                  ),
                                  Expanded(
                                      child: AppText(
                                    text: "Minimum 8 characters",
                                    style: AppTextStyles.pop12Reg(
                                        color: MyAppColors.grey),
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
                                        child:
                                            isPasswordValid(passController.text)
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
                                          color: MyAppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: AppText(
                                  text: "Confirm Password",
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.pop12Reg(
                                      color: MyAppColors.grey),
                                ),
                              ),
                            ],
                          ),
                          CustomTextInput(
                            readOnly: !(isPasswordValid(passController.text) &&
                                passController.text.length >= 8),
                            onTap: () {
                              if (!(isPasswordValid(passController.text) &&
                                  passController.text.length >= 8)) {
                                showCustomToast(
                                    "first enter password as suggested", false);
                              }
                            },

                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: confirmPassController,
                            keyboardType: TextInputType.text,
                            hintText: "Password",

                            validator: (value) {
                              return null;

                              // if (value == null) {
                              //   return "Invalid User Id";
                              // }
                              // return null;
                            },
                            // successMessage: "OTP sent to the registered email.",
                            // errorMessage: "Invalid User Id.",
                            validateOnInputChange: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppButton(
                              loading: state.resetPassStatus.isInProgress,
                              onPress: () {
                                if (isPasswordValid(passController.text) &&
                                    passController.text.length >= 8 &&
                                    confirmPassController.text ==
                                        passController.text) {
                                  context.read<ForgotPassBloc>().add(
                                      ResetPassEvent(
                                          email: widget.email ?? "",
                                          prn: widget.prn ?? "",
                                          password: passController.text));
                                }
                              },
                              buttonName: "Next",
                              buttonColor:
                                  (isPasswordValid(passController.text) &&
                                          passController.text.length >= 8 &&
                                          confirmPassController.text ==
                                              passController.text)
                                      ? MyAppColors.blue3
                                      : MyAppColors.inActiveBtn
                              // borderColor: !controller.isUserIdEmpty.value
                              //     ? MyAppColors.inActive
                              //     : MyAppColors.primary,
                              // fontWeight: FontWeight.w600,
                              // borderRadius: BorderRadius.circular(20),
                              ),
                        ]),
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
