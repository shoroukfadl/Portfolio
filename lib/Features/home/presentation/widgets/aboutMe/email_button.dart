import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Widgets/Animation/animations.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class EmailButton extends StatelessWidget {
  final String email;

  const EmailButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = context.matchedSize(
        large: largeButtonHeight,
        medium: mediumButtonHeight,
        small: smallButtonHeight);
    return HoverAnimatedWidget(
      moveUp: true,
      child: (hover) => CustomButtonWidget(
        padding: EdgeInsets.symmetric(horizontal: 16),
        onPressed: () async {
          final Uri emailUri = Uri(scheme: 'mailto', path: email);
          if (await canLaunchUrl(emailUri)) {
            await launchUrl(emailUri);
          }
        },
        borderColor: colors.secondary,
        btnColor: colors.secondary,
        borderRadiusValue: 100,
        height: height,
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get In Touch',
              style: AppTextStyles.buttonLabel(
                context: context,
                color: Colors.white,
              ),
            ),
            Icon(
              Portfolio.email,
              color: Colors.white,
              size: height / 2,
            ),
          ],
        ),
      ),
    );
  }
}
