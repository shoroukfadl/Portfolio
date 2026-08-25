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
      borderRadius: BorderRadius.circular(8),
      child: ZoomOutAnimatedCardWidget(
        paddingHoz: 4,
        paddingVert: 4,
        cardColor: colors.background,
        borderColor: iconColor ?? colors.text3,
        border: 8,
        child: (h) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size * 1.5,
              height: size * 1.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor ?? colors.accent,
                  size: size,
                ),
              ),
            ),
            4.0.widthBox,
            Text(
              title,
              style: AppTextStyles.titleCardSmall(
                  context: context, color: colors.accent),
            ),
            4.0.widthBox,
          ],
        ),
      ),
    );
  }
}
