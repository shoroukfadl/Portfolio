import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Core/Theme/theme_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

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
      duration: const Duration(seconds: 15),
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
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (c,p)=>p.isDark != c.isDark,
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration:   BoxDecoration(
                gradient: !state.isDark ? AppColors.gradientCardLight:AppColors.gradientCardDark
              ),
              child: Stack(
                children: [
                  // Animated gradient blobs
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.2 +
                        (100 * (_controller.value - 0.5)),
                    top: MediaQuery.of(context).size.height * 0.5 -
                        (50 * (_controller.value - 0.5)),
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
                    right: MediaQuery.of(context).size.width * 0.1 -
                        (80 * (_controller.value - 0.5)),
                    bottom: MediaQuery.of(context).size.height * 0.2 +
                        (60 * (_controller.value - 0.5)),
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
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.7 -
                        (100 * (_controller.value - 0.5)),
                    top: MediaQuery.of(context).size.height * 0.1 +
                        (80 * (_controller.value - 0.5)),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            colors.accent.withValues(alpha: 0.08),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
