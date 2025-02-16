import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/common_expantion.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class ScholarshipDetail extends StatelessWidget {
  const ScholarshipDetail({super.key});

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
              child: Image.asset(AppImages.scholarship),
            ),
            // SvgPicture.asset(AppImages.bell),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Scholarship",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 215,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(AppImages.govBg), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  "National Merit Scholarship",
                  style: AppTextStyles.rob16Medium(color: MyAppColors.blue3),
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
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyAppColors.blue3)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Deadline : Feb 15, 2025",
                      style: AppTextStyles.pop10Reg(),
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
                      color: MyAppColors.inActiveText,
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
