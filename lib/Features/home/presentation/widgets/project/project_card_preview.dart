import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/link_tabs_widget.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/hover_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/rounded_image_widget.dart';
import '../../../domain/entities/project_entity.dart';

class ProjectItemCard extends StatelessWidget {
  final ProjectEntity? project;

  const ProjectItemCard({
    super.key,
    this.project,
    this.imageWidthSize = 600,
    this.imageHeightSize = 220,
    this.cardWidth = 600,
    this.cardHeight = 220,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;
  final double imageWidthSize, imageHeightSize, cardHeight, cardWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool isMobile = project?.projectType?.toLowerCase() == 'mobile';

    return HoverWidget(
      builder: (bool isHovered) => AnimatedScale(
        scale: isHovered ? 1.05 : 1,
        duration: const Duration(milliseconds: 400),
        child: Container(
          padding: EdgeInsets.zero,
          height: 400,
          width: imageWidthSize,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: colors.surfaceElevated,
            border: Border.all(color: colors.border),
          ),
          child:   isMobile ?Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              _image(isMobile, colors),
              _content(isMobile, colors).expand,
            ],
          ):Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              _image(isMobile, colors),
              _content(isMobile, colors).expand,
            ],
          ),
        ),
      ),
    );
  }
  
  
  Widget  _image (bool isMobile , AppColors colors)=>  Stack(
    children: [
      RoundedImage(
        imagePath: project?.cover??"",
        fit: BoxFit.fill,
        height:isMobile ?  double.infinity:200,
        width:isMobile ?  (imageWidthSize / 2.5):imageWidthSize,
        radiusValue: 16,
        radius: 0,
      ),
      Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isMobile ? colors.secondary : colors.accent,
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(100),

            )),
        child: Icon(
          isMobile ? Portfolio.phone : Portfolio.web,
          size: 18,
          color: Colors.white,
        ),
      )
    ],
  );
  Widget  _content (bool isMobile , AppColors colors)=>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      8.0.heightBox,
      Text(
        project?.projectName ?? "",
        maxLines: 1,
        style: (projectNameStyle ??
            AppTextStyles.extraBold20(color: colors.accent)),
      ),
      4.0.heightBox,

      Text(
        project?.company ?? "",
        style: AppTextStyles.medium14(color: colors.textPrimary),
      ),
      8.0.heightBox,

      Text(
        project?.description ?? "",
        style: AppTextStyles.medium12(color: colors.textPrimary),
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
