import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/cv_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/email_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/projects_button.dart';
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
              firstName,
              style:nameStyle?? AppTextStyles.extraBold56(color: colors.accent),
            ),
            Text(
              lastName,
              style:nameStyle?? AppTextStyles.extraBoldM48(color: colors.text1).copyWith(
                fontStyle: FontStyle.italic
              )
            ),
            const SizedBox(height: 8),
            Text(
              summary,
              style:summaryStyle?? AppTextStyles.regular14(color: colors.text2).copyWith(
                height: 1.8,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              spacing: 16,
              children: [
                ProjectsButton(
                ),
                EmailButton(email: email)
              ],
            ),
          ],
        );

  }
}
