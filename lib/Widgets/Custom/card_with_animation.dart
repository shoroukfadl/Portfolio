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
    this.border = cardRadius,
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

class AnimatedCardWidget extends StatefulWidget {
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
    this.border = cardRadius,
    this.shadowColor,
    this.height,
  });

  @override
  State<AnimatedCardWidget> createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(0, -16))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
          _controller.forward();
        },
        onExit: (_) {
          setState(() => _isHovered = false);
          _controller.reverse();
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (c, w) => Transform.translate(
            offset: _animation.value,
            child: w,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.border),
              ),
              border: Border.all(
                color: _isHovered
                    ? colors.secondary
                    : (widget.borderColor ?? colors.border),
                width: 1,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.shadowColor ??
                            colors.accent.withValues(alpha: 0.1),
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ]
                  : null,
              color: (widget.cardColor ?? colors.surface),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: widget.paddingHoz, vertical: widget.paddingVert),
            child: widget.child(_isHovered),
          ),
        ));
  }
}




class SideAnimatedCard extends StatefulWidget {
  final Widget child;

  const SideAnimatedCard({
    super.key, required this.child,
  });

  @override
  State<SideAnimatedCard> createState() => _SideAnimatedCardState();
}

class _SideAnimatedCardState extends State<SideAnimatedCard> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _isHovered ? colors.accent : colors.secondary,
                width: _isHovered ? 3 : 2,
              ),
              bottom: BorderSide(
                color: _isHovered ? colors.accent : colors.secondary,
                width: _isHovered ? 3 : 0.5,
              ),
            ),
            color: colors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: widget.child,
        ));
  }
}
