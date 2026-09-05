import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/mobile/mobile_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/web/web_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/project_content.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';

class ProjectsFrame extends StatelessWidget {
  final ProjectEntity project;
  final int index;

  const ProjectsFrame({super.key, this.index = 0, required this.project});

  @override
  @override
  Widget build(BuildContext context) {
    return CardWithTitle(
        paddingHoz: 0,
        paddingVert: 0,
        cardColor: context.colors.card,
        child: !context.isLarge ? smallPreview() : largePreview(context));
  }

  Widget smallPreview() => Column(
        spacing: 20,
        children: [
          imageWidget(),
          ProjectContentWidget(project: project),
        ],
      );
  Widget largePreview(BuildContext context) => Column(
        spacing: 8,
        children: [
          imageWidget(),
          ProjectContentWidget(project: project).expand,
        ],
      );

  Widget imageWidget() {
    if (project.projectType?.toLowerCase() == 'mobile') {
      return MobilePreview(
        urls: project.images,
        width: 72,
        height: 140,
      );
    } else {
      return WebPreview(urls: project.images, height: 140, width: 200);
    }
  }
}
