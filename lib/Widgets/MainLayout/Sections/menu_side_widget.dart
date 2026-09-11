import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';
import 'package:portfolio/Widgets/MainLayout/Sections/bottom_navigation.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';

class SectionsWidget extends StatelessWidget {
  final void Function(GlobalKey key) onSectionTap;
  const SectionsWidget({super.key, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: SectionModel.paths
          .map((path) => BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.section != p.section,
              builder: (context, state) {
                return HomeAppBarItem(
                  onTap: () {
                    onSectionTap(path.sectionKey);
                  },
                  selected: state.section == path.section,
                  title: path.title,
                  icon: path.icon,
                );
              }))
          .toList(),
    );
  }
}
