import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/projects_frame.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final double padding;
  final int perRow;
  final double mainMaxExtent;

  const MyProjectsWidget({
    super.key,
    this.perRow = 2,
    this.mainMaxExtent = 340,
    this.padding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    final itemSpace = context.matchedSize(large: 32, medium: 24, small: 16);
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    final rowWidth = HelperFunctions.getWidth(context);
    final width = (rowWidth / perRow) - itemSpace;
    return SliverPadding(
      key: GlobalKeys.projects,
      padding: EdgeInsetsGeometry.symmetric(horizontal: padding),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
              child: SectionsTitleWidget(
            index: 3,
            title: Strings.projects.translate,
          )),
          SliverToBoxAdapter(child: space.heightBox),
          BlocSelector<PortfolioCubit, PortfolioState, List<ProjectEntity>>(
              selector: (state) => state.data?.projects ?? [],
              builder: (context, projects) {
                return SliverConstrainedCrossAxis(
                    maxExtent: rowWidth,
                    sliver: AnimatedGridView<ProjectEntity>(
                      items: projects,
                      perRow: perRow,
                      mainAxisExtent: mainMaxExtent,
                      hozSpace: itemSpace,
                      vertSpace: itemSpace,
                      buildChild: (index) {
                        return Align(
                          child: ProjectItemWidget(
                            width: width,
                            key: ValueKey('project_$index'),
                            index: index,
                            project: projects[index],
                          ),
                        );
                      },
                    ));
              }),
        ],
      ),
    );
  }
}
