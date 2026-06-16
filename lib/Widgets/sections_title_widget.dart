import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;

  const SectionsTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 16,
      children: [
        Container(
          height: 0.5,
          width: 48,
          decoration: BoxDecoration(
              color: colors.accent, borderRadius: BorderRadius.circular(2)),
        ),
        Text(
          title.toUpperCase(),
          style:  AppTextStyles.sectionsTitle(context:context,color: colors.text2),
        ),
      ],
    );
  }
}
