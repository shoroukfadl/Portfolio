import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

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
        VerticalGradientDivider(
          height: 2,
          width: 32,
          begin: AlignmentGeometry.centerLeft,
          end: AlignmentGeometry.centerRight,
          color1: colors.accent,
          color2: colors.secondary,
          repation: 2,
        ),
        Text(
          title.toUpperCase(),
          style: AppTextStyles.sectionsTitle(
              context: context, color: colors.secondary),
        ),
      ],
    );
  }
}
