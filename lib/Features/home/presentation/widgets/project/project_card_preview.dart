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
    this.imageWidthSize = 400,
    this.imageHeightSize = 400,
    this.cardHeight = 500,
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

  final double imageWidthSize, imageHeightSize, cardHeight, cardWidth;

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
          border: Border.all(color: colors.border)),
      child: isMobile
          ? Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePreviewWidget(
                  cardWidth: cardWidth,
                  height: cardHeight - 20,
                  width: imageWidthSize * 1.2,
                  mobile: isMobile,
                  image: project?.cover ?? "",
                  name: project?.projectName ?? "",
                ),
                ProjectContent(
                  projectNameStyle: projectNameStyle,
                  projectTypeStyle: projectTypeStyle,
                  descriptionStyle: descriptionStyle,
                  project: project,
                ).expand,
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagePreviewWidget(
                  cardWidth: cardWidth,
                  height: imageHeightSize,
                  width: imageWidthSize,
                  mobile: isMobile,
                  image: project?.cover ?? "",
                  name: project?.projectName ?? "",
                ),
                Divider(
                  color: colors.border,
                  thickness: 1,
                ),
                ProjectContent(
                  projectNameStyle: projectNameStyle,
                  projectTypeStyle: projectTypeStyle,
                  descriptionStyle: descriptionStyle,
                  project: project,
                ),
              ],
            ),
    );
  }
}
