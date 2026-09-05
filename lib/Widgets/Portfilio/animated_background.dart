import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final double? height;
  final Color? color;

  const AnimatedBackground(
      {super.key, this.height, this.color, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
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
      builder: (context, child) {
        return SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              DeveloperAnimatedBackground(
                color: widget.color,
              ),
              // Animated gradient blobs
              Positioned(
                left: 20,
                bottom: 80,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        colors.accent.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        colors.secondary.withValues(alpha: 0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              widget.child
            ],
          ),
        );
      },
    );
  }
}

class DeveloperAnimatedBackground extends StatefulWidget {
  const DeveloperAnimatedBackground({
    super.key,
    this.particleCount = 45,
    this.color,
  });

  final int particleCount;
  final Color? color;

  @override
  State<DeveloperAnimatedBackground> createState() =>
      _DeveloperAnimatedBackgroundState();
}

class _DeveloperAnimatedBackgroundState
    extends State<DeveloperAnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: DeveloperBackgroundPainter(
          animation: _controller,
          particleCount: widget.particleCount,
          shapeColor: context.colors.accent,
          backgroundColor: widget.color ?? context.colors.background,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class DeveloperBackgroundPainter extends CustomPainter {
  final Color backgroundColor;
  final Color shapeColor;

  DeveloperBackgroundPainter(
      {required this.animation,
      this.particleCount = 40,
      required this.backgroundColor,
      required this.shapeColor})
      : super(repaint: animation);

  final Animation<double> animation;
  final int particleCount;

  final Random _random = Random(42);

  List<_Particle>? _particles;

  List<_Particle> _generateParticles(Size size) {
    return List.generate(
      particleCount,
      (index) {
        return _Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          radius: 1 + _random.nextDouble() * 2.2,
          speed: 0.15 + _random.nextDouble() * 0.45,
          phase: _random.nextDouble() * pi * 2,
        );
      },
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    _particles ??= _generateParticles(size);

    final particles = _particles!;

    // ─────────────────────────────────────────────
    // Background gradient
    // ─────────────────────────────────────────────

    final backgroundPaint = Paint()..color = backgroundColor;

    canvas.drawRect(
      Offset.zero & size,
      backgroundPaint,
    );

    // ─────────────────────────────────────────────
    // Animated particles
    // ─────────────────────────────────────────────

    final currentTime = animation.value * 2 * pi;

    final positions = <Offset>[];

    for (final particle in particles) {
      final dx =
          particle.x + sin(currentTime * particle.speed + particle.phase) * 25;

      final dy =
          particle.y + cos(currentTime * particle.speed + particle.phase) * 35;

      positions.add(
        Offset(
          dx.clamp(0, size.width),
          dy.clamp(0, size.height),
        ),
      );
    }

    // ─────────────────────────────────────────────
    // Connection lines
    // ─────────────────────────────────────────────

    final linePaint = Paint()
      ..strokeWidth = 0.6
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < positions.length; i++) {
      for (int j = i + 1; j < positions.length; j++) {
        final distance = (positions[i] - positions[j]).distance;

        if (distance < 130) {
          final opacity = (1 - distance / 130) * 0.18;

          linePaint.color = shapeColor.withValues(
            alpha: opacity,
          );

          canvas.drawLine(
            positions[i],
            positions[j],
            linePaint,
          );
        }
      }
    }

    // ─────────────────────────────────────────────
    // Glowing nodes
    // ─────────────────────────────────────────────

    for (int i = 0; i < positions.length; i++) {
      final particle = particles[i];
      final position = positions[i];

      final pulse = (sin(currentTime * 1.5 + particle.phase) + 1) / 2;

      // Glow
      final glowPaint = Paint()
        ..color = shapeColor.withValues(
          alpha: 0.04 + pulse * 0.05,
        )
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          8,
        );

      canvas.drawCircle(
        position,
        particle.radius * 4,
        glowPaint,
      );

      // Node
      final nodePaint = Paint()
        ..color = shapeColor.withValues(
          alpha: 0.25 + pulse * 0.3,
        );

      canvas.drawCircle(
        position,
        particle.radius,
        nodePaint,
      );
    }

    // ─────────────────────────────────────────────
    // Floating code symbols
    // ─────────────────────────────────────────────

    _drawCodeSymbols(
      canvas,
      size,
      currentTime,
    );
  }

  void _drawCodeSymbols(
    Canvas canvas,
    Size size,
    double time,
  ) {
    const symbols = [
      '< />',
      '{ }',
      '( )',
      '=>',
      '01',
      '&&',
      '///',
      ';',
    ];

    final positions = [
      Offset(size.width * .12, size.height * .20),
      Offset(size.width * .82, size.height * .18),
      Offset(size.width * .18, size.height * .70),
      Offset(size.width * .76, size.height * .72),
      Offset(size.width * .48, size.height * .15),
      Offset(size.width * .90, size.height * .50),
      Offset(size.width * .08, size.height * .45),
      Offset(size.width * .55, size.height * .85),
    ];

    final textPaint = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < symbols.length; i++) {
      final floatY = sin(time * 0.8 + i) * 12;

      final opacity = 0.035 + ((sin(time + i) + 1) / 2) * 0.025;

      textPaint.text = TextSpan(
        text: symbols[i],
        style: TextStyle(
          color: shapeColor.withValues(
            alpha: opacity,
          ),
          fontSize: 18 + (i % 3) * 4,
          fontWeight: FontWeight.w500,
          fontFamily: 'monospace',
        ),
      );

      textPaint.layout();

      textPaint.paint(
        canvas,
        positions[i] +
            Offset(
              0,
              floatY,
            ),
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant DeveloperBackgroundPainter oldDelegate,
  ) {
    return oldDelegate.animation != animation;
  }
}

class _Particle {
  const _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.phase,
  });

  final double x;
  final double y;
  final double radius;
  final double speed;
  final double phase;
}
