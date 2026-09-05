import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Animation/animated_counter.dart';

class StatItem extends StatelessWidget {
  final Stat item;
  final BorderRadiusGeometry borderRadius;

  final TextStyle? numStyle, titleStyle;

  const StatItem(
      {required this.item,
      this.numStyle,
      this.titleStyle,
      required this.borderRadius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBorderCard(
      borderRadius: borderRadius,
      borderWidth: 1.5,
      duration: const Duration(seconds: 8),
      child: SizedBox(
        height: 88,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCounter(
              targetNumber: item.value ?? 0.0,
              subtitle: item.subTitle,
              style: numStyle,
              hasDigits: item.hasDigit,
              sign: item.sign,
            ),
            const SizedBox(height: 6),
            Text(
              item.name?.toUpperCase() ?? "",
              style: titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBorderCard extends StatefulWidget {
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final Duration duration;
  final double borderWidth;

  const AnimatedBorderCard({
    super.key,
    required this.child,
    required this.borderRadius,
    this.duration = const Duration(seconds: 5),
    this.borderWidth = 1.5,
  });

  @override
  State<AnimatedBorderCard> createState() => _AnimatedBorderCardState();
}

class _AnimatedBorderCardState extends State<AnimatedBorderCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: AnimatedBorderPainter(
            progress: _controller.value,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.borderWidth),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class AnimatedBorderPainter extends CustomPainter {
  final double progress;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  AnimatedBorderPainter({
    required this.progress,
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final resolvedRadius = borderRadius.resolve(TextDirection.ltr);

    final rrect = resolvedRadius.toRRect(
      rect.deflate(borderWidth / 2),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: 2 * pi,
        transform: GradientRotation(
          progress * 2 * pi,
        ),
        colors: [
          Colors.transparent,
          Colors.transparent,
          const Color(0xFF42A5F5).withValues(alpha: 0.65),
          const Color(0xFF7C4DFF).withValues(alpha: 0.8),
          const Color(0xFF42A5F5).withValues(alpha: 0.65),
          Colors.transparent,
        ],
        stops: const [
          0.0,
          0.30,
          0.43,
          0.50,
          0.57,
          0.72,
        ],
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class Stat {
  final String? name;
  final String? subTitle;
  final double? value;
  final bool hasDigit;
  final String? sign;

  const Stat(
      {this.name, this.value, this.hasDigit = false, this.sign, this.subTitle});
}
