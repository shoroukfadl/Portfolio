import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';

class SocialButtonWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? btnColor, borderColor, iconColor;
  final void Function() onPressed;

  final String title;
  const SocialButtonWidget({
    super.key,
    required this.icon,
    this.size = 14,
    this.btnColor,
    this.borderColor,
    required this.onPressed,
    this.iconColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      child: AnimatedCardWidget(
        paddingHoz: 8,
        paddingVert: 8,
        child:(h)=> Row(
          spacing: 8,
          children: [
            Card.filled(
              color: colors.accentSoft,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: iconColor ?? colors.accent,
                  size: size,
                ),
              ),
            ),
            Text(
              title,
              style: AppTextStyles.medium12(color: colors.text1),
            ),
            8.0.widthBox
          ],
        ),
      ),
    );
  }
}
