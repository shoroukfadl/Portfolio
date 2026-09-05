import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/projects_frame.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectEntity> projects;
  final double imageWidth;
  final double padding;
  final int perRow;
  final double mainMaxExtent;

  const MyProjectsWidget({
    super.key,
    this.projects = const [],
    this.imageWidth = 100,
    this.perRow = 2,
    this.mainMaxExtent = 340,
    this.padding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);
    final space = context.matchedSize(large: 32, medium: 24, small: 16);
    return Column(
      spacing: 32,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          index: 3,
          title: Strings.projects.translate,
        ),
        SizedBox(
          width: width,
          child: AnimatedGridView<ProjectEntity>(
            items: projects,
            perRow: perRow,
            mainAxisExtent: mainMaxExtent,
            hozSpace: space,
            vertSpace: space,
            buildChild: (index) {
              return ProjectsFrame(
                index: index,
                project: projects[index],
              );
            },
          ),
        )
      ],
    ).paddingSymmetric(
      horizontal: padding,
    );
  }
}
