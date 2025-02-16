import 'package:flutter/material.dart';
import 'package:msub/features/announcement/widgets/announcement_card.dart';

class AllAnnouncement extends StatelessWidget {
  final String role;
  const AllAnnouncement({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return AnnouncementCard(
              text:
                  "Lorem ipsum dolor sit amet consectetur. At arcu sit sagittis...",
              role: role,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: 20),
    );
  }
}
