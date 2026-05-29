import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/links/link_tabs_widget.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/extensions.dart';
import '../../../../domain/entities/project_entity.dart';

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
        Text(
          project?.projectName ?? "",
          maxLines: 1,
          style: (projectNameStyle ??
              AppTextStyles.semiBold18(color: colors.text1)),
        ).paddingOnly(start: 8),
        4.0.heightBox,
        Text(project?.company ?? "",
                style: AppTextStyles.medium12(color: colors.text2))
            .paddingSymmetric(horizontal: 8),
        8.0.heightBox,
        ...List.generate(
          project?.content.length ?? 0,
          (i) => Text(
            project?.content[i] ?? "",
            style: AppTextStyles.regular12(color: colors.text3)
                .copyWith(height: 1.3),
          ).paddingSymmetric(horizontal: 8),
        ),
        8.0.heightBox,
        Divider(
          color: colors.surface,
          thickness: 1,
        ),
        8.0.heightBox,
        LinkTabsWidget(
          android: project?.androidLinks ?? [],
          web: project?.webLinks ?? [],
          ios: project?.iosLinks ?? [],
        ).paddingSymmetric(horizontal: 20)
      ],
    );
  }
}
