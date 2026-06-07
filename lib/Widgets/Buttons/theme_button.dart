import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_button.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/portifilo_icons.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ContactButton(
      onTap: () {
        context.read<ThemeCubit>().changeTheme();
      },
      backgroundColor: colors.secondary.withAlpha(30),
      borderColor: colors.secondary,
      iconColor: colors.secondary,
      icon: Portfolio.theme,
    );
  }
}
