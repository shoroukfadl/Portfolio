import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/email_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/projects_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

import '../../../../../Widgets/Portfilio/stat_widget.dart';

class SummaryContent extends StatelessWidget {
  final String firstName, lastName, role, summary, cv, email;
  final double projectNumber, experince;

  const SummaryContent({
    super.key,
    required this.firstName,
    required this.role,
    required this.summary,
    required this.lastName,
    required this.cv,
    required this.email,
    required this.experince,
    required this.projectNumber,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Role
        Row(
          spacing: 4,
          children: [
            SizedBox(
                width: 20,
                child: DividerWidget(
                  thickness: 2,
                  color: colors.accent,
                )),
            Text(role.toUpperCase(),
                style: AppTextStyles.subtitleCard(
                        context: context, color: colors.accent)
                    .copyWith(letterSpacing: 1.3)),
          ],
        ),
        8.0.heightBox,
        Text(
          "$firstName $lastName",
          style: AppTextStyles.summaryTitle(
              context: context, color: colors.secondary),
        ),

        const SizedBox(height: 8),
        Text(
          summary,
          style: AppTextStyles.body(context: context, color: colors.text2),
        ),
        const SizedBox(height: 24),
        Row(
          spacing: 16,
          children: [EmailButton(email: email), ProjectsButton()],
        ),

        const SizedBox(height: 24),
        DividerWidget(
          thickness: 0.4,
        ),
        const SizedBox(height: 16),

        StatsRow(
          numStyle: AppTextStyles.summaryNumberLarge(context: context),
          titleStyle: AppTextStyles.summaryNumberMedium(context: context),
          items: [
            Stat(
              value: experince,
              subTitle: "+",
              name: 'YEARS SHIPPING',
            ),
            Stat(
              value: projectNumber,
              name: 'PRODUCTION APPS',
            ),
            const Stat(
              value: 3,
              name: 'PLATFORMS',
            ),
          ],
        )
      ],
    );
  }
}
