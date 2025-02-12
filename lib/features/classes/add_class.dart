// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AddClass extends StatefulWidget {
//   const AddClass({super.key});

//   @override
//   State<AddClass> createState() => _AddClassState();
// }

// class _AddClassState extends State<AddClass> {
//   final List<String> items = [
//     "select-1",
//     "select-2",
//   ];
//   final List<String> _list = [
//     'Design Studio',
//     'Business Management',
//     'Middle Eastern',
//     'Lorium Ipsum',
//     'Lorium Ipsum',
//     'Lorium Ipsum',
//     'Lorium Ipsum',
//   ];
//   final List<Map<String, dynamic>> _list2 = [
//     {
//       "name": 'Building A',
//       "show": false,
//       'list': List.generate(8, (index) => 'Room ${200 + index}'),
//     },
//     {
//       "name": 'Building B',
//       "show": false,
//       'list': List.generate(5, (index) => 'Room ${300 + index}'),
//     },
//     {
//       "name": 'Building C',
//       "show": false,
//       'list': List.generate(6, (index) => 'Room ${400 + index}'),
//     },
//   ];

//   List<Map<dynamic, dynamic>> selectedList = [];
//   String? selectedItem;
//   Map? selectedItem2;

//   TextEditingController subCodeController = TextEditingController();
//   TextEditingController creditController = TextEditingController();

//   String? selectedValue;

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
//               text: "Upload Classes",
//               style: AppTextStyles.rob16Medium(color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppText(
//               text: "Subject Title",
//               style: AppTextStyles.pop12Reg(color: AppColors.grey),
//               fontWeight: FontWeight.w400,
//             ),
//             const SizedBox(height: 10),
//             CustomDropdown<String>.search(
//               expandedHeaderPadding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//               closedHeaderPadding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//               decoration: CustomDropdownDecoration(
//                   expandedBorderRadius:
//                       const BorderRadius.all(Radius.circular(15)),
//                   closedSuffixIcon:
//                       const Icon(Icons.keyboard_arrow_down_outlined, size: 16),
//                   listItemStyle: AppTextStyles.pop14Reg(),
//                   closedBorderRadius:
//                       const BorderRadius.all(Radius.circular(15)),
//                   headerStyle: AppTextStyles.pop14Reg(),
//                   searchFieldDecoration: SearchFieldDecoration(
//                     focusedBorder: InputBorder.none,
//                     prefixIcon: const Icon(
//                       Icons.search,
//                       size: 0,
//                     ),
//                     fillColor: Colors.transparent,
//                     hintStyle:
//                         AppTextStyles.pop14Reg(color: AppColors.inActiveText),
//                     border: InputBorder.none,
//                     suffixIcon: (onClear) {
//                       return const Icon(Icons.search);
//                     },
//                   ),
//                   hintStyle:
//                       AppTextStyles.pop15Reg(color: AppColors.inActiveText)),
//               hintText: 'Select',
//               items: _list,
//               initialItem: selectedItem,
//               overlayHeight: 342,
//               onChanged: (value) {
//                 setState(() {
//                   selectedItem = value;
//                 });
//               },
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             CommonDropdown(
//               isExpanded: true,
//               labelText: "Subject Type",
//               items: items,
//               hintText: "Select",
//               selectedValue: selectedValue,
//               onChanged: (value) {},
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomTextInput(
//                       labelText: "Subject Code",
//                       hintText: "e.g., BM101",
//                       controller: subCodeController,
//                       keyboardType: TextInputType.text),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: CustomTextInput(
//                       labelText: "Credit",
//                       hintText: "e.g., 4",
//                       controller: subCodeController,
//                       keyboardType: TextInputType.text),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CommonDropdown(
//                     isExpanded: true,
//                     labelText: "Semester",
//                     items: items,
//                     hintText: "Select",
//                     selectedValue: selectedValue,
//                     onChanged: (value) {},
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: CommonDropdown(
//                     isExpanded: true,
//                     labelText: "Division",
//                     items: items,
//                     hintText: "Select",
//                     selectedValue: selectedValue,
//                     onChanged: (value) {},
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             CommonDropdown(
//               isExpanded: true,
//               labelText: "Building Name",
//               items: items,
//               hintText: "Select",
//               selectedValue: selectedValue,
//               onChanged: (value) {},
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             CommonDropdown(
//               isExpanded: true,
//               labelText: "Faculty Name",
//               items: items,
//               hintText: "Select",
//               selectedValue: selectedValue,
//               onChanged: (value) {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
