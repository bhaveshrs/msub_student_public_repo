import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/dashboard/home/controller/search_view_controller.dart';

import '../../../../common/utils/assets.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  SearchViewController controller = Get.put(SearchViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.headerBgImg),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              // Search Bar
              const SizedBox(height: 44),
              // Search History
              const Text(
                "Search History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ).paddingOnly(left: 16),
              const SizedBox(height: 8),
              Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.history, color: Colors.grey),
                    title: Text("Academic Calendar"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history, color: Colors.grey),
                    title: Text("Exam Timetable"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history, color: Colors.grey),
                    title: Text("Assignment"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history, color: Colors.grey),
                    title: Text("Help & Support"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Handle view more
                      },
                      child: const Text("View More"),
                    ),
                  ),
                ],
              ),
              // FAQ Section
              const SizedBox(height: 24),
              const Text(
                "FAQ's",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ).paddingOnly(left: 16),
              const SizedBox(height: 8),
              const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.grey),
                    title: Text("How to change the password?"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.grey),
                    title: Text("How to report an issue?"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.grey),
                    title: Text("How to change the password?"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.grey),
                    title: Text("How to change the password?"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: Get.height * 0.095,
            left: Get.width * 0.07,
            right: Get.width * 0.07,
            child: Center(
              child: Container(
                width: Get.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => SearchView(),
                        transition: Transition.zoom, // Optional: Use default GetX transitions
                        duration: const Duration(milliseconds: 500), // Customize duration
                        curve: Curves.easeInOut, // Add a custom curve
                      );
                    },
                    child: TextField(
                      enabled: true,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          Assets.searchIcon,
                          height: 16,
                          width: 16,
                        ).paddingAll(14),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
