import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;
  final double? height;
  final Color? color;

  const AnimatedBackground({
    super.key,
    this.height,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          DeveloperAnimatedBackground(
            color: color,
          ),
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
          child,
        ],
      ),
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

  DeveloperBackgroundPainter({
    required this.animation,
    this.particleCount = 40,
    required this.backgroundColor,
    required this.shapeColor,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final int particleCount;

  final Random _random = Random(42);

  List<_Particle>? _particles;

  // --- Cached, reused across every frame instead of rebuilt each paint() ---
  final Paint _backgroundPaint = Paint();
  final Paint _linePaint = Paint()
    ..strokeWidth = 0.6
    ..style = PaintingStyle.stroke;
  final Paint _glowPaint = Paint();
  final Paint _nodePaint = Paint();
  final Paint _layerPaint = Paint(); // used for the text-opacity trick below

  static const List<String> _symbols = [
    '< />',
    '{ }',
    '( )',
    '=>',
    '01',
    '&&',
    '///',
    ';',
  ];

  // Laid out ONCE (in white), then tinted/faded cheaply at paint time
  // instead of calling TextPainter.layout() 8 times every single frame.
  List<TextPainter>? _symbolPainters;

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

  List<TextPainter> _buildSymbolPainters() {
    return _symbols
        .asMap()
        .entries
        .map(
          (entry) => TextPainter(
            text: TextSpan(
              text: entry.value,
              style: TextStyle(
                // Baked in as plain white; real color/opacity applied at
                // paint time via saveLayer, so we never re-layout for it.
                color: Colors.white,
                fontSize: 18 + (entry.key % 3) * 4,
                fontWeight: FontWeight.w500,
                fontFamily: 'monospace',
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout(),
        )
        .toList();
  }

  @override
  void paint(Canvas canvas, Size size) {
    _particles ??= _generateParticles(size);
    _symbolPainters ??= _buildSymbolPainters();

    final particles = _particles!;

    // ─────────────────────────────────────────────
    // Background
    // ─────────────────────────────────────────────
    _backgroundPaint.color = backgroundColor;
    canvas.drawRect(Offset.zero & size, _backgroundPaint);

    // ─────────────────────────────────────────────
    // Animated particle positions
    // ─────────────────────────────────────────────
    final currentTime = animation.value * 2 * pi;
    final positions = <Offset>[];

    for (final particle in particles) {
      final dx =
          particle.x + sin(currentTime * particle.speed + particle.phase) * 25;
      final dy =
          particle.y + cos(currentTime * particle.speed + particle.phase) * 35;

      positions.add(
        Offset(dx.clamp(0, size.width), dy.clamp(0, size.height)),
      );
    }

    // ─────────────────────────────────────────────
    // Connection lines
    // Cheap squared-distance pre-check avoids a sqrt() for every pair
    // that's obviously too far apart to connect (most of them).
    // ─────────────────────────────────────────────
    const maxDist = 130.0;
    const maxDistSq = maxDist * maxDist;

    for (int i = 0; i < positions.length; i++) {
      for (int j = i + 1; j < positions.length; j++) {
        final dx = positions[i].dx - positions[j].dx;
        final dy = positions[i].dy - positions[j].dy;
        final distSq = dx * dx + dy * dy;

        if (distSq < maxDistSq) {
          final distance = sqrt(distSq);
          final opacity = (1 - distance / maxDist) * 0.18;

          _linePaint.color = shapeColor.withValues(alpha: opacity);
          canvas.drawLine(positions[i], positions[j], _linePaint);
        }
      }
    }

    // ─────────────────────────────────────────────
    // Glowing nodes
    // The old MaskFilter.blur forced a real per-pixel blur pass for every
    // particle, every frame — that's the single biggest cost in this
    // painter. A radial gradient shader gives the same soft-glow look
    // and is dramatically cheaper because it's just an analytic color
    // interpolation, no blur filter pass.
    // ─────────────────────────────────────────────
    for (int i = 0; i < positions.length; i++) {
      final particle = particles[i];
      final position = positions[i];

      final pulse = (sin(currentTime * 1.5 + particle.phase) + 1) / 2;
      final glowRadius = particle.radius * 4;

      _glowPaint.shader = ui.Gradient.radial(
        position,
        glowRadius,
        [
          shapeColor.withValues(alpha: 0.04 + pulse * 0.05),
          shapeColor.withValues(alpha: 0.0),
        ],
      );
      canvas.drawCircle(position, glowRadius, _glowPaint);

      _nodePaint.color = shapeColor.withValues(alpha: 0.25 + pulse * 0.3);
      canvas.drawCircle(position, particle.radius, _nodePaint);
    }

    // ─────────────────────────────────────────────
    // Floating code symbols
    // ─────────────────────────────────────────────
    _drawCodeSymbols(canvas, size, currentTime);
  }

  void _drawCodeSymbols(Canvas canvas, Size size, double time) {
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

    final painters = _symbolPainters!;

    for (int i = 0; i < painters.length; i++) {
      final floatY = sin(time * 0.8 + i) * 12;
      final opacity = 0.035 + ((sin(time + i) + 1) / 2) * 0.025;
      final drawPosition = positions[i] + Offset(0, floatY);
      final painter = painters[i];

      // Opacity trick (same one Flutter's own Opacity widget uses):
      // saveLayer with a paint whose alpha channel scales everything
      // drawn inside it. Lets us fade the symbol without ever touching
      // its TextSpan/style, so no re-layout is triggered.
      _layerPaint.color =
          Color.fromARGB((opacity.clamp(0.0, 1.0) * 255).round(), 0, 0, 0);

      final bounds = Rect.fromLTWH(
        drawPosition.dx,
        drawPosition.dy,
        painter.width,
        painter.height,
      );

      canvas.saveLayer(bounds, _layerPaint);
      // Tint toward shapeColor cheaply via a color filter blend, applied
      // once per symbol per frame — much cheaper than rebuilding the
      // TextSpan (which would force layout() again).
      canvas.saveLayer(
        bounds,
        Paint()..colorFilter = ColorFilter.mode(shapeColor, BlendMode.srcIn),
      );
      painter.paint(canvas, drawPosition);
      canvas.restore();
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant DeveloperBackgroundPainter oldDelegate) {
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
