import 'package:flutter/material.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/rounded_image_widget.dart';
import '../../../domain/entities/project_entity.dart';

class ProjectItemCard extends StatelessWidget {
  final bool left;
  final ProjectEntity? project;
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

    return Container(
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
              style: (projectNameStyle ?? AppTextStyles.extraBold32())
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
                AppTextStyles.medium10().copyWith(color: colors.textPrimary),
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
          Text(
            project?.projectType ?? "",
            style: AppTextStyles.medium10().copyWith(color: colors.textPrimary),
          ).paddingSymmetric(horizontal: 20),
          RoundedImage(
            imagePath:"",
            height: imageHeightSize,
            width: imageWidthSize,
            radiusValue: 16,
            radius: 0,
          ),
        ],
      ),
    );
  }
}
