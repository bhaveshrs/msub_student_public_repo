import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';
import 'package:msub/view/dashboard/home/controller/facilities_controller.dart';
import 'package:msub/widgets/custom_text.dart';
import 'package:msub/widgets/size_space.dart';

import '../../../../common/utils/app_colors.dart';
import 'home_view.dart';

class LibraryDetailsView extends StatelessWidget {
  LibraryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.servicesIcon,
                          height: 35,
                          width: 35,
                        ),
                        const Width(width: 5),
                        const CustomText(
                          "Library Services",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              ),
              const Height(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      height: 200,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://thumbs.dreamstime.com/b/old-books-wooden-table-library-vintage-style-ai-generated-content-design-background-instagram-facebook-wall-323974717.jpg',
                              // Replace with your image URL
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                width: 80,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20), // Rounded corners
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColors.green,
                                      size: 12,
                                    ),
                                    Text(
                                      "  Open",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    // Details Section
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shrimati Hansa Mehta',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.circle_outlined, color: Colors.green, size: 12),
                              SizedBox(width: 4),
                              CustomText('8:00 AM – 8:00 PM', color: AppColors.black),
                              Spacer(),
                              Icon(Icons.calendar_today, color: AppColors.black, size: 18),
                              SizedBox(width: 4),
                              Text('Monday – Saturday'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppColors.black, size: 18),
                              SizedBox(width: 4),
                              CustomText('Near Lorium Ipsum', color: AppColors.black),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    // Accordion Section
                    AccordionList(),
                  ],
                ),
              ).paddingSymmetric(horizontal: 16)
            ],
          ),
        ),
      ),
    );
  }
}

class AccordionList extends StatelessWidget {
  final List<Map<String, String>> accordionItems = [
    {
      "title": "Introduction",
      "content":
          "Established in 1950, the Shrimati Hansa Mehta Library is the central hub of academic resources at M.S. University of Baroda. With over 8 lakh books, journals, and digital resources, it serves students, faculty, and researchers."
    },
    {
      "title": "Key Features",
      "content":
          "• Extensive collection of books, journals, and digital repositories.\n• Spacious reading rooms and seminar halls.\n• Global Information Center for reference materials."
    },
    {
      "title": "Facilities",
      "content": "•Reading Rooms • Seminar Halls • Seminar Halls • Seminar Halls • Dedicated Study Areas • Global Information Center"
    },
    {"title": "Membership & Borrowing", "content": "Rules for membership and borrowing books."},
    {"title": "Contact Information", "content": "Phone, email, and address details."},
    {"title": "Rules & Regulations", "content": "Library rules and conduct guidelines."},
    {"title": "Registration", "content": "How to register and start using the library."},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: accordionItems
            .map(
              (item) => AccordionItem(
                title: item["title"]!,
                content: item["content"]!,
              ),
            )
            .toList(),
      ),
    );
  }
}

class AccordionItem extends StatefulWidget {
  final String title;
  final String content;

  const AccordionItem({required this.title, required this.content});

  @override
  _AccordionItemState createState() => _AccordionItemState();
}

class _AccordionItemState extends State<AccordionItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title, style: const TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w400)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(widget.content, textAlign: TextAlign.start, style: const TextStyle(color: AppColors.black)),
        ),
      ],
    );
  }
}
