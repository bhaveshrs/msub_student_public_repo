import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/features/assignment/widgets/bullet_text.dart';
import 'package:msub/features/assignment/widgets/text_and_value_widget.dart';
import 'package:msub/features/files/widgets/file_download.dart';

class AssignmentDetails extends StatelessWidget {
  const AssignmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              minRadius: 12,
              backgroundColor: MyAppColors.blue3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AppText(
                  text: "DS",
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Center(
              child: AppText(
                text: "Design Studio",
                style: AppTextStyles.rob16Medium(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
        decoration: BoxDecoration(
          color: MyAppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assignment Heading',
                    style: AppTextStyles.pop16Semi(color: MyAppColors.blue3),
                  ),
                  const SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextAndValueWidget(
                                title: "Assignment",
                                value: "1",
                              ),
                              const SizedBox(height: 10),
                              TextAndValueWidget(
                                title: "Status",
                                myWidget: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color:
                                        MyAppColors.msuFF8503.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text("Pending",
                                      style: AppTextStyles.pop10Reg(
                                          color: MyAppColors.msuFF8503)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const TextAndValueWidget(
                                title: "Start date",
                                value: "10/12/2024",
                              ),
                              const SizedBox(height: 10),
                              const TextAndValueWidget(
                                title: "Last date",
                                value: "20/12/2024",
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: VerticalDivider(
                            color: MyAppColors.blue3,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: MyAppColors.blue3, width: 4)),
                              child: SvgPicture.asset(
                                AppImages.uploadSvg,
                                height: 24,
                                width: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Upload",
                              style: AppTextStyles.pop10Reg(
                                  color: MyAppColors.blue3),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Description Section
              Text('Description', style: AppTextStyles.pop12Mid()),
              const SizedBox(height: 12),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: AppTextStyles.pop12ExLite()),
              const SizedBox(height: 12),
              const BulletList([
                'ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                'aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                'sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ]),
              const SizedBox(height: 16),
              const FileDownloadWidget()
            ],
          ),
        ),
      ),
    );
  }
}
