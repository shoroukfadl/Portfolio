import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                colors.accent,
                colors.secondary,
              ],
            ).createShader(bounds),
            child: const Text(
              '━ DEV',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
          ),
          // Navigation
          Row(
            spacing: 40,
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeAppBarItem(
                  onTap: () {
                    Scrollable.ensureVisible(
                      GlobalKeys.aboutMe.currentContext!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  title: Strings.aboutMe.translate),
              HomeAppBarItem(
                  onTap: () {
                    Scrollable.ensureVisible(
                      GlobalKeys.skill.currentContext!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  title: Strings.mySkill.translate),
              HomeAppBarItem(
                  onTap: () {
                    Scrollable.ensureVisible(
                      GlobalKeys.experince.currentContext!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  title: Strings.myExperience.translate),
              HomeAppBarItem(
                  onTap: () {
                    Scrollable.ensureVisible(
                      GlobalKeys.projects.currentContext!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  title: Strings.projects.translate),
              HomeAppBarItem(
                  onTap: () {
                    Scrollable.ensureVisible(
                      GlobalKeys.contactMe.currentContext!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  title: Strings.contactMe.translate),
            ],
          ),


          Row(
            spacing: 4,
            children: [
              CustomButtonWidget(
                onPressed: () {
                  // String? url = HomeController().user?.cv;
                  // if (url != null) HelperFunctions.openUrl(url, context);
                },
                title: Strings.resume.translate,
                titleColor: colors.accent,
                btnColor: colors.background,
                width: 120,
              ),
              CustomButtonWidget(
                width: 32,
                height: 32,
                borderRadiusValue: 100,
                onPressed: () {},
                child: Icon(
                  Icons.light_mode_outlined,
                  color: colors.surface,
                  size: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
