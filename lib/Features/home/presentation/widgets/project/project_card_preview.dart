import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/content.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../domain/entities/project_entity.dart';
import 'image_preview.dart';

class ProjectItemCard extends StatelessWidget {

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
  final ProjectEntity? project;

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;

  final double imageWidthSize, imageHeightSize, cardHeight, cardWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool isMobile = project?.projectType?.toLowerCase() == 'mobile';

    return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImagePreviewWidget(
                cardWidth: cardWidth,
                height:imageHeightSize,
                width: imageWidthSize,
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
          );
  }
}
