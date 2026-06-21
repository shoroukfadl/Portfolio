import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/image_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedCardWidget(
      paddingVert: 8,
      paddingHoz: 8,
      child: (h) => Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Preview
          ImagePreview(
            project: project,
          ),

          // Body
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                children: [
                  Text(
                    project.projectName ?? "",
                    style: AppTextStyles.titleCard(
                        context: context, color: colors.text1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).expand,
                  CardWithText(
                      text: project.company?.toUpperCase() ?? "",
                      color: colors.accent.withValues(alpha: 0.1),
                      borderColor: Colors.transparent,
                      style: AppTextStyles.titleCardSmall(
                          context: context, color: colors.accent)),
                ],
              ),
              if (project.content.isNotEmpty)
                ...project.content.map((e) => Text(
                      e,
                      style: AppTextStyles.cardBody(
                          context: context, color: colors.text3),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ))
            ],
          ),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (project.androidLinks.isNotEmpty)
                PlatformButton(
                  links: project.androidLinks,
                  type: PlatformType.android,
                ),
              if (project.iosLinks.isNotEmpty)
                PlatformButton(
                  links: project.iosLinks,
                  type: PlatformType.ios,
                ),
              if (project.webLinks.isNotEmpty)
                PlatformButton(
                  links: project.webLinks,
                  type: PlatformType.web,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
