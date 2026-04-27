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
      children: [
        Text(
          title,
          style: (titleStyle ?? AppTextStyles.extraBold40())
              .copyWith(color: colors.accent),
        ),
        ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: [colors.accent, colors.secondary])
                    .createShader(bounds),
            child: Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
            )),
      ],
    );
  }
}
