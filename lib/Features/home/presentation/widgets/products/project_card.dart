import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Core/Language/app_styles.dart';


class ProjectItemCard extends StatelessWidget {
  final ProjectEntity? project;

  const ProjectItemCard({
    super.key,
    this.project,
    this.imageWidthSize = 416,
    this.imageHeightSize = 307,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;
  final double imageWidthSize, imageHeightSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedCardWidget(
      child: (i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(project?.title ?? "",
                  style: AppTextStyles.semiBold18(color: colors.accent)),
              CardWithText(
                text: project?.platform ?? "",
                color: colors.secondary.withValues(alpha: 0.2),
                borderColor:colors.secondary,
                textColor:  colors.secondary,

              )
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Text('Test Cases', style: AppTextStyles.medium16(color: colors.text1)),
              Container(
                width: double.infinity,
                height: 0.2,
                color:  colors.text1,
              ).expand
            ],
          ),
          ...List.generate(
            project?.keyTasks.length??0,
                (i) => Row(
              spacing: 8,
              children: [
                Icon(
                  Portfolio.bug,
                  size: 16,
                  color: colors.text1,
                ),
                Text(project?.keyTasks[i] ?? "",
                    style: AppTextStyles.regular12(color: colors.text1)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
