import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';

import '../../../../common/utils/assets.dart';
import '../../../../widgets/common_expantion.dart';
import '../../../../widgets/custom_text.dart';

class ScholarshipDetail extends StatelessWidget {
  const ScholarshipDetail({super.key});

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
            const CustomText("Scholarship", fontSize: 16, color: Colors.black),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 215,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://as2.ftcdn.net/v2/jpg/05/16/64/45/500_F_516644575_wwbNGXJ1s2u9BVBkSxN6KOkLAdd13P7x.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: CustomText(
                  "National Merit Scholarship",
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Deadline : Feb 15, 2025",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CommonExpansion(
                      title: "Introduction",
                      description: [
                        Text(
                            "Lorem ipsum dolor sit amet consectetur. Ornare risus amet quam eu non. Urna sit dignissim in amet. Iaculis elit lectus purus tristique venenatis fringilla mattis nisl in. Quis neque euismod in sed nullam suspendisse."),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColors.inActive,
                      thickness: 0.3,
                    );
                  },
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
