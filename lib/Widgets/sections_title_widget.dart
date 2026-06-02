import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final bool enableMy;
  final TextStyle? myStyle, titleStyle;

  const SectionsTitleWidget(
      {super.key,
      this.enableMy = true,
      required this.title,
      this.myStyle,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Text(
      title,
      style: (titleStyle ?? AppTextStyles.extraBold32())
          .copyWith(color: colors.accent25),
    );
  }
}
