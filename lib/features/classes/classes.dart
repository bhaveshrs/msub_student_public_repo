import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/app_textfild.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/classes/widgets/class_name.dart';


class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 19.0),
            child: CustomTextInput(
              radius: 36, contentPadValue: 15, maxLines: 1,
              prefixIcon: const Icon(Icons.search),
              // SvgPicture.asset(
              //   AppImages.search,
              // ),
              hintText: "Search",
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return const ClassAddedDialog();
                        //   },
                        // );
                        context.pushNamed(AppRouteNames.classDetailsRoute);
                      },
                      child: const ClassName());
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
