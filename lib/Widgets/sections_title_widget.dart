import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? myStyle, titleStyle;

  const SectionsTitleWidget(
      {super.key,
      required this.title,
      this.myStyle,
      this.titleStyle, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 24,
      children: [
        Text(
          title,
          style: (titleStyle ?? AppTextStyles.medium16())
              .copyWith(color: colors.text1),
        ),
        const DividerWidget().expand,
        if(subtitle !=null)
          CardWithText(
           text:  subtitle!,
            textColor: colors.accent,
            color: colors.accent.withValues(alpha: 0.2),
            borderColor: colors.accent,
            style: (titleStyle ?? AppTextStyles.medium10())
                .copyWith(color: colors.accent),
          ),
      ],
    );
  }
}
