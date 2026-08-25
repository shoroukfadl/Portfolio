import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Animation/floating_animation_card.dart';

class FloatingCards extends StatelessWidget {
  const FloatingCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 140,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.text3, width: 0.5),
      ),
      child: Row(
          spacing: 32,
          children: cards(
            colors: colors,
          )),
    );
  }

  List<Widget> cards({
    required AppColors colors,
  }) =>
      [
        AnimatedCard(
          title: 'Focused',
          description: 'Pixel-perfect apps with attention to detail',
          iconColor: colors.accent,
          icon: Icons.check,
        ).expand,
        AnimatedCard(
          title: 'Fast',
          description: 'Optimized performance and smooth 60fps animations',
          iconColor: colors.warning,
          icon: Icons.flash_on_outlined,
        ).expand,
        AnimatedCard(
          title: 'Modern',
          description: 'Latest Flutter patterns and best practices',
          iconColor: colors.secondary,
          icon: Icons.rocket_launch_outlined,
        ).expand,
      ];
}
