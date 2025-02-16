import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> textList = [
    "Enable Biometric Login",
    "Change Mobile Number",
    "Change Email Id ",
    "Forgot Password",
    "Request Data Modification"
  ];

  bool isEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.setting),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Settings",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 12),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: MyAppColors.white),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 14.0, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textList[index],
                                style: AppTextStyles.pop12Reg(
                                  color: MyAppColors.textColor,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                    value: isEnable,
                                    activeColor: MyAppColors.blue3,
                                    trackColor: Colors.grey.withOpacity(0.4),
                                    thumbColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        isEnable = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            if (index == 1) {
                              context
                                  .pushNamed(AppRouteNames.changeMobileNumber);
                            } else if (index == 2) {
                              context.pushNamed(AppRouteNames.changeEmail);
                            } else if (index == 3) {
                              context.pushNamed(AppRouteNames.forGotPassScreen);
                            }
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(
                                textList[index],
                                style: AppTextStyles.pop12Reg(),
                              ))
                            ],
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 14),
                          child: Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                        ),
                    itemCount: textList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
