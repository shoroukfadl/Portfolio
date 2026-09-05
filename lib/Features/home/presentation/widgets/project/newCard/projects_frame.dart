import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/mobile/mobile_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/web/web_preview.dart';
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
    return CardWithTitle(
      paddingHoz: 0,
      paddingVert: 0,
      cardColor: context.colors.card,
      child: context.isLarge ? _largePreview() : _smallPreview(),
    );
  }

  Widget _smallPreview() => Column(
        spacing: 20,
        children: [
          _imageWidget(),
          ProjectContentWidget(project: project),
        ],
      );

  Widget _largePreview() => Column(
        spacing: 8,
        children: [
          _imageWidget(),
          ProjectContentWidget(project: project).expand,
        ],
      );

  Widget _imageWidget() {
    final isMobile = project.projectType?.toLowerCase() == 'mobile';

    if (isMobile) {
      return MobilePreview(
        urls: project.images,
        width: _mobilePreviewSize.width,
        height: _mobilePreviewSize.height,
      );
    }

    return WebPreview(
      urls: project.images,
      width: _webPreviewSize.width,
      height: _webPreviewSize.height,
    );
  }
}
