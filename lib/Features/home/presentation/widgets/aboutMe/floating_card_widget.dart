import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Models/user_data_model.dart';

import '../../../../../Utilities/extensions.dart';

class FloatingCards extends StatelessWidget {
  final AnimationController floatController;
  final List<AnimationController> cardControllers;
  final bool isMobile;
  final EductionModel eduction;

  const FloatingCards({super.key,
    required this.floatController,
    required this.cardControllers,
    required this.isMobile, required this.eduction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      alignment: Alignment.center,
      children: [
        _AnimatedCard(
          controller: cardControllers[0],
          title: '🎯 Focused',
          description: 'Pixel-perfect apps with attention to detail',
          color:colors.accent,
          position: const Offset(-50, -80),
          rotation: 2,
        ),
        _AnimatedCard(
          controller: cardControllers[1],
          title: '⚡ Fast',
          description: 'Optimized performance and smooth 60fps animations',
          color:colors.secondary,
          position: const Offset(80, 60),
          rotation: -2,
        ),
        _AnimatedCard(
          controller: cardControllers[2],
          title: '🚀 Modern',
          description: 'Latest Flutter patterns and best practices',
          color: colors.border,
          position: const Offset(-30, 120),
          rotation: 0,
        ),
      ],
    );
  }
}

class _AnimatedCard extends StatelessWidget {
  final AnimationController controller;
  final String title;
  final String description;
  final Color color;
  final Offset position;
  final double rotation;

  const _AnimatedCard({
    required this.title,
    required this.description,
    required this.color,
    required this.position,
    required this.rotation, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final floatOffset = Offset(0, sin(controller.value * 6.28) * 25);

        return Transform.translate(
          offset: position + floatOffset,
          child: Transform.rotate(
            angle: rotation * 0.0175,
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: color.withValues(alpha: 0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha:0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
                //backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                color: color.withValues(alpha:0.08),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        color,
                        const Color(0xFF00d9ff),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      title,
                      style: AppTextStyles.semiBold16(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.regular12(
                      color: Colors.white.withValues(alpha:0.7),
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