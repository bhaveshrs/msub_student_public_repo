import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/view/scholarship_listing.dart';

import '../../../../widgets/custom_text.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({super.key});

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  List<String> textList = [
    "Government Scholarships",
    "University-Specific Scholarships",
    "Need-Based Scholarships",
    "Merit-Based Scholarships",
    "Research Grants",
    "Sports Scholarships"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(Assets.s2),
            ),
            // SvgPicture.asset(AppImages.bell),
            const SizedBox(
              width: 5,
            ),
            const CustomText("Scholarship",fontSize: 16, color: Colors.black),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Explore financial support opportunities tailored for your academic journey.",
                  style: const TextStyle(color: AppColors.grey).copyWith(fontStyle: FontStyle.italic),
                ),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => const ScholarshipListing());
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomText(
                                  textList[index],
                                      fontSize: 16,
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 10,
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Divider(
                                color: AppColors.inActive,
                                thickness: 0.3,
                              ),
                            ),
                        itemCount: textList.length)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
