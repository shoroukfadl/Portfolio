import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/content.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../domain/entities/project_entity.dart';
import 'image_preview.dart';

class ProjectItemCard extends StatelessWidget {
  final ProjectEntity? project;

  const ProjectItemCard({
    super.key,
    this.project,
    this.imageWidthSize = 200,
    this.cardHeight = 400,
    this.cardWidth = 300,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;

  final double imageWidthSize, cardHeight, cardWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool isMobile = project?.projectType?.toLowerCase() == 'mobile';

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          color: colors.surfaceElevated,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.surface)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagePreviewWidget(
            cardWidth: cardWidth,
            height: double.infinity,
            width: imageWidthSize,
            mobile: isMobile,
            image: project?.cover ?? "",
            name: project?.projectName ?? "",
          ).expandFlex(2),
          ProjectContent(
            projectNameStyle: projectNameStyle,
            projectTypeStyle: projectTypeStyle,
            descriptionStyle: descriptionStyle,
            project: project,
          ).expandFlex(3),
        ],
      ),
    );
  }
}
