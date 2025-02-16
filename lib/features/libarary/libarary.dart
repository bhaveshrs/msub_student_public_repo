import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class Libarary extends StatelessWidget {
  const Libarary({super.key});

  Widget commonRow({required String svg, required String title}) {
    return Row(
      children: [
        SvgPicture.asset(svg),
        const SizedBox(width: 6),
        AppText(
            text: title,
            style: AppTextStyles.pop10Reg(color: MyAppColors.textColor)),
      ],
    );
  }

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
            SizedBox(
              height: 18,
              width: 18,
              child: Image.asset(AppImages.services),
            ),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Library Services",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text("Explore the libraries and their facilities.",
                style: TextStyle(
                    color: MyAppColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRouteNames.libaryDetails);
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyAppColors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 6, right: 6, top: 6),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: Image.asset(
                                        AppImages.libaryImg,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        right: 18,
                                        top: 16,
                                        child: SvgPicture.asset(index % 2 == 0
                                            ? AppImages.openSvg
                                            : AppImages.closeSvg)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 29),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: "Shrimati Hansa Mehta",
                                    style: AppTextStyles.rob16Medium(
                                        color: MyAppColors.blue3),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 8,
                                        width: 8,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: MyAppColors.blue3)),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "8:00 AM – 8:00 PM",
                                        style: AppTextStyles.pop10Reg(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  commonRow(
                                      svg: AppImages.calendar2,
                                      title: "Near Lorium Ipsum"),
                                  commonRow(
                                      svg: AppImages.calendar2,
                                      title: "Monday - Saturday")
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
