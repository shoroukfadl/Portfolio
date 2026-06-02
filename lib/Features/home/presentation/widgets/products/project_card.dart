import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';


class ProjectItemCard extends StatelessWidget {
  final ProjectEntity? project;

  const ProjectItemCard({
    super.key,
    this.project,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedCardWidget(
      paddingVert: 0,
      child: (i) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          GradintDividerWidget(color1: colors.accent, color2: colors.secondary,thickness: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(project?.title ?? "",
                  style: AppTextStyles.semiBold14(color: colors.text1)),
              CardWithText(
                text: project?.platform ?? "",
                color: colors.accent.withValues(alpha: 0.2),
                borderColor:colors.accent,
                textColor:  colors.accent,
                border: 4,
                maxLine: 2,
                style: AppTextStyles.regular10(color: colors.accent),

            )
          ],
        ),

            Text('Test Cases', style: AppTextStyles.medium12(color: colors.text2)),
        ...List.generate(
          project?.keyTasks.length??0,
              (i) => Column(
            spacing: 8,
            children: [
              PointText(point:project?.keyTasks[i] ?? "", style: AppTextStyles.regular10(color: colors.text2)),
              if(i<( project?.keyTasks.length??0)-1)
              DividerWidget(),
            ],
          ),
        ),
          8.0.heightBox,
      ],
    ));
  }
}
