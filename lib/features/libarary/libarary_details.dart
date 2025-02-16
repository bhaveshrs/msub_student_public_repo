import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/common_widgets/common_expantion.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';

class LibararyDetails extends StatelessWidget {
  const LibararyDetails({super.key});
  Widget commonTextWithSvg(
      {required String svg, required String title, Color? color}) {
    return Row(
      children: [
        SvgPicture.asset(svg),
        const SizedBox(width: 6),
        AppText(
            text: title,
            style:
                AppTextStyles.pop10Reg(color: color ?? MyAppColors.textColor)),
      ],
    );
  }

  Widget commonDetailsText(
      {required String title,
      bool isShowItalic = true,
      TextAlign? textAlign,
      Color color = MyAppColors.textColor}) {
    return Text(title,
        textAlign: textAlign,
        style: AppTextStyles.pop12ExLite().copyWith(
          fontStyle: isShowItalic ? FontStyle.italic : FontStyle.normal,
        ));
  }

  Widget commonDotWithText(
      {required String title, bool isShowDot = true, String? svg}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowDot
            ? const Text(' •  ')
            : SvgPicture.asset(svg ?? AppImages.calendar2),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: MyAppColors.textColor,
                fontStyle: FontStyle.italic,
                fontSize: 12,
                fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }

