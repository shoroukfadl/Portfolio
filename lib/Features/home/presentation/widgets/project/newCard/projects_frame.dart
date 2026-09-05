import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/image_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/project_content.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';

class ProjectsFrame extends StatelessWidget {
  const ProjectsFrame({
    super.key,
    this.index = 0,
    required this.project,
  });

  final ProjectEntity project;
  final int index;

  static const _mobilePreviewSize = Size(72, 140);
  static const _webPreviewSize = Size(200, 140);

  @override
  Widget build(BuildContext context) {
    return AnimatedGlowWidget(
      paddingHoz: 0,
      paddingVert: 0,
      cardColor: context.colors.card,
      child: (h) {
        return Column(
          spacing: 8,
          children: [
            _imageWidget(h),
            ProjectContentWidget(project: project),
          ],
        );
      },
    );
  }

  Widget _imageWidget(bool hover) {
    final isMobile = project.projectType?.toLowerCase() == 'mobile';
    final size = isMobile ? _mobilePreviewSize : _webPreviewSize;
    return ImagePreview(
        urls: project.images,
        width: size.width,
        height: size.height,
        isMobile: isMobile,
        hover: hover);
  }
}
