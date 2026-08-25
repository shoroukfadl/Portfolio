import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/Utilities/extensions.dart';

class CustomCursorPage extends StatefulWidget {
  final Widget child;
  const CustomCursorPage({super.key, required this.child});

  @override
  State<CustomCursorPage> createState() => _CustomCursorPageState();
}

class _CustomCursorPageState extends State<CustomCursorPage>
    with SingleTickerProviderStateMixin {
  Offset _targetPosition = Offset.zero;
  Offset _cursorPosition = Offset.zero;
  bool _isVisible = false;

  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    const double speed = 0.15;
    setState(() {
      _cursorPosition = Offset.lerp(_cursorPosition, _targetPosition, speed)!;
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        _targetPosition = event.position;
        if (!_isVisible) {
          _cursorPosition = event.position;
        }
        setState(() => _isVisible = true);
      },
      onExit: (_) => setState(() => _isVisible = false),
      child: Stack(
        children: [
          widget.child,
          if (_isVisible)
            Positioned(
              left: _cursorPosition.dx - 25,
              top: _cursorPosition.dy - 25,
              child: IgnorePointer(
                child: CursorWidget(
                  size: 50,
                  basicColor: colors.accent.withValues(alpha: 0.15),
                  shadowColor: colors.accent.withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 6,
                ),
              ),
            ),
          if (_isVisible)
            Positioned(
              left: _cursorPosition.dx - 10,
              top: _cursorPosition.dy - 10,
              child: CursorWidget(
                size: 20,
                basicColor: colors.accent,
                shadowColor: colors.accent.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 15,
              ),
            ),
        ],
      ),
    );
  }
}

class CursorWidget extends StatelessWidget {
  final double size, blurRadius, spreadRadius;
  final Color basicColor, shadowColor;
  const CursorWidget(
      {super.key,
      required this.size,
      required this.blurRadius,
      required this.basicColor,
      required this.shadowColor,
      required this.spreadRadius});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: basicColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
        ),
      ),
    );
  }
}
