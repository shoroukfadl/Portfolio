import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class _NavItemData {
  const _NavItemData({
    required this.section,
    required this.sectionKey,
    required this.title,
    required this.icon,
  });

  final HomeSection section;
  final GlobalKey sectionKey;
  final String title;
  final IconData icon;
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  static final List<_NavItemData> _items = [
    _NavItemData(
      section: HomeSection.about,
      sectionKey: GlobalKeys.aboutMe,
      title: Strings.aboutMe.translate,
      icon: Portfolio.summary,
    ),
    _NavItemData(
      section: HomeSection.skills,
      sectionKey: GlobalKeys.skill,
      title: Strings.mySkill.translate,
      icon: Portfolio.skills,
    ),
    _NavItemData(
      section: HomeSection.experience,
      sectionKey: GlobalKeys.experince,
      title: Strings.experience.translate,
      icon: Portfolio.experience,
    ),
    _NavItemData(
      section: HomeSection.projects,
      sectionKey: GlobalKeys.projects,
      title: Strings.projects.translate,
      icon: Portfolio.projects,
    ),
    _NavItemData(
      section: HomeSection.education,
      sectionKey: GlobalKeys.education,
      title: Strings.education.translate,
      icon: Portfolio.education,
    ),
  ];

  void _onItemTap(BuildContext context, _NavItemData item) {
    context.read<PortfolioCubit>().changeSection(item.section);

    final targetContext = item.sectionKey.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final barHeight = context.isSmall ? 56.0 : 80.0;

    return Container(
      height: barHeight,
      color: colors.card,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ..._items.map(
            (item) => Expanded(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (previous, current) =>
                    previous.section != current.section,
                builder: (context, state) {
                  return HomeAppBarItem(
                    onTap: () => _onItemTap(context, item),
                    selected: state.section == item.section,
                    title: item.title,
                    icon: item.icon,
                  ).center;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
