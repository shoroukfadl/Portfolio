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

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title.toUpperCase(),
          style: (titleStyle ?? AppTextStyles.extraBold40())
              .copyWith(color: colors.accent),
        ),
        Container(
          height: 2,
          width: 100,
          decoration: BoxDecoration(
              color:colors.accent,
              borderRadius: BorderRadius.circular(2)),
        ),
      ],
    );
  }
}