  Widget commonTitleWithDescText(
      {required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title : ",
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: MyAppColors.textColor,
              fontStyle: FontStyle.italic,
              fontSize: 11),
        ),
        Flexible(
          child: Text(
            description,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: MyAppColors.textColor,
                fontStyle: FontStyle.italic,
                fontSize: 12,
                fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }

  Widget commonTableRow(
      {required String title1,
      required String title2,
      required String title3}) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: commonDetailsText(
                title: title1,
                color: MyAppColors.textColor,
                isShowItalic: false),
          ),
          Expanded(
            flex: 2,
            child: commonDetailsText(
                textAlign: TextAlign.center,
                title: title2,
                color: MyAppColors.textColor,
                isShowItalic: false),
          ),
          Expanded(
            flex: 2,
            child: commonDetailsText(
                textAlign: TextAlign.end,
                title: title3,
                color: MyAppColors.textColor,
                isShowItalic: false),
          )
        ],
      ),
    );
  }

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
              child: Image.asset(AppImages.services),
            ),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Library Services",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyAppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          AppImages.libaryFullBgImg,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        right: 22,
                        top: 35,
                        child: SvgPicture.asset(AppImages.openSvg)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 21),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          AppText(
                            text: "Shrimati Hansa Mehta",
                            style: AppTextStyles.rob20Semi(
                                color: MyAppColors.blue3),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: MyAppColors.green)),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "8:00 AM – 8:00 PM",
                                    style: AppTextStyles.pop10Reg(),
                                  ),
                                ],
                              ),
                              commonTextWithSvg(
                                  svg: AppImages.calendar2,
                                  title: "Monday - Saturday")
                            ],
                          ),
                          const SizedBox(height: 6),
                          commonTextWithSvg(
                              svg: AppImages.location_1Svg,
                              title: "Near Lorium Ipsum"),
                          CommonExpansion(title: "Introduction", description: [
                            commonDetailsText(
                                title:
                                    'Established in 1950, the Shrimati Hansa Mehta Library is the central hub of academic resources at M.S. University of Baroda. With over 8 lakh books, journals, and digital resources, it serves students, faculty, and researchers.')
                          ]),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          CommonExpansion(title: "Key Features", description: [
                            Column(
                              children: [
                                commonDotWithText(
                                    title:
                                        'Extensive collection of books, journals, and digital repositories.'),
                                commonDotWithText(
                                    title:
                                        'Spacious reading rooms and seminar halls.'),
                                commonDotWithText(
                                    title:
                                        'Global Information Center for reference materials'),
                              ],
                            ),
                          ]),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          CommonExpansion(title: "Facilities", description: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                        child: commonDotWithText(
                                            title: 'Reading Rooms')),
                                    Flexible(
                                        child: commonDotWithText(
                                            title: 'Seminar Halls')),
                                    Flexible(
                                        child: commonDotWithText(
                                            title: 'Seminar Halls')),
                                  ],
                                ),
                                Row(children: [
                                  Flexible(
                                      child: commonDotWithText(
                                          title: 'Seminar Halls')),
                                  Flexible(
                                      flex: 2,
                                      child: commonDotWithText(
                                          title: 'Dedicated Study Areas')),
                                ]),
                                commonDotWithText(
                                    title: 'Global Information Center'),
                              ],
                            ),
                          ]),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          CommonExpansion(
                              title: "Membership & Borrowing",
                              description: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                        text: 'Eligibility',
                                        style: AppTextStyles.pop12Mid(
                                            color: MyAppColors.textColor)),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: commonDotWithText(
                                                title:
                                                    'Undergraduate students')),
                                        Flexible(
                                            child: commonDotWithText(
                                                title:
                                                    'Postgraduate students')),
                                      ],
                                    ),
                                    Row(children: [
                                      Flexible(
                                          child: commonDotWithText(
                                              title: 'Ph.D./M.Phil scholars')),
                                      Flexible(
                                          child: commonDotWithText(
                                              title:
                                                  'Faculty and researchers')),
                                    ]),
                                    commonDotWithText(
                                        title: 'Alumni and corporate members'),
                                    const Divider(
                                      color: MyAppColors.inActiveText,
                                      thickness: 0.3,
                                    ),
                                    AppText(
                                        text: 'Borrowing Rules',
                                        style: AppTextStyles.pop12Mid(
                                            color: MyAppColors.textColor)),
                                    const SizedBox(height: 6),
                                    Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: MyAppColors.inActiveText,
                                              width: 0.3)),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.maxFinite,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: MyAppColors.blue3,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 10),
                                              child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment
                                                //         .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: commonDetailsText(
                                                        title: 'Category',
                                                        color:
                                                            MyAppColors.white,
                                                        isShowItalic: false),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: commonDetailsText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        title: 'Books Issued',
                                                        color:
                                                            MyAppColors.white,
                                                        isShowItalic: false),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: commonDetailsText(
                                                        textAlign:
                                                            TextAlign.end,
                                                        title: 'Loan Period',
                                                        color:
                                                            MyAppColors.white,
                                                        isShowItalic: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          commonTableRow(
                                              title1: "Undergraduates",
                                              title2: "6",
                                              title3: "30 days"),
                                          commonTableRow(
                                              title1: "Postgraduates",
                                              title2: "4",
                                              title3: "30 days"),
                                          commonTableRow(
                                              title1: "Faculty (Permanent)",
                                              title2: "10",
                                              title3: "365 days"),
                                          commonTableRow(
                                              title1: "Faculty (Temporary)",
                                              title2: "8",
                                              title3: "365 days"),
                                          commonTableRow(
                                              title1: "Researchers (JRF/SRF)",
                                              title2: "6",
                                              title3: "30 days"),
                                          commonTableRow(
                                              title1: "Corporate Members",
                                              title2: "3",
                                              title3: "30 days"),
                                          commonTableRow(
                                              title1: "Ph.D./M.Phil Scholars",
                                              title2: "6",
                                              title3: "30 days"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    AppText(
                                        text: 'Other Membership Options',
                                        style: AppTextStyles.pop12Mid(
                                            color: MyAppColors.textColor)),
                                    const SizedBox(height: 6),
                                    commonDotWithText(
                                        title: 'Temporary visitors: ₹50/day.'),
                                    commonDotWithText(
                                        title:
                                            'Alumni: ₹500 for 30 days or ₹20/day.')
                                  ],
                                ),
                              ]),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          CommonExpansion(
                              title: "Contact Information",
                              description: [
                                Column(
                                  children: [
                                    commonDotWithText(
                                        isShowDot: false,
                                        title:
                                            'Dr. Mayank Trivedi (Librarian)'),
                                    commonDotWithText(
                                        isShowDot: false,
                                        title: 'Email: libmsu@gmail.com'),
                                    commonDotWithText(
                                        isShowDot: false,
                                        title: 'Phone: +91-265-2780438'),
                                  ],
                                ),
                              ]),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          const CommonExpansion(
                              title: "Rules & Regulations", description: []),
                          const Divider(
                            color: MyAppColors.inActiveText,
                            thickness: 0.3,
                          ),
                          CommonExpansion(title: "Registration", description: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonTitleWithDescText(
                                    title: 'Step 1',
                                    description:
                                        'Fill out the online registration form with accurate personal, academic, and contact details.'),
                                const SizedBox(height: 6),
                                commonTitleWithDescText(
                                    title: 'Step 2',
                                    description:
                                        'Submit the completed form at the Help Desk located on the ground floor (to the right of the entrance).'),
                                const SizedBox(height: 6),
                                AppText(
                                    text: 'Documents Required:',
                                    style: AppTextStyles.pop12Mid(
                                        color: MyAppColors.textColor)),
                                commonDotWithText(
                                    title: 'Two passport-sized photographs.'),
                                commonDotWithText(
                                    title:
                                        'Fee receipt of ₹50 for the preparation of the library card.'),
                                const SizedBox(height: 6),
                                commonTitleWithDescText(
                                    title: 'Step 3',
                                    description:
                                        'Collect the receipt and visit the library with your ID card to activate your account.'),
                                const SizedBox(height: 6),
                                AppText(
                                    text:
                                        'Visit our website for Registration :',
                                    style: AppTextStyles.pop12Mid(
                                        color: MyAppColors.textColor)),
                                commonTextWithSvg(
                                    svg: AppImages.calendar2,
                                    title: "www.abcd@gmail.com",
                                    color: MyAppColors.blue3)
                              ],
                            ),
                          ]),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
