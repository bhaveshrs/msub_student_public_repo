

import 'package:flutter/material.dart';
import 'package:msub/common/utils/app_colors.dart';

// class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final String subtitle;
//   final double toolbarHeight;
//
//   const CommonAppbar({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     this.toolbarHeight = 80,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // automaticallyImplyLeading:true,
//       centerTitle: true,
//       leading: IconButton(
//         icon: const Icon(
//           Icons.arrow_back,
//           color: AppColors.black,
//           size: 25,
//         ),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       toolbarHeight: toolbarHeight,
//       backgroundColor:  AppColors.white,
//
//       elevation: 0,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(0),
//           bottomRight: Radius.circular(0),
//         ),
//       ),
//       flexibleSpace: Stack(
//         children: [
//           // Background image
//           // Positioned.fill(
//           //   child: Image.asset(
//           //     AppImages.introAppbarImage, // Change this to your background image path
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           // AppBar contents
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontFamily: 'Roboto',
//                     letterSpacing: 0.5,
//                     fontWeight: FontWeight.w500,
//                     color:  AppColors.black,
//
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(toolbarHeight);
// }