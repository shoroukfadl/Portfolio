import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

import '../../../../../Widgets/Portfilio/stat_widget.dart';

class SummaryContent extends StatelessWidget {
  final String firstName, lastName, location, role, summary, cv, email;
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
    required this.location,
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
            Text(role.toUpperCase() + '. ${location.toUpperCase()}',
                style: AppTextStyles.subtitleCard(
                        context: context, color: colors.secondary)
                    .copyWith(letterSpacing: 1.3)),
          ],
        ),
        8.0.heightBox,
        Text(
          "$firstName $lastName",
          style:
              AppTextStyles.summaryTitle(context: context, color: colors.text1),
        ),

        const SizedBox(height: 8),
        Text(
          summary,
          style: AppTextStyles.body(context: context, color: colors.text2),
        ),

        const SizedBox(height: 32),

        StatsRow(
          numStyle: AppTextStyles.summaryNumberLarge(
              context: context, color: colors.text1),
          titleStyle: AppTextStyles.summaryNumberMedium(
              context: context, color: colors.text2),
          items: [
            Stat(
              value: experince,
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
        ),
      ],
    );
  }
}
