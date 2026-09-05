import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'interactive_widget.dart';

class AnimatedGlowWidget extends StatelessWidget {
  final Color? cardColor, borderColor;
  final Widget Function(bool) child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;
  final bool hover;

  const AnimatedGlowWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    this.hover = false,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.height,
    this.borderR,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(child: (hover) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        height: height,
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(
          0,
          hover ? -3 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: cardColor ?? colors.background,
          borderRadius: borderR ?? BorderRadius.circular(border),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: colors.accent.withValues(alpha: 0.12),
                    blurRadius: 18,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
          border: Border.all(
            color: hover ? colors.accent : borderColor ?? colors.border,
            width: 0.5,
          ),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: paddingHoz, vertical: paddingVert),
        child: child(hover),
      );
    });
  }
}
