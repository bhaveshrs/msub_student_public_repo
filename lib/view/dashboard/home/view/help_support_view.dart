import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/controller/help_support_controller.dart';
import 'package:msub/view/dashboard/home/view/report_view.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../widgets/custom_input_text.dart';
import 'faq_view.dart';

class HelpSupportView extends StatelessWidget {
  HelpSupportView({super.key});

  HelpSupportController controller = Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.helpIcon,
              height: 18,
              width: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            const CustomText("Help Center", color: AppColors.black),
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
                const Height(height: 32),
                const CustomText(
                  "How can we help you?",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                const Height(height: 14),
                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          Assets.searchIcon,
                          height: 16,
                          width: 16,
                        ).paddingAll(14),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Height(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.primary))),
                        child: const CustomText(
                          "Featured Topics",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Height(height: 16),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const FeaturedTopicWidget(txt: "How to reset my password?");
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
                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.primary))),
                        child: const CustomText(
                          "Quick Access Section",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Height(height: 16),
                      ListView.separated(
                          padding: const EdgeInsets.only(left: 8),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (controller.quickAccessSection[index] == "Report an Issue") {
                                  // context.pushNamed(AppRouteNames.reportIssue);
                                  Get.to(()=>ReportView());
                                }else if (controller.quickAccessSection[index] == "FAQs") {
                                  // context.pushNamed(AppRouteNames.reportIssue);
                                  Get.to(()=>FaqView());
                                }
                              },
                              child: CustomText("\u2022   ${controller.quickAccessSection[index]}",fontSize: 14, color: AppColors.primary),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: controller.quickAccessSection.length)
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

class FeaturedTopicWidget extends StatelessWidget {
  final String txt;

  const FeaturedTopicWidget({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: AppColors.inActive, blurRadius: 0.1, offset: Offset(0, 0.5)),
      ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        children: [
          Expanded(
              child: Text(
            txt,
          )),
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
          )
        ],
      ),
    );
  }
}
