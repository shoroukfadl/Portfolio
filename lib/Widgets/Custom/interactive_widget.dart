import 'package:flutter/material.dart';

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
