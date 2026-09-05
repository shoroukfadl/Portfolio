import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(
        large: largeButtonIcon,
        medium: mediumButtonIcon,
        small: smallButtonIcon);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, theme) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.read<ThemeCubit>().changeTheme();
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.7,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Icon(
                theme.isDark ? Portfolio.light : Portfolio.dark,
                key: ValueKey(theme.isDark),
                size: size / 2,
                color: colors.text1,
              ),
            ),
          ),
        );
      },
    );
  }
}
