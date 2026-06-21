import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'newCard/project_card_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectEntity> projects;
  final int perRow;
  final double imageWidth, mainAxisExtent;

  const MyProjectsWidget(
      {super.key,
      this.mainAxisExtent = 360,
      this.projects = const [],
      this.imageWidth = 100,
      this.perRow = 4});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: perRow, mainAxisExtent: mainAxisExtent),
            itemCount: projects.length,
            itemBuilder: (c, i) => ProjectCard(project: projects[i])
                .paddingSymmetric(horizontal: 8, vertical: 8))
      ],
    );
  }
}
