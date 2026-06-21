import 'package:flutter/material.dart';

class HoverAnimatedWidget extends StatefulWidget {
  final Widget Function(bool) child;
  final Duration duration;

  final bool zoomIn;
  final bool zoomOut;
  final bool moveUp;

  final double hoverScale;
  final double moveOffset;

  const HoverAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    this.zoomIn = false,
    this.zoomOut = false,
    this.moveUp = false,
    this.hoverScale = 1.05,
    this.moveOffset = 12,
  });

  @override
  State<HoverAnimatedWidget> createState() => _HoverAnimatedWidgetState();
}

class _HoverAnimatedWidgetState extends State<HoverAnimatedWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    double scale = 1;
    double translateY = 0;

    if (_hovered) {
      if (widget.zoomIn) {
        scale = widget.hoverScale;
      }

      if (widget.zoomOut) {
        scale = 2 - widget.hoverScale;
      }

      if (widget.moveUp) {
        translateY = -widget.moveOffset;
      }
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(0.0, translateY)
          ..scale(scale),
        child: widget.child(_hovered),
      ),
    );
  }
}
