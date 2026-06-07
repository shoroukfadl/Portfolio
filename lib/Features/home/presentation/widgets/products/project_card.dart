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
  });


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedCardWidget(
        paddingVert: 0,
        width: context.isLarge ? 268 : context.isSmall ? double.infinity:260,
        height: context.isSmall?null: 260,
        child: (i) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                GradintDividerWidget(
                  color1: colors.accent,
                  color2: colors.secondary,
                  thickness: 4,
                ),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      project?.title ?? "",
                      style: AppTextStyles.titleCardLarge(context:context,color: colors.text1),
                      maxLines: 2,
                    ).expand,
                    CardWithText(
                      text: project?.platform ?? "",
                      color: colors.accent.withValues(alpha: 0.2),
                      borderColor:Colors.transparent,
                      textColor: colors.accent,
                      maxLine: 2,
                      style: AppTextStyles.titleCardSmall(context:context,color: colors.accent),
                    )
                  ],
                ),
                Text('Test Cases'.toUpperCase(),
                    style: AppTextStyles.subtitleCard(context:context,color: colors.text2)),
                ...List.generate(
                  project?.keyTasks.length ?? 0,
                  (i) => Column(
                    children: [
                      PointText(
                          point: project?.keyTasks[i] ?? "",
                          style: AppTextStyles.body(context:context,color: colors.text2)),
                      if (i < (project?.keyTasks.length ?? 0) - 1)
                        const DividerWidget(),
                    ],
                  ),
                ),
                8.0.heightBox,
              ],
            ));
  }
}
