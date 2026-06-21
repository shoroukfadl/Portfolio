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
      child: ZoomOutAnimatedCardWidget(
        paddingHoz: 4,
        paddingVert: 4,
        borderColor: iconColor ?? colors.secondary,
        border: 100,
        child: (h) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size * 1.5,
              height: size * 1.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor ?? colors.secondary,
                  size: size,
                ),
              ),
            ),
            4.0.widthBox,
            Text(
              title,
              style: AppTextStyles.titleCardSmall(
                  context: context, color: colors.secondary),
            ),
            4.0.widthBox,
          ],
        ),
      ),
    );
  }
}
