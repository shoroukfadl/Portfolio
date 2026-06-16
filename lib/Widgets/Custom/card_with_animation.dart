import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class BasicAnimatedCardWidget extends StatefulWidget {
  final Color? cardColor,
      borderColor,
      shadowColor,
      animatedColor,
      animatedBorderColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;

  const BasicAnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    this.animatedBorderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.border = Constants.cardRadius,
    this.shadowColor,
    this.animatedColor,
  });

  @override
  State<BasicAnimatedCardWidget> createState() =>
      _BasicAnimatedCardWidgetState();
}

class _BasicAnimatedCardWidgetState extends State<BasicAnimatedCardWidget> {
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
            borderRadius: BorderRadius.all(
              Radius.circular(widget.border),
            ),
            border: Border.all(
              color: _isHovered
                  ? (widget.animatedBorderColor ?? colors.secondary)
                  : (widget.borderColor ?? colors.text3),
              width: _isHovered ? 0.6 : 0.4,
            ),
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: widget.shadowColor ??
                    colors.secondary.withValues(alpha: 0.1),
                blurRadius: 8,
                spreadRadius: 4,
              ),
            ]
                : null,
            color: _isHovered
                ? (widget.animatedColor ?? colors.surface)
                : (widget.cardColor ?? colors.surface),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: widget.paddingHoz, vertical: widget.paddingVert),
          child: widget.child(_isHovered),
        ),
      ),
    );
  }
}

class AnimatedCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, shadowColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const AnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = Constants.cardRadius,
    this.shadowColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child:(_isHovered)=> AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(border),
            ),
            border: Border.all(
              color:_isHovered ? colors.accent: borderColor ?? colors.text3,
              width:_isHovered ? 0.4: 0.1,
            ),
            // boxShadow: _isHovered ?[
            //   BoxShadow(
            //       color: colors.text1.withValues(alpha: 0.2),
            //       spreadRadius: 2,
            //       blurRadius: 6,
            //       offset:const Offset (0,8)
            //   )
            // ]:null,
            color: (cardColor ?? colors.card),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: paddingHoz, vertical: paddingVert),
          child: child(_isHovered),
        ));
  }
}




class ZoomOutAnimatedCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, hoverColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const ZoomOutAnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = Constants.cardRadius,
    this.hoverColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child:(h)=> AnimatedScale(
          scale: h?1.03:1,
          duration: Duration(milliseconds: 250),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(border),
              ),
              border: Border.all(
                color:h ? (hoverColor??colors.accent): borderColor ?? colors.text3,
                width:h ? 0.4: 0.1,
              ),
              color:h? colors.surface.withValues(alpha: 0.1): (cardColor ?? colors.card),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: paddingHoz, vertical: paddingVert),
            child: child(h),
          ),
        ));
  }
}






class InteractiveCard extends StatefulWidget {
  final Widget Function(bool)child;

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
        final glow = widget.active
            ? 0.5 + (_controller.value * 0.5)
            : 0.15;

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