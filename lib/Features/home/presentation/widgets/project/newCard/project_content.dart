import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../../Core/Theme/theme_colors.dart';

class ProjectContentWidget extends StatelessWidget {
  const ProjectContentWidget({super.key, required this.project});

  final ProjectEntity project;

  bool get _isMobile => project.projectType?.toLowerCase() == 'mobile';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          4.0.heightBox,
          Text(
            project.company ?? '',
            style: AppTextStyles.bl1(context: context, color: colors.text3),
          ),
          12.0.heightBox,
          if (project.content.isNotEmpty) ..._buildContentLines(context),
          16.0.heightBox,
          _buildPlatformButtons(colors),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.colors;
    final typeColor = _isMobile ? Colors.blue : Colors.green;

    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.projectName ?? '',
          style: AppTextStyles.hc1(context: context, color: colors.text1),
          maxLines: 2,
        ).expand,
        CardWithText(
          text: project.projectType ?? '',
          style: AppTextStyles.l3(context: context, color: typeColor),
          borderColor: typeColor.withValues(alpha: 0.1),
          color: typeColor.withValues(alpha: 0.1),
          borderWidth: 1,
          border: 4,
        ),
      ],
    );
  }

  List<Widget> _buildContentLines(BuildContext context) {
    final colors = context.colors;

    return project.content
        .map((line) => Text(
              line,
              style: AppTextStyles.bc2(context: context, color: colors.text2),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ))
        .toList();
  }

  Widget _buildPlatformButtons(AppColors colors) {
    return Row(
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
    );
  }
}
