import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/soical_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class ContactMeWidget extends StatelessWidget {
  final String linkedIN, github, email, phoneNumber;
  final double iconSize ,padding;
  final TextStyle? copyRightStyle , contactMeStyle;
  const ContactMeWidget({
    super.key,
    required this.linkedIN,
    required this.github,
    required this.email,
    required this.phoneNumber,
    this.iconSize=20,
    this.padding = Constants.desktopHozPadding,
    this.copyRightStyle, this.contactMeStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.contactMe,
          title: Strings.contactMe.translate,
          titleStyle: contactMeStyle,
        ),
        16.0.heightBox,
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
              size: iconSize,
              title: 'Email',
              icon: Icons.email,
            ),
            SocialButtonWidget(
              onPressed: () {
                HelperFunctions.openUrl(linkedIN, context);
              },
              size: iconSize,
              icon: Portfolio.linkedIn,
              iconColor: colors.accent,
              title: 'LinkedIN',
            ),
            SocialButtonWidget(
              onPressed: () {
                HelperFunctions.openUrl(github, context);
              },
              title: 'Git Hub',
              size: iconSize,
              icon: Portfolio.github,
            ),
            SocialButtonWidget(
              onPressed: () {
                HelperFunctions.openWhatsApp(phoneNumber: phoneNumber, message: 'Hi');
              },
              size: iconSize,
              title: 'WhatsApp',
              icon: Portfolio.phone,
            ),
          ],
        ),
        Text(
          '© 2026 Shorouk Fadl. Built with Flutter. All rights reserved.',
          style: copyRightStyle?? AppTextStyles.medium14(color: colors.text1),
        ),
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
