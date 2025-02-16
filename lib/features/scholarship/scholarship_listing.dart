import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/small_btn.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

class ScholarshipListing extends StatelessWidget {
  const ScholarshipListing({super.key});

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
            AppText(
              text: "Government Scholarships",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextInput(
              radius: 36, contentPadValue: 15, maxLines: 1,
              prefixIcon: const Icon(Icons.search),
              // SvgPicture.asset(
              //   AppImages.search,
              // ),
              hintText: "Search Services, Locations, or Facilities...",
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            image: DecorationImage(
                                image: AssetImage(AppImages.govBg),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "National Merit Scholarship",
                                style: AppTextStyles.rob16Medium(
                                    color: MyAppColors.blue3),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Benefit: : ₹50,000/year for tuition and living expenses.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.pop11ExLite()
                                    .copyWith(fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Deadline:",
                                      style: AppTextStyles.pop11ExLite(
                                              color: Colors.black)
                                          .copyWith(
                                              fontStyle: FontStyle.italic),
                                    ),
                                    TextSpan(
                                      text: ": Feb 15, 2025",
                                      style: AppTextStyles.pop11ExLite(
                                              color: MyAppColors.blue3)
                                          .copyWith(
                                              fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Eligibility: 90%+ in 12th grade or equivalent.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.pop11ExLite()
                                    .copyWith(fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SmallBtn(
                                    onTap: () {
                                      context.pushNamed(
                                          AppRouteNames.scholarshipDetail);
                                    },
                                    title: "View More",
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    ),
                itemCount: 2)
          ],
        ),
      ),
    );
  }
}
