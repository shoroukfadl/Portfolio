import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/mobile_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/web_preview.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';
import 'badge_chip.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Preview
          SizedBox(
            height: 170,
            width: 400,
            child: project.projectType?.toLowerCase() ==
                    PreviewType.mobile.name
                ? MobilePreview(
              url: project.cover ?? '',
            )
                : WebPreview(
                    url: project.cover ?? '',
                    logoText: project.projectName ?? '',
                  ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Meta row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(project.company?.toUpperCase() ?? "",
                        style: AppTextStyles.medium10(color: colors.text2)),
                    BadgeChip(
                        type: BadgeType.values.firstWhere(
                            (e) =>
                                e.name ==
                                (project.industry?.toLowerCase() ?? ""),
                            orElse: () => BadgeType.web)),
                  ],
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  project.projectName ?? "",
                  style: AppTextStyles.semiBold20(color: colors.text1),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // Description
                if (project.content.isNotEmpty)
                  ...project.content
                      .map((e) => Text(
                            e,
                            style: AppTextStyles.medium12(color: colors.text3),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ))

              ],
            ),
          ),

          // Divider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Divider(color: colors.text3, height: 1, thickness: 1),
          ),

          // Footer — platform links
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                PlatformButton(
                  links: project.androidLinks,
                  type: PlatformType.android,
                ),
                PlatformButton(
                  links: project.iosLinks,
                  type: PlatformType.ios,
                ),
                PlatformButton(
                  links: project.webLinks,
                  type: PlatformType.web,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
