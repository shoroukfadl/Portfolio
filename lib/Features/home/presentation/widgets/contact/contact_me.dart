import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me_title.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/soical_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class ContactMeWidget extends StatelessWidget {
  final String linkedIN, github, email, phoneNumber, cv;
  final double iconSize, padding;
  final TextStyle? copyRightStyle, contactMeStyle;

  const ContactMeWidget({
    super.key,
    required this.linkedIN,
    required this.github,
    required this.email,
    required this.phoneNumber,
    this.iconSize = 20,
    this.padding = desktopHozPadding,
    this.copyRightStyle,
    this.contactMeStyle,
    required this.cv,
  });

  List<Widget> contactList(BuildContext context) => [
        SocialButtonWidget(
          onPressed: () async {
            final Uri emailUri = Uri(scheme: 'mailto', path: email);
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            }
          },
          size: iconSize,
          title: 'Email',
          icon: Portfolio.email,
        ),
        SocialButtonWidget(
          onPressed: () {
            HelperFunctions.openWhatsApp(
                phoneNumber: phoneNumber, message: 'Hi');
          },
          size: iconSize,
          title: 'WhatsApp',
          icon: Portfolio.phone,
        ),
        SocialButtonWidget(
          onPressed: () {
            HelperFunctions.openUrl(linkedIN, context);
          },
          size: iconSize,
          icon: Portfolio.linkedIn,
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
            HelperFunctions.openUrl(cv, context);
          },
          size: iconSize,
          title: 'Resume',
          icon: Portfolio.download,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);
    return Column(
      spacing: 32,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: width,
            padding: EdgeInsetsGeometry.symmetric(
                horizontal: padding / 2, vertical: 20),
            margin: EdgeInsetsGeometry.symmetric(horizontal: padding),
            decoration: BoxDecoration(
                color: colors.secondarySoft,
                border: Border.all(color: colors.secondary, width: 0.2),
                borderRadius: BorderRadius.circular(cardRadius)),
            child: context.isLarge
                ? Row(
                    spacing: 32,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ContactMeTitle().expand,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: contactList(context),
                      )
                    ],
                  )
                : Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactMeTitle(),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ...contactList(context),
                        ],
                      )
                    ],
                  )),
        Text(
          '© 2026 Shorouk Fadl.All rights reserved.',
          style: AppTextStyles.l2(context: context, color: colors.text1),
        ).paddingSymmetric(horizontal: padding),
      ],
    );
  }
}
