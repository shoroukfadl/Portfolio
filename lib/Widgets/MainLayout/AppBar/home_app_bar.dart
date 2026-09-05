import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/appbar_helper.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class MenuSideWidget extends StatelessWidget {
  const MenuSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = !context.isSmall ? 80.0 : 56.0;

    return Container(
      width: size,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: colors.card,
          border: Border(
              right: BorderSide(
            color: colors.border,
          ))),
      child: Column(
        children: [
          16.0.heightBox,
          const NameAppBar(),
          const Spacer(),
          ...paths,
          const Spacer(),
          const ThemeButton(),
          16.0.heightBox
        ],
      ),
    );
  }

  List<Widget> get paths => [
        sectionsWidget(
            section: HomeSection.about,
            key: GlobalKeys.aboutMe,
            title: Strings.aboutMe.translate,
            icon: Portfolio.summary),
        sectionsWidget(
            section: HomeSection.skills,
            key: GlobalKeys.skill,
            title: Strings.mySkill.translate,
            icon: Portfolio.skills),
        sectionsWidget(
            section: HomeSection.experience,
            key: GlobalKeys.experince,
            title: Strings.experience.translate,
            icon: Portfolio.experience),
        sectionsWidget(
            section: HomeSection.projects,
            key: GlobalKeys.projects,
            title: Strings.projects.translate,
            icon: Portfolio.projects),
        sectionsWidget(
            section: HomeSection.education,
            key: GlobalKeys.education,
            title: Strings.education.translate,
            icon: Portfolio.education),
      ];

  Widget sectionsWidget({
    required HomeSection section,
    required GlobalKey key,
    required String title,
    required IconData icon,
  }) =>
      BlocBuilder<PortfolioCubit, PortfolioState>(
          buildWhen: (c, p) => c.section != p.section,
          builder: (context, state) {
            return HomeAppBarItem(
              onTap: () {
                context.read<PortfolioCubit>().changeSection(
                      section,
                    );
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              selected: state.section == section,
              title: title,
              icon: icon,
            );
          });
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const NameAppBar(),
      const Spacer(),
      const ThemeButton(),
    ]).paddingSymmetric(vertical: 20, horizontal: mobileHozPadding);
  }
}
