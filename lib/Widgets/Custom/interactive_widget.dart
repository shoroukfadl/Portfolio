import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InteractiveCard extends StatefulWidget {
  final Widget Function(bool active) child;

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

  bool get _isDesktop {
    if (!kIsWeb) {
      return Theme.of(context).platform == TargetPlatform.macOS ||
          Theme.of(context).platform == TargetPlatform.windows ||
          Theme.of(context).platform == TargetPlatform.linux;
    }

    return MediaQuery.sizeOf(context).width >= 600;
  }

  void _setHover(bool value) {
    if (_hovered == value) return;

    setState(() => _hovered = value);
  }

  void _setPressed(bool value) {
    if (_pressed == value) return;

    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final active = _isDesktop ? _hovered : _pressed;

    if (_isDesktop) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: widget.child(active),
      );
    }

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: widget.child(active),
    );
  }
}
