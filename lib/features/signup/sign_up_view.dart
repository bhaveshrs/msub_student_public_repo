import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/background.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/signup/bloc/sign_up_bloc.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController prnController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background
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

          // Foreground
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .58,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: MyAppColors.white2,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.getName) {
                    nameController.text = state.name ?? "";
                  }
                  if (state.updateUserStatus.isSuccess) {
                    context.pushNamed(AppRouteNames.signUpVerifyRoute,
                        extra: {"prnNumber": prnController.text});
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         SignUpVerifyView(prn: prnController.text),
                    //   ),
                    // );
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Height(height: 30),
                        const CustomText(
                          "Sign Up",
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: MyAppColors.black,
                        ),
                        const Height(height: 10),
                        const CustomText(
                          "Enter your University Registration Number to set up your account.",
                          textAlign: TextAlign.center,
                          fontSize: 16,
                          color: MyAppColors.inActiveText,
                        ),
                        const Height(height: 40),
                        CustomTextInput(
                          readOnly: state.checkUserStatus.isSuccess,
                          textCapitalization: TextCapitalization.characters,
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          controller: prnController,
                          hintText: "Enter PRN",
                          labelText: "University PRN",
                          prefixIcon: Image.asset(AppImages.userIcon,
                              height: 40, width: 40),
                        ),
                        const Height(height: 10),
                        if (state.checkUserStatus.isSuccess) ...[
                          const Height(height: 20),
                          CustomTextInput(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            hintText: "Enter Name",
                            labelText: "Student Name",
                          ),
                        ],
                        const Height(height: 50),
                        AppButton(
                            onPress: () {
                              if (prnController.text.isNotEmpty &&
                                  !state.checkUserStatus.isSuccess) {
                                context.read<SignUpBloc>().add(
                                    PRNEnteredEvent(prn: prnController.text));
                              } else if (state.checkUserStatus.isSuccess &&
                                  prnController.text.isNotEmpty &&
                                  nameController.text.isNotEmpty) {
                                context.read<SignUpBloc>().add(
                                    UpdateUserNameEvent(
                                        name: nameController.text,
                                        prn: prnController.text));
                              }
                            },
                            buttonName: "Verify My Account",
                            loading: state.updateUserStatus.isInProgress,
                            buttonColor: prnController.text.isNotEmpty
                                ? MyAppColors.blue3
                                : MyAppColors.inActiveBtn),
                        if (state.checkUserStatus.isSuccess) ...[
                          const Height(height: 20),
                          AppButton(
                              onPress: () {
                                if (nameController.text.isNotEmpty) {
                                  context.read<SignUpBloc>().add(
                                      UpdateUserNameEvent(
                                          prn: prnController.text,
                                          name: nameController.text));
                                }
                              },
                              buttonName: "Next",
                              loading: state.updateUserStatus.isInProgress,
                              buttonColor: nameController.text.isNotEmpty
                                  ? MyAppColors.blue3
                                  : MyAppColors.inActiveBtn),
                        ],
                      ],
                    ),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
