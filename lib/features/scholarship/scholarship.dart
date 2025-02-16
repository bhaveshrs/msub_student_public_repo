import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Explore financial support opportunities tailored for your academic journey.",
                  style: AppTextStyles.pop12ExLite()
                      .copyWith(fontStyle: FontStyle.italic),
                ),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                context.pushNamed(
                                    AppRouteNames.scholarshipListing);
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  textList[index],
                                  style: AppTextStyles.pop12Reg(),
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
                                color: MyAppColors.inActiveText,
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
