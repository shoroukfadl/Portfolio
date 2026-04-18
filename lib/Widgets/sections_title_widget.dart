import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';
import '../Utilities/Constants/strings.dart';

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

    return RichText(
      key: key,
      text: TextSpan(
          text: enableMy ? Strings.my.translate : "",
          style: (myStyle ?? AppTextStyles.extraBold40())
              .copyWith(color: colors.textPrimary),
          children: [
            TextSpan(
              text: " $title",
              style: (titleStyle ?? AppTextStyles.extraBold40())
                  .copyWith(color: colors.accent),
            ),
          ]),
    );
  }
}
