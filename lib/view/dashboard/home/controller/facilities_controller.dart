import 'package:get/get.dart';
import 'package:msub/common/utils/assets.dart';

class FacilitiesController extends GetxController{
  final List<Map<String, String>> items = [
    {'title': 'Startup', 'image': Assets.s1},
    {'title': 'Scholarship', 'image': Assets.s2},
    {'title': 'Library', 'image': Assets.s3},
    {'title': 'Placements', 'image': Assets.s4},
    {'title': 'Hostel', 'image': Assets.s5},
    {'title': 'Clinics', 'image': Assets.s6},
    {'title': 'Guidance', 'image': Assets.s7},
    {'title': 'Guidelines', 'image': Assets.s8},
    {'title': 'Committees', 'image': Assets.s9},

    {'title': 'Institutions', 'image': Assets.servicesIcon},
    {'title': 'Internationals', 'image': Assets.servicesIcon},
    {'title': 'Admission', 'image': Assets.servicesIcon},
    {'title': 'Sports', 'image': Assets.s8},
    {'title': 'Hostel', 'image': Assets.servicesIcon},

  ];
  var showAll = false.obs;
}