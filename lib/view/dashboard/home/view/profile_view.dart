import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/home/controller/profile_view_controller.dart';
import 'package:msub/view/dashboard/home/view/id_card_view.dart';
import 'package:msub/view/dashboard/home/view/profile_details_view.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/assets.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/size_space.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  ProfileViewController controller = Get.put(ProfileViewController());

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
            Icon(
              Icons.person_3_outlined,
              color: AppColors.primary,
            ),
            SizedBox(
              width: 5,
            ),
            CustomText(
              "My Profile",
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Height(height: 20),
            Stack(
              children: [
                Container(
                  height: Get.height * 0.18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.headerBgImg),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.12,
                    vertical: Get.height * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  Assets.profileIcon,
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abhay Govind",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "#PN12345678",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "B.Com (H) (2022)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Faculty Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*const SizedBox(height: 16),
            // Document Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3,
                ),
                itemCount: 6, // Number of documents
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.docIcon,
                          fit: BoxFit.cover,
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 12),
                        const CustomText(
                          'Lorium Ips',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.6,
                ),
                itemCount: 4, // Number of documents
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       Assets.docIcon,
                    //       fit: BoxFit.cover,
                    //       width: 35,
                    //       height:35,
                    //     ),
                    //     const SizedBox(width: 12),
                    //     const CustomText('Lorium Ips',fontSize: 16,fontWeight: FontWeight.w400,),
                    //   ],
                    // ),
                  );
                },
              ),
            ),
            const Height(height: 20),*/
            // Logout Button

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ProfileDetailsView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.userProfileIcon,
                            fit: BoxFit.cover,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          const CustomText(
                            'Profile Detail',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    const Height(height: 10),
                    const Divider(color: AppColors.white2, thickness: 1),
                    InkWell(
                      onTap: () {
                        Get.to(() => IdCardView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.idCardIcon,
                            fit: BoxFit.cover,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          const CustomText(
                            'Digital ID Card',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    const Height(height: 10),
                    const Divider(color: AppColors.white2, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.settingIcon,
                          fit: BoxFit.cover,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 12),
                        const CustomText(
                          'Settings ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    const Height(height: 10),
                    const Divider(color: AppColors.white2, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.aboutIcon,
                          fit: BoxFit.cover,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 12),
                        const CustomText(
                          'About Us',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    const Height(height: 10),
                    const Divider(color: AppColors.white2, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.logoutIcon,
                          fit: BoxFit.cover,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 12),
                        const CustomText(
                          'Logout',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Center(
                      child: CustomText(
                        'Version: v1.01\nPowered by Connexion',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGrey,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 12),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         Assets.logoutIcon,
            //         fit: BoxFit.cover,
            //         width: 24,
            //         height: 24,
            //       ),
            //       const SizedBox(width: 12),
            //       const CustomText(
            //         'Logout',
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //         color: AppColors.red,
            //       ),
            //     ],
            //   ),
            // ),
            const Height(height: 10)
          ],
        ),
      ),
    );
  }
}
