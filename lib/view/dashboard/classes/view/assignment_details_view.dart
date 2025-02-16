import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../../common/utils/app_colors.dart';

class AssignmentDetailsView extends StatelessWidget {
  const AssignmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: 
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.08,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.dsIcon,
                        height: 35,
                        width: 35,
                      ),
                      const Width(width: 5),
                      const CustomText(
                        "Design Studio",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
            const Height(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Assignment Header
                        const Text(
                          'Assignment Heading',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Assignment: 1"),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text("Status: "),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        "Pending",
                                        style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text("Start date: 10/12/2024"),
                                const SizedBox(height: 4),
                                const Text("Last date: 20/12/2024"),
                              ],
                            ),

                            // Upload Icon
                            Row(
                              children: [
                                Container(
                                  color: AppColors.primary,
                                  width: 2,
                                  height: Get.height * .12,
                                ),
                                const Width(width: 20),
                                Column(
                                  children: [
                                    Image.asset(
                                      Assets.uploadIcon,
                                      height: 80,
                                      width: 80,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "Upload",
                                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description Section
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 8),
                  BulletList(const [
                    'ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    'aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ]),
                  const SizedBox(height: 16),
                  // File Section
                  ListTile(
                    leading: const Icon(Icons.description_outlined, size: 40, color: AppColors.black),
                    title: const Text("Lorem ipsum dolor"),
                    subtitle: const Text("1.58 MB.PDF"),
                    trailing: Image.asset(Assets.downloadIcon, height: 30, width: 30),
                    onTap: () {
                      // Handle file download
                    },
                  ),
                  Height(height: Get.height * .2),
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;

  BulletList(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
