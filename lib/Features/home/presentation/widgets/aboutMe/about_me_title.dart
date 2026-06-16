import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/email_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/projects_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

class SummaryContent extends StatelessWidget {
  final String firstName, lastName, role, summary, cv, email;
  const SummaryContent(
      {super.key,
      required this.firstName,
      required this.role,
      required this.summary,
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

        /// Role
        Row(
          spacing: 4,
          children: [
            SizedBox(width: 20,child: DividerWidget(thickness: 2,color: colors.secondary,)),
            Text(role.toUpperCase(),
                style:
                AppTextStyles.subtitleCard(context:context,color: colors.secondary).copyWith(
                  letterSpacing: 1.3
                )),
          ],
        ),
        20.0.heightBox,
        Text(
          "$firstName $lastName",
          style:  AppTextStyles.summaryTitle(context:context,color: colors.accent),
        ),

        const SizedBox(height: 8),
        Text(
          summary,
          style:
              AppTextStyles.body(context:context,color: colors.text2),
        ),
        const SizedBox(height: 40),
        EmailButton(email: email),
      ],
    );
  }
}
