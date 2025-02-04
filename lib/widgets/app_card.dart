import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final BoxBorder? border;
  final double? elevation;
  final Color? color;
  final Color? colorContainer;
  final double? padding;
  final EdgeInsetsGeometry? paddingAll;
  final double? borderRadius;
  final EdgeInsets? margin;
  const AppCard(
      {super.key,
      required this.child,
      this.border,
      this.elevation,
      this.color,
      this.colorContainer,
      this.padding,
      this.paddingAll,
      this.borderRadius,
      this.margin});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.black26,
      elevation: elevation ?? 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      margin: margin ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          border: border,
          color: colorContainer ?? Colors.white,
        ),
        padding: paddingAll ?? EdgeInsets.all(padding ?? 16),
        child: child,
      ),
    );
  }
}
