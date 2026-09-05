import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final int index;

  const SectionsTitleWidget(
      {super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Text(
      title,
      style: AppTextStyles.h2(context: context, color: colors.text1),
    );
  }
}
