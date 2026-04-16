import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/Homel/home_controller.dart';
import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int selectedIndex = 0;

  void setIndex(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: colors.accent.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 4),
                spreadRadius: 2)
          ],
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(20),
          ),
          color: colors.surface,
        ),
        child: Column(
          spacing: 16,
          children: [
            HomeAppBarItem(
              onTap: () {
                setIndex(0);
                Scrollable.ensureVisible(
                  GlobalKeys.aboutMe.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              isSelected: selectedIndex == 0,
              title: Strings.aboutMe.translate,
              icon: Portfolio.home,
            ),
            HomeAppBarItem(
                onTap: () {
                  setIndex(1);
                  Scrollable.ensureVisible(
                    GlobalKeys.skill.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                isSelected: selectedIndex == 1,
                icon: Portfolio.skills,
                title: Strings.skill.translate),
            HomeAppBarItem(
              onTap: () {
                setIndex(2);
                Scrollable.ensureVisible(
                  GlobalKeys.experince.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              isSelected: selectedIndex == 2,
              title: Strings.experience.translate,
              icon: Portfolio.home,
            ),
            HomeAppBarItem(
                onTap: () {
                  setIndex(3);
                  Scrollable.ensureVisible(
                    GlobalKeys.projects.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                isSelected: selectedIndex == 3,
                icon: Portfolio.home,
                title: Strings.projects.translate),
            HomeAppBarItem(
                onTap: () {
                  setIndex(4);
                  Scrollable.ensureVisible(
                    GlobalKeys.education.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                isSelected: selectedIndex == 4,
                icon: Portfolio.home,
                title: Strings.education.translate),
            HomeAppBarItem(
                onTap: () {
                  setIndex(5);
                  Scrollable.ensureVisible(
                    GlobalKeys.contactMe.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                isSelected: selectedIndex == 5,
                icon: Portfolio.home,
                title: Strings.contactMe.translate),
            CustomButtonWidget(
              onPressed: () {
                String gmailWebUri =
                    "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.email}";
                HelperFunctions.openUrl(gmailWebUri, context);
              },
              btnColor: colors.textSecondary,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.hireMe.translate,
                    style: AppTextStyles.bodyM().copyWith(
                      color: colors.surface,
                    ),
                  ),
                  4.0.widthBox,
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: colors.surface,
                    size: 20,
                  )
                ],
              ),
            ),
            Row(
              spacing: 4,
              children: [
                CustomButtonWidget(
                  onPressed: () {
                    String? url = HomeController().user?.cv;
                    if (url != null) HelperFunctions.openUrl(url, context);
                  },
                  title: Strings.resume.translate,
                  titleColor: colors.accent,
                  btnColor: colors.background,
                  width: double.infinity,
                ).expand,
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
        ));
  }
}
