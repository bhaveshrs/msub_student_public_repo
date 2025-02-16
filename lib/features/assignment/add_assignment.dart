// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:msub/config/common_widgets/app_dropdown.dart';
// import 'package:msub/config/common_widgets/app_textfild.dart';
// import 'package:msub/config/common_widgets/apptext.dart';
// import 'package:msub/config/common_widgets/button.dart';
// import 'package:msub/config/resource/app_colors.dart';
// import 'package:msub/config/resource/app_images.dart';
// import 'package:msub/config/resource/app_textstyles.dart';

// class AddAssignment extends StatefulWidget {
//   const AddAssignment({super.key});

//   @override
//   State<AddAssignment> createState() => _AddAssignmentState();
// }

// class _AddAssignmentState extends State<AddAssignment> {
//   String? selectedValue;
//   String? selectedValue1;
//   String? selectedValue2;
//   final List<String> items = [
//     "Individual",
//     "Year & Division",
//   ];
//   final List<String> select = [
//     "select-1",
//     "select-2",
//   ];

//   TextEditingController assignmentTitle = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController startDateController = TextEditingController();
//   TextEditingController endDateController = TextEditingController();
//   TextEditingController prnController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(AppImages.uploadSvg),
//             const SizedBox(
//               width: 5,
//             ),
//             AppText(
//               text: "Upload Assignment",
//               style: AppTextStyles.rob16Medium(color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0) +
//             const EdgeInsets.only(bottom: 18),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 18,
//               ),
//               CustomTextInput(
//                 labelText: "Assignment Title",
//                 onChanged: (value) {},
//                 controller: assignmentTitle,
//                 keyboardType: TextInputType.text,
//                 hintText: "Enter Assignment title",
//                 validator: (value) {
//                   return null;
//                 },
//                 validateOnInputChange: true,
//                 showValidationIcons: true,
//               ),
//               const SizedBox(height: 16),
//               AppText(
//                 text: " Attach Files ",
//                 style: AppTextStyles.pop12Reg(color: MyAppColors.grey),
//                 fontWeight: FontWeight.w400,
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: MyAppColors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(AppImages.uploadSvg),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Center(
//                       child: Text(
//                         "Upload File",
//                         style: AppTextStyles.pop15Reg(
//                             color: MyAppColors.inActiveText),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextInput(
//                       maxLines: 1,
//                       hintText: "DD/MM/YYYY",
//                       labelText: "Start Date",
//                       controller: startDateController,
//                       keyboardType: const TextInputType.numberWithOptions(),
//                       prefixIcon: SvgPicture.asset(
//                         AppImages.calendar,
//                         height: 18,
//                         color: MyAppColors.blue3,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: CustomTextInput(
//                       maxLines: 1,
//                       hintText: "DD/MM/YYYY",
//                       labelText: "End Date",
//                       controller: endDateController,
//                       keyboardType: const TextInputType.numberWithOptions(),
//                       prefixIcon: SvgPicture.asset(
//                         AppImages.calendar,
//                         height: 18,
//                         color: MyAppColors.blue3,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               CommonDropdown(
//                 labelText: "Assign Assignment ",
//                 isExpanded: true,
//                 items: items,
//                 selectedValue: selectedValue,
//                 hintText: "--Choose--",
//                 onChanged: (String? newValue) {
//                   selectedValue = newValue;
//                   setState(() {});
//                 },
//                 buttonDecoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                 ),
//                 dropdownIcon:
//                     const Icon(Icons.keyboard_arrow_down_outlined, size: 16),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               if (selectedValue == "Individual") ...[
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                         child: CustomTextInput(
//                       // prefixIcon: Text(
//                       //   "1.",
//                       //   textAlign: TextAlign.center,
//                       //   style: AppTextStyles.pop15Reg(color: MyAppColors.blue3),
//                       // ),
//                       hintText: "PN1234Rn",
//                       labelText: "Enter Student PNR",
//                       controller: prnController,
//                       keyboardType: TextInputType.text,
//                     )),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(15))),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 32, vertical: 12),
//                       child: const Center(
//                         child: Icon(
//                           Icons.add,
//                           color: MyAppColors.blue3,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//               ],
//               if (selectedValue == "Year & Division") ...[
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: CommonDropdown(
//                         labelText: "Year",
//                         isExpanded: true,
//                         items: select,
//                         selectedValue: selectedValue1,
//                         hintText: "Select",
//                         onChanged: (String? newValue) {
//                           selectedValue1 = newValue;
//                           setState(() {});
//                         },
//                         buttonDecoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                         ),
//                         dropdownIcon: const Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: 16),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Expanded(
//                       child: CommonDropdown(
//                         labelText: "Division",
//                         isExpanded: true,
//                         items: select,
//                         selectedValue: selectedValue2,
//                         hintText: "Select",
//                         onChanged: (String? newValue) {
//                           selectedValue2 = newValue;
//                           setState(() {});
//                         },
//                         buttonDecoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                         ),
//                         dropdownIcon: const Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//               ],
//               CustomTextInput(
//                 labelText: "Description",
//                 minLines: 6,
//                 onChanged: (value) {},
//                 controller: descriptionController,
//                 keyboardType: TextInputType.text,
//                 hintText: "Type something here...",
//                 validator: (value) {
//                   return null;
//                 },
//                 validateOnInputChange: true,
//                 showValidationIcons: true,
//               ),
//               const SizedBox(height: 16),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     "0/250 words",
//                     style: AppTextStyles.pop12Reg(color: MyAppColors.grey),
//                   )),
//               const SizedBox(
//                 height: 25,
//               ),
//               AppButton(buttonName: "Publish", onPress: () {})
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
