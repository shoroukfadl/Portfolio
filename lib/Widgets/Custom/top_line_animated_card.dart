import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'interactive_widget.dart';

class TopLineCardWidget extends StatelessWidget {
  final Widget Function(bool hover) child;

  final double paddingHoz;
  final double paddingVert;
  final double border;

  final double? width;
  final double? height;

  const TopLineCardWidget({
    super.key,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.height,
    this.border = cardRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InteractiveCard(
      child: (hover) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,

          // Card movement
          transform: Matrix4.translationValues(
            0,
            hover ? -3 : 0,
            0,
          ),

          width: width,
          height: height,

          clipBehavior: Clip.antiAlias,

          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(border),
            border: Border.all(
              color: hover ? colors.accentSoft : colors.border,
              width: 0.4,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.text1.withValues(
                  alpha: hover ? 0.10 : 0,
                ),
                blurRadius: hover ? 16 : 0,
                spreadRadius: hover ? 0 : 0,
                offset: Offset(
                  0,
                  hover ? 8 : 0,
                ),
              ),
            ],
          ),

          child: Stack(
            children: [
              // ───────── Content ─────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz,
                  vertical: paddingVert,
                ),
                child: child(hover),
              ),

              // ───────── Top Accent ─────────
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: 0,
                    end: hover ? 1 : 0,
                  ),
                  duration: const Duration(
                    milliseconds: 350,
                  ),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        widthFactor: value,
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          height: 3,
                          decoration: BoxDecoration(
                            color: colors.accent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(border),
                              topRight: Radius.circular(border),
                            ),
                            boxShadow: [
                              if (value > 0.05)
                                BoxShadow(
                                  color: colors.accent.withValues(
                                    alpha: 0.35 * value,
                                  ),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
