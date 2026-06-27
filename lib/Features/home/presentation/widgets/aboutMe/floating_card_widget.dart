import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Animation/floating_animation_card.dart';

class FloatingCards extends StatelessWidget {
  final AnimationController floatController;
  final List<AnimationController> cardControllers;
  final bool isMobile;

  const FloatingCards({
    super.key,
    required this.floatController,
    required this.cardControllers,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (context.isLarge) {
      return Stack(
        alignment: Alignment.center,
        children: cards(
            colors: colors,
            offset1: const Offset(-80, -40),
            offset2: const Offset(100, 60),
            offset3: const Offset(-20, 180)),
      );
    } else if (context.isMedium)
      return Row(
        children: cards(
            colors: colors,
            offset1: const Offset(0, -40),
            offset2: const Offset(10, -40),
            offset3: const Offset(20, -40)),
      );
    return Wrap(
      children: cards(
          colors: colors,
          offset1: const Offset(0, -40),
          offset2: const Offset(10, -40),
          offset3: const Offset(20, -20)),
    );
  }

  List<Widget> cards({
    required AppColors colors,
    required Offset offset1,
    required Offset offset2,
    required Offset offset3,
  }) =>
      [
        AnimatedCard(
          controller: cardControllers[0],
          title: '🎯 Focused',
          description: 'Pixel-perfect apps with attention to detail',
          color: colors.accent,
          position: offset1,
          rotation: 2,
        ),
        AnimatedCard(
          controller: cardControllers[1],
          title: '⚡ Fast',
          description: 'Optimized performance and smooth 60fps animations',
          color: colors.text1,
          position: offset2,
          rotation: -2,
        ),
        AnimatedCard(
          controller: cardControllers[2],
          title: '🚀 Modern',
          description: 'Latest Flutter patterns and best practices',
          color: colors.secondary,
          position: offset3,
          rotation: 0,
        ),
      ];
}
