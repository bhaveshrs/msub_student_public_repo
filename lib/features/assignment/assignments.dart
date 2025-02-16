import 'package:flutter/material.dart';
import 'package:msub/features/assignment/widgets/assignment_tile.dart';

class Assignments extends StatelessWidget {
  const Assignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0) +
          const EdgeInsets.only(
            top: 14,
          ),
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemBuilder: (context, index) {
          return const AssignmentTile();
        },
      ),
    );
  }
}
