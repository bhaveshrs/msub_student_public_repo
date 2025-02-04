import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';

class SchedulesWidget extends StatelessWidget {
  const SchedulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Republic Day",
            style:TextStyle(fontSize: 14,color: AppColors.purple,fontWeight: FontWeight.w600),
          ),
          // ),
          Text(
            "09 - 01 PM",
            style: TextStyle(fontSize: 12,),
          ),
        ],
      )
      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Text(
      //             "Republic Day",
      //             style:TextStyle(fontSize: 12,color: AppColors.purple),
      //           ),
      //         ),
      //         Text(
      //           "09 - 01 PM",
      //           style: TextStyle(fontSize: 12,),
      //         ),
      //       ],
      //     ),
      //     Text(
      //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur ",
      //       style:  TextStyle(fontSize: 11,),
      //     )
      //   ],
      // ),

    );
  }
}
