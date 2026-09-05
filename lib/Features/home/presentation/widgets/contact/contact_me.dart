import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me_title.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/soical_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../data/models/social_model.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({
    super.key,
    required this.linkedIN,
    required this.github,
    required this.email,
    required this.phoneNumber,
    required this.cv,
    this.iconSize = 20,
    this.padding = desktopHozPadding,
  });

  final String linkedIN;
  final String github;
  final String email;
  final String phoneNumber;
  final String cv;
  final double iconSize;
  final double padding;

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  List<SocialModel> _socialLinks(BuildContext context) => [
        SocialModel(
          title: 'Email',
          icon: Portfolio.email,
          onPressed: _sendEmail,
        ),
        SocialModel(
          title: 'WhatsApp',
          icon: Portfolio.phone,
          onPressed: () => HelperFunctions.openWhatsApp(
            phoneNumber: phoneNumber,
            message: 'Hi',
          ),
        ),
        SocialModel(
          title: 'LinkedIN',
          icon: Portfolio.linkedIn,
          onPressed: () => HelperFunctions.openUrl(linkedIN, context),
        ),
        SocialModel(
          title: 'Github',
          icon: Portfolio.github,
          onPressed: () => HelperFunctions.openUrl(github, context),
        ),
        SocialModel(
          title: 'Resume',
          icon: Portfolio.download,
          onPressed: () => HelperFunctions.openUrl(cv, context),
        ),
      ];

  List<Widget> _buildSocialButtons(BuildContext context) =>
      _socialLinks(context)
          .map((link) => SocialButtonWidget(
                title: link.title,
                icon: link.icon,
                size: iconSize,
                onPressed: link.onPressed,
              ))
          .toList();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
      large: maxWidth * 2 / 3,
      medium: maxWidth * 3.2 / 4,
      small: maxWidth,
    );

    return Column(
      spacing: 32,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCard(context, width),
        Text(
          '© ${DateTime.now().year} Shorouk Fadl. All rights reserved.',
          style: AppTextStyles.l2(context: context, color: colors.text1),
        ).paddingSymmetric(horizontal: padding),
      ],
    );
  }

  Widget _buildCard(BuildContext context, double width) {
    final colors = context.colors;
    final buttons = _buildSocialButtons(context);

    return Container(
      width: width,
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: padding / 2,
        vertical: 20,
      ),
      margin: EdgeInsetsGeometry.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: colors.secondarySoft,
        border: Border.all(color: colors.secondary, width: 0.2),
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: context.isLarge
          ? Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const ContactMeTitle().expand,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: buttons
                      .map((e) => CustomSlideAnimationWidget(
                            key: ValueKey('Button-${buttons.indexOf(e)}'),
                            index: buttons.indexOf(e),
                            child: e,
                          ))
                      .toList(),
                ),
              ],
            )
          : Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContactMeTitle(),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: buttons
                      .map((e) => CustomSlideAnimationWidget(
                            key: ValueKey('Button-${buttons.indexOf(e)}'),
                            index: buttons.indexOf(e),
                            child: e,
                          ))
                      .toList(),
                ),
              ],
            ),
    );
  }
}
