import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';

class AnimatedCard extends StatelessWidget {
  final AnimationController controller;
  final String title;
  final String description;
  final Color color;
  final Offset position;
  final double rotation;

  const AnimatedCard({
    required this.title,
    required this.description,
    required this.color,
    required this.position,
    required this.rotation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.matchedSize(
        large: largeCardWidth, medium: mediumCardWidth, small: smallCardWidth);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final floatOffset = Offset(0, sin(controller.value * 6.28) * 25);

        return Transform.translate(
          offset: position + floatOffset,
          child: Transform.rotate(
            angle: rotation * 0.0175,
            child: Container(
              width: size,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: color.withValues(alpha: 0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
                color: color.withValues(alpha: 0.05),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        color,
                        color.withValues(alpha: 0.4),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      title,
                      style: AppTextStyles.titleCard(
                        context: context,
                        color: color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.titleCardSmall(
                      context: context,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
