import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../AppBar/home_app_bar_item.dart';

class SectionModel {
  const SectionModel({
    required this.section,
    required this.sectionKey,
    required this.title,
    required this.icon,
  });

  final HomeSection section;
  final GlobalKey sectionKey;
  final String title;
  final IconData icon;
  static List<SectionModel> get paths => [
        SectionModel(
            section: HomeSection.skills,
            sectionKey: GlobalKeys.skill,
            title: Strings.mySkill.translate,
            icon: Portfolio.skills),
        SectionModel(
            section: HomeSection.experience,
            sectionKey: GlobalKeys.experince,
            title: Strings.experience.translate,
            icon: Portfolio.experience),
        SectionModel(
            section: HomeSection.projects,
            sectionKey: GlobalKeys.projects,
            title: Strings.projects.translate,
            icon: Portfolio.projects),
        SectionModel(
            section: HomeSection.education,
            sectionKey: GlobalKeys.education,
            title: Strings.education.translate,
            icon: Portfolio.education),
      ];
}

class BottomNavigationBarWidget extends StatelessWidget {
  final void Function(GlobalKey key) onSectionTap;
  const BottomNavigationBarWidget({super.key, required this.onSectionTap});

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
          ...SectionModel.paths.map(
            (item) => Expanded(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (previous, current) =>
                    previous.section != current.section,
                builder: (context, state) {
                  return HomeAppBarItem(
                    onTap: () => onSectionTap(item.sectionKey),
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
