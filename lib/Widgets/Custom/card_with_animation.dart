import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'interactive_widget.dart';

class ZoomOutAnimatedCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, hoverColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;

  const ZoomOutAnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.hoverColor,
    this.height,
    this.borderR,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child: (h) => AnimatedScale(
              scale: h ? 0.97 : 1,
              duration: Duration(milliseconds: 250),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderR ??
                      BorderRadius.all(
                        Radius.circular(border),
                      ),
                  boxShadow: [
                    if (h)
                      BoxShadow(
                          color: (hoverColor ?? colors.accentSoft)
                              .withValues(alpha: 0.28),
                          blurRadius: 10,
                          spreadRadius: 4)
                  ],
                  border: Border.all(
                    color: h
                        ? (hoverColor ?? colors.accentSoft)
                        : borderColor ?? colors.border,
                    width: h ? 0.4 : 0.1,
                  ),
                  color: (cardColor ?? colors.background),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHoz, vertical: paddingVert),
                child: child(h),
              ),
            ));
  }
}

class BorderHoverdCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, hoverColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const BorderHoverdCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.hoverColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child: (h) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(border),
                ),
                border: Border.all(
                  color: h
                      ? (hoverColor ?? colors.accentSoft)
                      : borderColor ?? colors.border,
                  width: h ? 0.4 : 0.1,
                ),
                color: h ? hoverColor : (cardColor ?? colors.background),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz, vertical: paddingVert),
              child: child(h),
            ));
  }
}

class ShadowHoverCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const ShadowHoverCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child: (h) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(border),
                ),
                border: Border.all(
                  color: borderColor ?? colors.border,
                  width: h ? 0.4 : 0.1,
                ),
                boxShadow: [
                  if (h)
                    BoxShadow(
                        offset: Offset(0, 4),
                        spreadRadius: 4,
                        blurRadius: 10,
                        color: colors.text1.withValues(alpha: 0.1))
                ],
                color: (cardColor ?? colors.background),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz, vertical: paddingVert),
              child: child(h),
            ));
  }
}
