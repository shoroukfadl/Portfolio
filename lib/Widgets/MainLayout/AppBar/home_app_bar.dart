import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import 'home_app_bar_item.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.all(Radius.circular(32))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        spacing: 16,
        children: [
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.aboutMe.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              icon: Portfolio.home
          ),
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.skill.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              icon: Portfolio.skills
          ),
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.experince.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              icon: Portfolio.work
          ),
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.projects.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              icon: Portfolio.work
          ),
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.contactMe.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              icon: Portfolio.home
          ),



              BlocBuilder<ThemeCubit,ThemeState>(
                builder: (context, theme) {
                  return CustomButtonWidget(
                    width: 32,
                    height: 32,
                    borderRadiusValue: 100,
                    onPressed: () {
                      context.read<ThemeCubit>().changeTheme();
                    },
                    child: Icon(
                     theme.isDark ? Portfolio.sun:  Portfolio.moon,
                      color: Colors.white,
                      size: 16,
                    ),
                  );
                }
              ),
        ],
      ),
    );
  }
}
