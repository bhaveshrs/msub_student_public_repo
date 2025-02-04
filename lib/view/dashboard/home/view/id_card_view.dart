import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/app_colors.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/controller/id_card_view_controller.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

class IdCardView extends StatelessWidget {
  final IdCardViewController controller = Get.put(IdCardViewController());

  IdCardView({super.key});

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
            Image.asset(
              Assets.idCardIcon,
              fit: BoxFit.cover,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            const CustomText(
              " Digital ID Card",
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Identification & Verification",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text("Student ID Number", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkerGrey))
                      .paddingSymmetric(horizontal: 20),
                  const Height(height: 5),
                  const Text("123456789").paddingSymmetric(horizontal: 20),
                  const SizedBox(height: 10),
                  // const Text("Digital ID Card", style: TextStyle(fontWeight: FontWeight.bold)),
                  // const SizedBox(height: 5),
                  buildIDCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIDCard() {
    return Column(
      children: [
        Image.asset(Assets.idCardImg),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
