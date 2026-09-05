import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Core/Language/app_styles.dart';

class CustomTooltipWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomTooltipWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Tooltip(
      message: title,
      decoration: BoxDecoration(
          color: colors.text1, borderRadius: BorderRadius.circular(8)),
      textStyle: AppTextStyles.bc2(context: context, color: colors.background),
      child: child,
    );
  }
}
