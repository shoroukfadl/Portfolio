import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/role.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/Summary/number_card_item.dart';

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
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),

        /// Role
        RoleWidget(
          location: location,
          role: role,
        ),
        8.0.heightBox,
        Text(
          firstName,
          style: AppTextStyles.h1(context: context, color: colors.text1),
        ),
        Text(
          lastName,
          style: AppTextStyles.h1(context: context, color: colors.secondary),
        ),

        const SizedBox(height: 24),
        SizedBox(
            width: width,
            child: Text(
              summary,
              style: AppTextStyles.b1(context: context, color: colors.text2),
            )),

        const SizedBox(height: 40),

        SizedBox(
          width: context.isLarge
              ? (MediaQuery.sizeOf(context).width * 1 / 2)
              : context.isMedium
                  ? (MediaQuery.sizeOf(context).width * 2 / 3)
                  : null,
          child: StatsRow(
            numStyle: AppTextStyles.h3(context: context, color: colors.accent),
            titleStyle: AppTextStyles.h5(context: context, color: colors.text3),
            items: [
              Stat(
                  value: experince,
                  name: 'YEARS SHIPPING',
                  hasDigit: true,
                  sign: '+'),
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
        )
      ],
    );
  }
}
