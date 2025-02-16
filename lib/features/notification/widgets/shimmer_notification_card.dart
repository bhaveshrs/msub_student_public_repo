import 'package:flutter/material.dart';
import 'package:msub/config/common_widgets/shimmer_box.dart';

class ShimmerNotificationCard extends StatelessWidget {
  const ShimmerNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
      child: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 17, right: 17),
                    padding: const EdgeInsets.only(top: 17, right: 17),
                    // decoration: const BoxDecoration(),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(
                          height: 20,
                          width: 5,
                          borderRadius: BorderRadius.zero,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ShimmerBox(
                            height: 20,
                            width: double.infinity,
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        SizedBox(width: 15),
                        ShimmerBox(
                          height: 14,
                          width: 14,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        SizedBox(width: 5),
                        ShimmerBox(
                          height: 14,
                          width: 60,
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0) +
                        const EdgeInsets.only(bottom: 17),
                    child: const ShimmerBox(
                      height: 50,
                      width: double.infinity,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ShimmerBox(
                          height: 14,
                          width: 40,
                          borderRadius: BorderRadius.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
