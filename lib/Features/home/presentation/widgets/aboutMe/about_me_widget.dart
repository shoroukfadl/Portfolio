import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/strings.dart';
import 'about_me_title.dart';

class AboutMeWidget extends StatelessWidget {
  final String name, role, desc;
  final TextStyle? titleStyle, roleStyle, descStyle;
  final double? imageSize;

  const AboutMeWidget(
      {super.key,
      required this.name,
      this.titleStyle,
      this.descStyle,
      this.imageSize,
      required this.role,
      required this.desc,
      this.roleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const TitleWidget(), 32.0.widthBox, _aboutMeWidget(context)],
    ).paddingSymmetric(horizontal: 32, vertical: 40);
  }

  Widget _aboutMeWidget(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.helloIam.translate,
              style: (titleStyle ?? AppTextStyles.headingXL())
                  .copyWith(color: colors.accentCyan),
            ),
            Text(
              name,
              style: (titleStyle ?? AppTextStyles.headingXL())
                  .copyWith(color: colors.accent),
            ),
          ],
        ),
        Text(
          role,
          style: (roleStyle ?? AppTextStyles.headingL())
              .copyWith(color: colors.accentCyan),
        ),
        Text(
          desc,
          style: (descStyle ?? AppTextStyles.bodyM())
              .copyWith(color: colors.accentPurple),
        ),
      ],
    );
  }
}
