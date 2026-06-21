import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/appbar_helper.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/constants.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = !context.isSmall ? 64.0 : 56.0;
    final padding = context.isLarge
        ? desktopHozPadding
        : context.isMedium
            ? tabletHozPadding
            : mobileHozPadding;
    return Container(
      height: size,
      padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: colors.surface,
      ),
      child: Row(
        children: [
          NameAppBar(),
          Spacer(),
          ...paths,
          Spacer(),
          const ThemeButton()
        ],
      ),
    );
  }

  List<Widget> get paths => [
        sectionsWidget(
          section: HomeSection.about,
          key: GlobalKeys.aboutMe,
          title: Strings.aboutMe.translate,
        ),
        sectionsWidget(
          section: HomeSection.skills,
          key: GlobalKeys.skill,
          title: Strings.mySkill.translate,
        ),
        sectionsWidget(
          section: HomeSection.experience,
          key: GlobalKeys.experince,
          title: Strings.experience.translate,
        ),
        sectionsWidget(
          section: HomeSection.projects,
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
        ),
        sectionsWidget(
          section: HomeSection.education,
          key: GlobalKeys.education,
          title: Strings.education.translate,
        ),
      ];

  Widget sectionsWidget({
    required HomeSection section,
    required GlobalKey key,
    required String title,
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
            );
          });
}
