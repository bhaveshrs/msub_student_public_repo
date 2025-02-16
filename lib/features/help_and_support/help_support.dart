import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/help_and_support/widgets/featured_topic_widget.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    List quickAccessSection = [
      "FAQs",
      "Report an Issue",
      "Terms",
      "Privacy",
      "Contact Us",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.helpAppBar),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Help Center",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "How can we help you?",
                  style: AppTextStyles.rob20Semi(),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextInput(
                  radius: 36, contentPadValue: 15, maxLines: 1,
                  prefixIcon: const Icon(Icons.search),
                  // SvgPicture.asset(
                  //   AppImages.search,
                  // ),
                  hintText: "Search",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  decoration: const BoxDecoration(
                      color: MyAppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: MyAppColors.blue3))),
                        child: Text(
                          "Featured Topics",
                          style: AppTextStyles.rob16Medium(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const FeaturedTopicWidget(
                                txt: "How to reset my password?");
                          },
                          itemCount: 5,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 6,
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: MyAppColors.blue3))),
                        child: Text(
                          "Quick Access Section",
                          style: AppTextStyles.rob16Medium(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          padding: const EdgeInsets.only(left: 8),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (quickAccessSection[index] ==
                                    "Report an Issue") {
                                  context.pushNamed(AppRouteNames.reportIssue);
                                }
                              },
                              child: Text(
                                "\u2022 ${quickAccessSection[index]}",
                                style: AppTextStyles.pop14Reg(
                                    color: MyAppColors.blue3),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: quickAccessSection.length)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
