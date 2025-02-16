import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class DetailedViewAnnouncement extends StatelessWidget {
  const DetailedViewAnnouncement({super.key});

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
              child: Image.asset(AppImages.announcement),
            ),
            // SvgPicture.asset(AppImages.bell),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Announcement",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          children: [
            if (true) ...[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seminar",
                      style:
                          AppTextStyles.pop12Reg(color: MyAppColors.darkPurple),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    IntrinsicHeight(
                      //This class is relatively expensive. Avoid using it where possible.
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.green),
                            width: 4,
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: "AI in Modern Education",
                                          style: AppTextStyles.pop12Semi(),
                                        ),
                                      ])
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Ornare risus amet quam eu non. Urna sit dignissim in amet. Iaculis elit lectus purus tristique venenatis fringilla mattis nisl in. Quis neque euismod in sed nullam suspendisse.",
                        style: AppTextStyles.pop12Reg(
                            color: MyAppColors.inActiveText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppImages.clock),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "10:00 AM",
                            style: AppTextStyles.pop11ExLite(
                                color: MyAppColors.grey),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          SvgPicture.asset(AppImages.calendar2),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "11/04/2024",
                            style: AppTextStyles.pop11ExLite(
                                color: MyAppColors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.speakers),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Speakers",
                          style:
                              AppTextStyles.pop12Reg(color: MyAppColors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 27.0),
                      child: Text(
                        "Dr. John Doe, AI Specialist",
                        style: AppTextStyles.pop12Reg()
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          child: const AppText(
                            text: "Add to Calenar",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          decoration: const BoxDecoration(
                              color: MyAppColors.blue3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Text(
                            "Register",
                            style: AppTextStyles.pop14Semi(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(17),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppText(
                              text: "Lorem Ipsum dolor sit",
                              style: AppTextStyles.rob16Medium(),
                            ),
                          ),
                          SvgPicture.asset(
                            AppImages.calendar,
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 5),
                          AppText(
                            text: "11 Oct,2024",
                            style: AppTextStyles.pop11ExLite()
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit ttisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At a sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittis Lorem ipsum dolor sit amet consectetur. At arcu sit sagittisLorem ipsum dolor sit amet consectetur. At arcu sit sagittis",
                        style: AppTextStyles.pop12Reg(color: MyAppColors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: const BoxDecoration(
                                color: MyAppColors.sDarkRed,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22))),
                            child: Text(
                              "Sports",
                              style: AppTextStyles.pop10Reg(color: Colors.white)
                                  .copyWith(fontSize: 8),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "10:12 AM",
                            style: AppTextStyles.pop11ExLite()
                                .copyWith(fontSize: 12),
                          )
                        ],
                      )

                      // Theme(
                      //   data: Theme.of(context)
                      //       .copyWith(dividerColor: Colors.transparent),
                      //   child: ExpansionTile(
                      //     trailing: const SizedBox.shrink(),
                      //     title: Text(
                      //       text,
                      //       maxLines: 2,
                      //     ),
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      //         child: Text(text),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
