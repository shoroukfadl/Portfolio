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
                  borderRadius: BorderRadius.circular(8),
                  color: _hovered
                      ? colors.card
                      : !theme.isDark
                          ? colors.background
                          : colors.secondary,
                  border: Border.all(
                    color: colors.secondary,
                  ),
                ),
                child: Icon(
                  Portfolio.light,
                  key: ValueKey(theme.isDark),
                  size: size / 1.5,
                  color: theme.isDark ? colors.background : colors.secondary,
                )),
          ),
        );
      },
    );
  }
}
