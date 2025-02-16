import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class ReportIssueSecStep extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  ReportIssueSecStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.helpAppBar),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Report an Issue",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 19,
            ),
            CustomTextInput(
              prefixIcon: const IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: Text("+91 |")),
                  ],
                ),
              ),
              labelText: "Contact Number",
              onChanged: (value) {},
              controller: contactNumberController,
              keyboardType: TextInputType.number,
              validator: (value) {
                return null;
              },
              validateOnInputChange: true,
              showValidationIcons: true,
            ),
            const SizedBox(height: 16),
            AppText(
              text: " Attach Files ",
              style: AppTextStyles.pop12Reg(color: MyAppColors.grey),
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: MyAppColors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.uploadSvg),
                  const SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      "Upload File",
                      style:
                          AppTextStyles.pop15Reg(color: MyAppColors.inActiveText),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomTextInput(
              labelText: "Description",
              minLines: 6,
              onChanged: (value) {},
              controller: descriptionController,
              keyboardType: TextInputType.text,
              hintText: "Type something here...",
              validator: (value) {
                return null;
              },
              validateOnInputChange: true,
              showValidationIcons: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: AppButton(buttonName: "Submit", onPress: () {}),
      )),
    );
  }
}
