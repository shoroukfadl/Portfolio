import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/soical_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class ContactMeWidget extends StatelessWidget {
  final String linkedIN, github, email, phoneNumber;
  const ContactMeWidget({
    super.key,
    required this.linkedIN,
    required this.github,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: colors.border)),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      height: 200,
      child: Column(
        spacing: 16,
        children: [
          Text(
            Strings.contactMe.translate,
            style: AppTextStyles.medium28(color: colors.accent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              SocialButtonWidget(
                onPressed: () async {
                  final Uri emailUri = Uri(scheme: 'mailto', path: email);
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  }
                },
                btnColor: colors.background,
                borderColor: colors.accent,
                size: 20,
                icon: Portfolio.email,
                iconColor: colors.accent,
              ),
              SocialButtonWidget(
                onPressed: () {
                  HelperFunctions.openUrl(linkedIN, context);
                },
                btnColor: colors.background,
                borderColor: colors.accent,
                size: 20,
                icon: Portfolio.linkedIn,
                iconColor: colors.accent,
              ),
              SocialButtonWidget(
                onPressed: () {
                  HelperFunctions.openUrl(github, context);
                },
                btnColor: colors.background,
                borderColor: colors.accent,
                size: 20,
                icon: Portfolio.github,
                iconColor: colors.accent,
              ),
              SocialButtonWidget(
                onPressed: () {
                  HelperFunctions.openWhatsApp(phoneNumber: phoneNumber, message: 'Hi');
                },
                btnColor: colors.background,
                borderColor: colors.accent,
                size: 20,
                icon: Portfolio.phone,
                iconColor: colors.accent,
              ),
            ],
          ),
          Text(
            '© 2026 Shorouk Fadl. Built with Flutter. All rights reserved.',
            style: AppTextStyles.medium16(color: colors.textPrimary),
          ),
        ],
      ),
    );
  }
}
