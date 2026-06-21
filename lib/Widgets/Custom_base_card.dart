import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class CustomBaseCard extends StatelessWidget {
  final Widget child;

  final double? height, width;
  final double? verticalPadding, horizontalPadding;
  final double? verticalMargin, horizontalMargin;
  final bool enableHeight;

  const CustomBaseCard(
      {super.key,
      this.enableHeight = true,
      required this.child,
      this.height,
      this.verticalPadding,
      this.horizontalPadding,
      this.verticalMargin,
      this.horizontalMargin,
      this.width});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: enableHeight ? height ?? 881 : null,
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 128, vertical: verticalMargin ?? 86),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 100,
          vertical: verticalPadding ?? 105),
      decoration: BoxDecoration(
          color: colors.background,
          /*border: Border.all(
          color: colors.textSecondary
        ),*/
          borderRadius: BorderRadius.circular(8),
          boxShadow: [defaultBoxShadow]),
      child: child,
    );
  }
}
