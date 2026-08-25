import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/image_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ProjectContentWidget extends StatelessWidget {
  final ProjectEntity selectedProject;

  const ProjectContentWidget({super.key, required this.selectedProject});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        ImagePreview(
          project: selectedProject,
        ).expandFlex(2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              selectedProject.projectName ?? "",
              style: AppTextStyles.titleCard2(
                  context: context, color: colors.text1),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: 8,
              children: [
                Text(
                  selectedProject.company ?? "",
                  style: AppTextStyles.subtitleCard(
                      context: context, color: colors.text2),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ).expand,
                if (selectedProject.androidLinks.isNotEmpty)
                  PlatformButton(
                    color: colors.accent,
                    links: selectedProject.androidLinks,
                    type: PlatformType.android,
                  ),
                if (selectedProject.iosLinks.isNotEmpty)
                  PlatformButton(
                    links: selectedProject.iosLinks,
                    type: PlatformType.ios,
                    color: colors.accent,
                  ),
                if (selectedProject.webLinks.isNotEmpty)
                  PlatformButton(
                    color: colors.secondary,
                    links: selectedProject.webLinks,
                    type: PlatformType.web,
                  ),
              ],
            ),
            if (selectedProject.content.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...selectedProject.content.map((e) => Text(
                        e,
                        style: AppTextStyles.cardBody(
                            context: context, color: colors.text2),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ).expand
          ],
        ).paddingSymmetric(horizontal: 40, vertical: 24).expand,
      ],
    );
  }
}
