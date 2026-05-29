import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, theme) {
      return InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          context.read<ThemeCubit>().changeTheme();
        },
        child: Container(
          width: 48,
          height: 48,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: colors.accentSoft,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(Constants.largeButtonRadius),
            color: colors.accent,
          ),
          child: Icon(
            theme.isDark ? Portfolio.sun : Portfolio.moon,
            color: Colors.white,
            size: Constants.largeButtonIcon,
          ),
        ),
      );
    });
  }
}
