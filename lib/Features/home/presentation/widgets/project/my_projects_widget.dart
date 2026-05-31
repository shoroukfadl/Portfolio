import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/project_card_preview.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'newCard/project_card_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectEntity> projects;
  final TextStyle? myStyle, titleStyle;
  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;
  final double cardHeight, cardWidth, imageWidth, padding;

  const MyProjectsWidget(
      {super.key,
      this.padding = 32,
      this.projects = const [],
      this.cardHeight = 380,
      this.cardWidth = 440,
      this.imageWidth = 100,
      this.myStyle,
      this.titleStyle,
      this.indexStyle,
      this.projectNameStyle,
      this.projectTypeStyle,
      this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
          titleStyle: titleStyle,
        ),
        16.0.heightBox,
        Wrap(spacing: 16, runSpacing: 16, children: [
          ...List.generate(
              projects.length,
              (i) => SizedBox(
                 height: cardHeight,
                 width: cardWidth,
                child: ProjectCard(
                      project: projects[i],
                      // descriptionStyle: descriptionStyle,
                      // imageWidthSize: imageWidth,
                      // cardHeight: cardHeight,
                      // cardWidth: cardWidth,
                      // projectNameStyle: projectNameStyle,
                      // projectTypeStyle: projectTypeStyle,
                    ),
              ))
        ]),
      ],
    );
  }
}
