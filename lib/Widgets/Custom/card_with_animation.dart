import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedCardWidget extends StatefulWidget {
  final Color? cardColor, borderColor, shadowColor, animatedColor ,animatedBorderColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert;

  const AnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    this.animatedBorderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.shadowColor, this.animatedColor,
  });

  @override
  State<AnimatedCardWidget> createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _isHovered ? 1.02 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.cardRadius),
            ),
            border: Border.all(
              color: _isHovered
                  ? (widget.animatedBorderColor ?? colors.accent)
                  : (widget.borderColor ?? colors.text3),
              width: _isHovered ? 0.6 : 0.4,
            ),
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: widget.shadowColor ??
                    colors.accent25.withValues(alpha: 0.1),
                blurRadius: 8,
                spreadRadius: 4,
              ),
            ]
                : null,
            color: _isHovered ? (widget.animatedColor ?? colors.surface):(widget.cardColor ?? colors.surface),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: widget.paddingHoz, vertical: widget.paddingVert),
          child: widget.child(_isHovered),
        ),
      ),
    );
  }
}