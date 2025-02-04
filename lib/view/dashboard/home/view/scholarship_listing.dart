import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/home/view/scholarship_detail.dart';
import 'package:msub/widgets/custom_rich_text.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/assets.dart';
import '../../../../widgets/custom_input_text.dart';
import '../../../../widgets/custom_text.dart';

class ScholarshipListing extends StatelessWidget {
  const ScholarshipListing({super.key});

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
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText("Government Scholarships", fontSize: 16, color: Colors.black),
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
            Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // Get.to(() => SearchView());
                  },
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        Assets.searchIcon,
                        height: 16,
                        width: 16,
                      ).paddingAll(14),
                      hintText: "Search Services, Locations, or Facilities...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://as2.ftcdn.net/v2/jpg/05/16/64/45/500_F_516644575_wwbNGXJ1s2u9BVBkSxN6KOkLAdd13P7x.jpg",
                                ),
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
                              const CustomText(
                                "National Merit Scholarship",
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const CustomText(
                                "Benefit: : ₹50,000/year for tuition and living expenses.",
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CustomRichText(firstText: "Deadline:", secondText: " Feb 15, 2025"),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Eligibility: 90%+ in 12th grade or equivalent.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColors.grey).copyWith(fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ScholarshipDetail());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(20), // Rounded corners
                                    ),
                                    child: const Text(
                                      "View More",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
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
