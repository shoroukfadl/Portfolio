import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class ProjectContentWidget extends StatelessWidget {
  final ProjectEntity project;

  const ProjectContentWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${project.projectName ?? ""}",
                style: AppTextStyles.hc2(context: context, color: colors.text2),
                maxLines: 2,
              ).expand,
              CardWithText(
                text: '${project.projectType ?? ""}',
                style: AppTextStyles.l3(
                    context: context,
                    color: project.projectType?.toLowerCase() == "mobile"
                        ? Colors.blue
                        : Colors.green),
                borderColor: project.projectType?.toLowerCase() == "mobile"
                    ? Colors.blue.withValues(alpha: 0.1)
                    : Colors.green.withValues(alpha: 0.1),
                color: project.projectType?.toLowerCase() == "mobile"
                    ? Colors.blue.withValues(alpha: 0.1)
                    : Colors.green.withValues(alpha: 0.1),
                borderWidth: 1,
                border: 4,
              )
            ],
          ),
          4.0.heightBox,
          Text(
            " ${project.company ?? ""}",
            style: AppTextStyles.bl1(context: context, color: colors.text3),
          ),
          12.0.heightBox,
          if (project.content.isNotEmpty)
            ...project.content.map((e) => Text(
                  e,
                  style:
                      AppTextStyles.bc2(context: context, color: colors.text2),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                )),
          16.0.heightBox,
          Row(
            spacing: 8,
            children: [
              if (project.androidLinks.isNotEmpty)
                PlatformButton(
                  color: colors.accent,
                  links: project.androidLinks,
                  type: PlatformType.android,
                ),
              if (project.iosLinks.isNotEmpty)
                PlatformButton(
                  links: project.iosLinks,
                  type: PlatformType.ios,
                  color: colors.accent,
                ),
              if (project.webLinks.isNotEmpty)
                PlatformButton(
                  color: colors.accentSoft,
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
