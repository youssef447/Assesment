import 'package:flutter/material.dart';

import '../../../core/style/app_colors.dart';


class GradiantContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin, padding;
  final double? width, height;
  final double radius;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final BoxConstraints? constraints;
  const GradiantContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderColor,
    this.width,
    this.height,
    required this.radius,
    this.boxShadow,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: borderColor == null
            ? null
            : Border.all(color: borderColor!, width: 0.4),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: AppColors.containerGradiant,
        ),
      ),
      child: child,
    );
  }
}
