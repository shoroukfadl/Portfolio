import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/close_button.dart';

import 'gallery_preview.dart';

class GalleryWidget extends StatelessWidget {
  final ProjectEntity project;
  final bool mobile;
  final double size;

  const GalleryWidget(
      {super.key, required this.project, this.size = 24, required this.mobile});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return IconToolTipButtonWidget(
      tooltip: 'View All',
      onTap: () {
        GalleryPreviewDialog.show(context,
            isMobile: mobile,
            images: project.images,
            title: project.projectName ?? "");
      },
      color: colors.background,
      iconColor: colors.text1,
      icon: Portfolio.gallery,
      size: size,
    );
  }
}
