import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/facilities/quick_acces_card.dart';
import 'package:msub/features/home/widgets/notes_widgets.dart';
import 'package:msub/features/home/widgets/title_more.dart';

class Facilities extends StatefulWidget {
  const Facilities({super.key});

  @override
  State<Facilities> createState() => _FacilitiesState();
}

class _FacilitiesState extends State<Facilities> {
  final List<Map<String, String>> items = [
    {'title': 'Startup', 'image': AppImages.startup},
    {'title': 'Scholarship', 'image': AppImages.scholarship},
    {'title': 'Library', 'image': AppImages.library},
    {'title': 'Placements', 'image': AppImages.placements},
    {'title': 'Hostel', 'image': AppImages.hostel},
    {'title': 'Clinics', 'image': AppImages.clinics},
    {'title': 'Guidance', 'image': AppImages.guidance},
    {'title': 'Guidelines', 'image': AppImages.sports},
    {'title': 'Committees', 'image': AppImages.milestone},
    {'title': 'Institutions', 'image': AppImages.services},
    {'title': 'Internationals', 'image': AppImages.services},
    {'title': 'Admission', 'image': AppImages.services},
    {'title': 'Sports', 'image': AppImages.sports},
    {'title': 'Hostel', 'image': AppImages.services},
  ];
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
            // SvgPicture.asset(AppImages.bell),
            const SizedBox(
              width: 5,
            ),
            AppText(
              text: "Faculties",
              style: AppTextStyles.rob16Medium(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TitleMore(
              title: "Discover",
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        context.pushNamed(AppRouteNames.scholarship);
                      } else if (index == 2) {
                        context.pushNamed(AppRouteNames.libary);
                      }
                    },
                    child: Column(
                      children: [
                        // Image with a container and padding
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.065,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image.asset(
                            items[index]['image']!,
                            // height: 80,
                            // width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          child: AppText(
                              text: items[index]['title']!,
                              style: AppTextStyles.pop12Reg()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "Quick Services",
                style: AppTextStyles.rob16Medium(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 218,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const QuickAccessCard(),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: 5),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: NotesWidgets(
                          txt1: "10+",
                          txt2: "Library",
                        ),
                      ),
                      Expanded(
                        child: NotesWidgets(
                          selected: true,
                          txt1: "2+",
                          txt2: "Computer Labs",
                        ),
                      ),
                      Expanded(
                        child: NotesWidgets(
                          txt1: "2+",
                          txt2: "Lorium",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
