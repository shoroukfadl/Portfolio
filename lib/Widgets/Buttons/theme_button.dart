import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/portifilo_icons.dart';
import 'custom_button_widget.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return  Container(
      width: 64,
      height: 64,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(top: 10,end: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: colors.background
      ),
      child:
      InkWell(
        hoverColor: Colors.transparent,
        onTap: (){
          context.read<ThemeCubit>().changeTheme();
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(
                color: colors.accent50
            ),
            boxShadow: [
              BoxShadow(
                color: colors.accent25.withAlpha(90),
                blurRadius: 2,
                spreadRadius: 2,
              )
            ],
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(4)),
          ),

          child:    Icon(
            Portfolio.theme,
            color: colors.accent50,
            size: 24,
          ),
        ),
      ),
    );
  }
}
