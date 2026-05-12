import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/cv_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/email_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class SummaryContent extends StatelessWidget {
  final String firstName, lastName, role, summary, cv, email;
  final TextStyle? nameStyle, roleStyle, summaryStyle;
  const SummaryContent(
      {super.key,
      required this.firstName,
      required this.role,
      required this.summary,
      this.nameStyle,
      this.roleStyle,
      this.summaryStyle,
      required this.lastName,
      required this.cv,
      required this.email});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '━ ${Strings.helloIam.translate}',
          style: AppTextStyles.semiBold20(color: colors.accent),
        ),
        const SizedBox(height: 10),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colors.accent, colors.secondary],
          ).createShader(bounds),
          child: Text(
            '$firstName\n$lastName',
            style: AppTextStyles.extraBold56(color: colors.accent).copyWith(
              height: 1.1,
              letterSpacing: -2,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          role,
          style: AppTextStyles.semiBold24(color: colors.accent),
        ),
        const SizedBox(height: 20),
        Text(
          summary,
          style: AppTextStyles.regular16(color: colors.textPrimary).copyWith(
            height: 1.8,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          spacing: 16,
          children: [
            CvButton(
              cv: cv,
            ),
            EmailButton(email: email)
          ],
        ),
      ],
    );
  }
}
