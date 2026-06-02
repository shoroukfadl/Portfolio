import 'package:flutter/material.dart';

import '../../../../../Utilities/extensions.dart';

class ShieldWidget extends StatefulWidget {
  final double shieldSize;
  const ShieldWidget({super.key, this.shieldSize = 160});

  @override
  State<ShieldWidget> createState() => _ShieldWidgetState();
}

class _ShieldWidgetState extends State<ShieldWidget>
    with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.05).animate(_pulseAnimation),
      child: Container(
        width: widget.shieldSize,
        height: widget.shieldSize,
        decoration: BoxDecoration(
          color:colors.background,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: colors.accent.withValues(alpha: 0.3),
              blurRadius:
                  30 + (10 * _pulseAnimation.value),
              spreadRadius: 5 + (2 * _pulseAnimation.value),
            ),
          ],
          border: Border.all(color:  colors.accent, width: 2),
        ),
        child:  Icon(Icons.shield_outlined, size: 70, color:  colors.accent),
      ),
    );
  }
}
