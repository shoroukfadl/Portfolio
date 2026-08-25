import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedCardWidget extends StatelessWidget {
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const AnimatedCardWidget({
    super.key,
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
        child: (hover) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width: width,
              height: height,
              transform: Matrix4.translationValues(0, hover ? -8 : 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(border),
                ),
                border: Border.all(
                  color: hover ? colors.secondary : colors.text3,
                  width: hover ? 0.4 : 0.1,
                ),
                color: colors.card,
                boxShadow: [
                  BoxShadow(
                    color: colors.text3.withValues(alpha: hover ? 0.18 : 0.06),
                    blurRadius: hover ? 16 : 6,
                    offset: Offset(0, hover ? 10 : 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz, vertical: paddingVert),
              child: child(hover),
            ));
  }
}

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
                          color: (hoverColor ?? colors.secondary)
                              .withValues(alpha: 0.28),
                          blurRadius: 10,
                          spreadRadius: 4)
                  ],
                  border: Border.all(
                    color: h
                        ? (hoverColor ?? colors.secondary)
                        : borderColor ?? colors.text3,
                    width: h ? 0.4 : 0.1,
                  ),
                  color: (cardColor ?? colors.card),
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
                      ? (hoverColor ?? colors.secondary)
                      : borderColor ?? colors.text3,
                  width: h ? 0.4 : 0.1,
                ),
                color: (cardColor ?? colors.card),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz, vertical: paddingVert),
              child: child(h),
            ));
  }
}

class InteractiveCard extends StatefulWidget {
  final Widget Function(bool) child;

  const InteractiveCard({
    super.key,
    required this.child,
  });

  @override
  State<InteractiveCard> createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  bool _hovered = false;
  bool _pressed = false;

  bool get _isDesktop =>
      Theme.of(context).platform == TargetPlatform.macOS ||
      Theme.of(context).platform == TargetPlatform.windows ||
      Theme.of(context).platform == TargetPlatform.linux;

  void _setHover(bool value) {
    if (_isDesktop) {
      setState(() => _hovered = value);
    }
  }

  void _setPressed(bool value) {
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    if (_isDesktop) {
      return MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: widget.child(_hovered),
      );
    }

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: widget.child(_pressed),
    );
  }
}

class AnimatedDot extends StatefulWidget {
  final bool active;

  const AnimatedDot({
    super.key,
    required this.active,
  });

  @override
  State<AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    if (widget.active) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedDot oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.active) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow = widget.active ? 0.5 + (_controller.value * 0.5) : 0.15;

        return AnimatedScale(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          scale: widget.active ? 1.2 : 0.8,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.secondary,
              boxShadow: widget.active
                  ? [
                      BoxShadow(
                        color: colors.secondary.withValues(
                          alpha: glow,
                        ),
                        blurRadius: 12 + (_controller.value * 8),
                        spreadRadius: 2 + (_controller.value * 2),
                      ),
                    ]
                  : [],
            ),
          ),
        );
      },
    );
  }
}
