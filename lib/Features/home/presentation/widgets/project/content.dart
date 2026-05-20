import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/link_tabs_widget.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

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

  final TextStyle? projectNameStyle, projectTypeStyle, descriptionStyle;

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
                  AppTextStyles.extraBold18(color: colors.secondary)),
            ),
            Card(
              color: colors.secondaryEv.withValues(alpha: 0.1),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    color: colors.secondaryEv,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(
                      (project?.projectType?.toLowerCase() == 'mobile')
                          ? Portfolio.phone
                          : Portfolio.web,
                      size: 12,
                      color: colors.secondary,
                    ),
                    Text(
                      project?.projectType ?? "",
                      maxLines: 1,
                      style: (AppTextStyles.regular12(color: colors.secondary)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 8),
        4.0.heightBox,
        Text(
          project?.company ?? "",
          style: AppTextStyles.semiBold12(color: colors.textSecondary),
        ).paddingSymmetric(horizontal: 8),
        8.0.heightBox,
        ...List.generate(
          project?.content.length ?? 0,
          (i) => Text(
            "- ${project?.content[i] ?? ""}",
            style: AppTextStyles.medium14(color: colors.textPrimary),
          ).paddingSymmetric(horizontal: 8),
        ),
        8.0.heightBox,
        Divider(
          color: colors.surface,
          thickness: 1,
        ),
        LinkTabsWidget(
          android: project?.androidLinks ?? [],
          web: project?.webLinks ?? [],
          ios: project?.iosLinks ?? [],
        ).paddingSymmetric(horizontal: 20)
      ],
    );
  }
}
