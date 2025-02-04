import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/assets.dart';

class HomeController extends GetxController {
  var userName = "Abhay Govind".obs;

  final RxList<Color> lineColors = <Color>[].obs;

  final List<Color> colorPalette = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
  ];

  final List<Map<String, String>> items = [
    {'title': 'Academic', 'image': Assets.academicIcon},
    {'title': 'Exam', 'image': Assets.examIcon},
    {'title': 'Events', 'image': Assets.eventIcon},
    {'title': 'Sports', 'image': Assets.sportsIcon},
    {'title': 'Placements', 'image': Assets.placementsIcon},
    {'title': 'Milestone', 'image': Assets.milestoneIcon},
    {'title': 'Assignments', 'image': Assets.assignmentsIcon},
    {'title': 'Faculties', 'image': Assets.servicesIcon},
    {'title': 'Services', 'image': Assets.servicesIcon},

  ];
  var showAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeColors();
    _startColorAnimation();
  }

  void _initializeColors() {
    lineColors.addAll(List.generate(10, (index) => colorPalette[index % colorPalette.length]));
  }

  void _startColorAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      for (int i = 0; i < lineColors.length; i++) {
        lineColors[i] = colorPalette[(i + timer.tick) % colorPalette.length];
      }
    });
  }
}
