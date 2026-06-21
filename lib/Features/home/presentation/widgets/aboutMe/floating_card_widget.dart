import 'package:flutter/material.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedCard(
          controller: cardControllers[0],
          title: '🎯 Focused',
          description: 'Pixel-perfect apps with attention to detail',
          color: colors.secondary,
          position: const Offset(-50, -20),
          rotation: 2,
        ),
        AnimatedCard(
          controller: cardControllers[1],
          title: '⚡ Fast',
          description: 'Optimized performance and smooth 60fps animations',
          color: colors.accent,
          position: const Offset(40, 40),
          rotation: -2,
        ),
        AnimatedCard(
          controller: cardControllers[2],
          title: '🚀 Modern',
          description: 'Latest Flutter patterns and best practices',
          color: colors.text2,
          position: const Offset(-20, 120),
          rotation: 0,
        ),
      ],
    );
  }
}
