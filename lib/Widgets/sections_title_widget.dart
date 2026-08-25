import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final int index;

  const SectionsTitleWidget(
      {super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '0${index}',
          style: AppTextStyles.sectionsSubTitle(
              context: context, color: colors.secondary),
        ),
        Text(
          title,
          style: AppTextStyles.sectionsTitle(
              context: context, color: colors.text1),
        ),
        DividerWidget(
          thickness: 0.5,
          color: colors.text3,
        ).expand,
      ],
    );
  }
}
