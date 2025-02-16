import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> iconList = [
    AppImages.profileDetail,
    AppImages.idCard,
    AppImages.setting,
    AppImages.aboutUs,
    AppImages.logOut,
  ];
  List<String> textList = [
    "Profile Detail",
    "Digital ID Card",
    "Settings ",
    "About Us",
    "Logout",
  ];

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
            SvgPicture.asset(AppImages.profile),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "My Profile",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 19),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                color: MyAppColors.blue3,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned(
                      top: -143,
                      left: -146,
                      child: Container(
                        width: 334,
                        height: 334,
                        decoration: const BoxDecoration(
                          color: MyAppColors.blue2,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -82,
                      left: -127,
                      child: Container(
                        width: 229,
                        height: 229,
                        decoration: const BoxDecoration(
                          color: MyAppColors.blue1,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 28, horizontal: 33),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 82,
                            width: 82,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage(AppImages.userReplacement),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: "Abhay Govind",
                                style: AppTextStyles.rob16Medium(
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              AppText(
                                text: "#PN12345678",
                                style:
                                    AppTextStyles.pop12Reg(color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              AppText(
                                text: "B.Com (H) (2022)",
                                style:
                                    AppTextStyles.pop12Reg(color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              AppText(
                                text: "Faculty Name",
                                style:
                                    AppTextStyles.pop12Reg(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 12, bottom: 8),
              child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: MyAppColors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (index == 2) {
                                    context.pushNamed(AppRouteNames.settings);
                                  }
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 14),
                                    SvgPicture.asset(iconList[index]),
                                    const SizedBox(width: 12),
                                    Expanded(
                                        child: Text(
                                      textList[index],
                                      style: AppTextStyles.pop12Reg(
                                          color: index == textList.length - 1
                                              ? MyAppColors.darkRed
                                              : MyAppColors.textColor),
                                    ))
                                  ],
                                ),
                              );
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
                        const Spacer(),
                        AppText(
                            text: "Version: v1.01",
                            style: AppTextStyles.pop10Reg(
                                color: MyAppColors.inActiveText)),
                        AppText(
                            text: "Powered by Connexion",
                            style: AppTextStyles.pop10Reg(
                                color: MyAppColors.inActiveText)),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
