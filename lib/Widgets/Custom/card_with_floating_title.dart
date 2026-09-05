import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'interactive_widget.dart';

class CardWidget extends StatelessWidget {
  final Color? cardColor, borderColor;
  final Widget child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;
  final bool hover;

  const CardWidget({
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: width,
      height: height,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: cardColor ?? colors.background,
        borderRadius: borderR ?? BorderRadius.circular(border),
        border: Border.all(
          color: hover ? colors.accent : borderColor ?? colors.border,
          width: 0.5,
        ),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: paddingHoz, vertical: paddingVert),
      child: child,
    );
  }
}

class CardWithTitle extends StatefulWidget {
  final Color? cardColor, borderColor;
  final Widget child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;

  const CardWithTitle({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 8,
    this.paddingVert = 8,
    this.border = cardRadius,
    this.borderR,
    this.width,
    this.height,
  });

  @override
  State<CardWithTitle> createState() => _CardWithTitleState();
}

class _CardWithTitleState extends State<CardWithTitle> {
  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
      child: (hover) => AnimatedScale(
        scale: hover ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: CardWidget(
          hover: hover,
          borderColor: widget.borderColor,
          borderR: widget.borderR,
          border: widget.border,
          cardColor: widget.cardColor,
          paddingHoz: widget.paddingHoz,
          paddingVert: widget.paddingVert,
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }
}
