import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class ClassAddedDialog extends StatelessWidget {
  const ClassAddedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Share Class Details',
                style: AppTextStyles.rob16Medium(color: MyAppColors.blue3)),
            const SizedBox(height: 10),
            Text('Share this class with students or other faculty members.',
                textAlign: TextAlign.center,
                style: AppTextStyles.pop11ExLite(
                    color: MyAppColors.inActiveText,
                    fontSty: FontStyle.italic)),
            const SizedBox(height: 20),
            Text('9689',
                style: AppTextStyles.rob16Medium().copyWith(fontSize: 56)),
            const SizedBox(height: 16),
            Text('Design Studio (BM101)',
                style: AppTextStyles.rob16Medium(color: MyAppColors.blue3)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    height: 3,
                    color: MyAppColors.inActiveText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AppText(
                    style:
                        AppTextStyles.pop12Reg(color: MyAppColors.inActiveText),
                    text: "or",
                  ),
                ),
                const Expanded(
                  child: Divider(
                    height: 2,
                    color: MyAppColors.inActiveText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: MyAppColors.white2,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "https://universityportal.com/classes/AA102",
                          style: AppTextStyles.pop10Reg(
                              color: MyAppColors.inActiveText),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    FlutterClipboard.copy(
                            'https://universityportal.com/classes/AA102')
                        .then((value) {
                      showCustomToast("copied to Clipboard", true);
                    });
                  },
                  child: SvgPicture.asset(
                    AppImages.copySvg,
                  ),
                )
              ],
            ),

            // const TextField(
            //   decoration: InputDecoration(
            //     hintText: 'https://universityportal.com/classes/AA102',
            //     hintStyle: TextStyle(color: Colors.grey),
            //     filled: true,
            //     fillColor: Color(0xFFF5F5F5),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
            //       borderSide: BorderSide.none,
            //     ),
            //     suffixIcon: Icon(Icons.copy, color: Colors.grey),
            //   ),
            // ),
            const SizedBox(height: 24),
            AppButton(
              buttonName: "Share Via",
              textStyle: AppTextStyles.pop12Reg(color: MyAppColors.white),
              icon: const Icon(
                Icons.share_outlined,
                color: Colors.white,
                size: 15,
              ),
              onPress: () {},
            )
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.share_outlined, color: Colors.white),
            //   label: const Text(
            //     'Share Via',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     minimumSize: const Size.fromHeight(40),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
