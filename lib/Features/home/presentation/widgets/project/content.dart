import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/link_tabs_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../domain/entities/project_entity.dart';

class ProjectContent extends StatelessWidget {
  final ProjectEntity? project;

  const ProjectContent({
    super.key,
    this.project,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle?
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.0.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              project?.projectName ?? "",
              maxLines: 1,
              style: (projectNameStyle ??
                  AppTextStyles.extraBold20(color: colors.textPrimary)),
            ),
            Card(
              color: colors.textPrimary,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  project?.projectType ?? "",
                  maxLines: 1,
                  style: (AppTextStyles.regular14(color: colors.secondary)),
                ),
              ),
            ),
          ],
        ),
        4.0.heightBox,
        Text(
          project?.company ?? "",
          style: AppTextStyles.medium14(color: colors.textPrimary),
        ),
        8.0.heightBox,
        ...List.generate(
          project?.content.length ?? 0,
              (i) =>
              Text(
                "- ${project?.content[i] ?? ""}",
                style: AppTextStyles.medium12(color: colors.textPrimary),
              ),
        ),
        8.0.heightBox,
        LinkTabsWidget(
          android: project?.androidLinks ?? [],
          web: project?.webLinks ?? [],
          ios: project?.iosLinks ?? [],
        )
      ],
    );
  }
}
