import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;

  const SectionsTitleWidget({super.key, required this.title, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 16,
      children: [
        Text(
          title.toUpperCase(),
          style: (titleStyle ?? AppTextStyles.medium20())
              .copyWith(color: colors.accent),
        ),
        Container(
          height: 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
              color: colors.accent, borderRadius: BorderRadius.circular(2)),
        ).expand,
      ],
    );
  }
}
