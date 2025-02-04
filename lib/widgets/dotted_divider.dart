import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const DottedDivider({
    super.key,
    this.height = 0.5,
    this.dashWidth = 5,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        (MediaQuery.of(context).size.width / (1.5 * dashWidth)).floor(),
        (index) => Expanded(
          child: Container(
            height: height,
            color: index % 2 == 0 ? color : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
