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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: _hovered
                    ? colors.text3
                    : !theme.isDark
                        ? colors.accent
                        : colors.secondary,
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: _hovered ? 0.083 : 0,
                curve: Curves.easeOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: Icon(
                    Portfolio.dark,
                    key: ValueKey(theme.isDark),
                    size: size / 1.5,
                    color: colors.background,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
