import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/curved_card_widget.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../../Core/Language/app_styles.dart';
import '../../../../Models/user_data_model.dart';
import '../../../../Utilities/Constants/global_keys.dart';
import '../../../../Utilities/Constants/strings.dart';
import '../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectModel> projects;

  final TextStyle? myStyle, titleStyle;

  const MyProjectsWidget(
      {super.key, this.projects = const [], this.myStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
          titleStyle: titleStyle,
          myStyle: myStyle,
        ),
        16.0.heightBox,
        SizedBox(
          height: 460,
          child: ListView.separated(
            itemBuilder: (context, i) => ProjectItemCard(
              left: i % 2 == 0,
              project: projects[i],
              index: i + 1,
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => 32.0.heightBox,
            itemCount: projects.length,
          ),
        )
      ],
    );
  }
}

class ProjectItemCard extends StatelessWidget {
  final bool left;
  final ProjectModel? project;
  final int index;

  const ProjectItemCard({
    super.key,
    this.left = false,
    this.project,
    required this.index,
    this.imageWidthSize = 416,
    this.imageHeightSize = 307,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;
  final double imageWidthSize, imageHeightSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CurvedCardWidget(
      child: Container(
        padding: EdgeInsets.zero,
        width: imageWidthSize,
        height: imageHeightSize + 160,
        color: Colors.white.withValues(alpha: 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                project?.projectName ?? "",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: (projectNameStyle ?? AppTextStyles.displayS())
                    .copyWith(color: colors.textPrimary),
              ).paddingSymmetric(horizontal: 20),
            ),
            Divider(
              color: colors.border,
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  project?.projectType ?? "",
                  style:
                      AppTextStyles.codeL().copyWith(color: colors.textPrimary),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
            Text(
              project?.description ?? "",
              style: AppTextStyles.codeM().copyWith(color: colors.textPrimary),
            ).paddingSymmetric(horizontal: 20),
            ClipPath(
              clipper: SmoothNotchedClipper(),
              child: RoundedImage(
                imagePath: project?.images?.firstOrNull ?? "",
                height: imageHeightSize,
                width: imageWidthSize,
                radiusValue: 16,
                radius: 0,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
