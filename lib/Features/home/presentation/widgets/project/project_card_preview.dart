import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/content/content.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../domain/entities/project_entity.dart';
import 'images/image_preview.dart';

class ProjectItemCard extends StatefulWidget {
  final ProjectEntity? project;

  const ProjectItemCard({
    super.key,
    this.project,
    this.imageWidthSize = 200,
    this.cardHeight = 400,
    this.cardWidth = 300,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;

  final double imageWidthSize, cardHeight, cardWidth;

  @override
  State<ProjectItemCard> createState() => _ProjectItemCardState();
}

class _ProjectItemCardState extends State<ProjectItemCard> with SingleTickerProviderStateMixin {
  bool hover = false;
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  void onHover(bool h) => setState(() {
    hover = h;
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool isMobile = widget.project?.projectType?.toLowerCase() == 'mobile';

    return AnimatedScale(
      duration: const Duration(milliseconds: 400),
      scale: hover ? 0.99 : 1,
      child: MouseRegion(
        onEnter: (x) => onHover(true),
        onExit: (x) => onHover(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
          animation: _shimmerController,
          builder: (context, child) {
            Widget cardContent = Container(
              width: widget.cardWidth,
              height: widget.cardHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: colors.surfaceElevated,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.text3)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagePreviewWidget(
                    cardWidth: widget.cardWidth,
                    height: double.infinity,
                    width: widget.imageWidthSize,
                    mobile: isMobile,
                    image: widget.project?.cover ?? "",
                    name: widget.project?.projectName ?? "",
                  ).expandFlex(2),
                  ProjectContent(
                    projectNameStyle: widget.projectNameStyle,
                    projectTypeStyle: widget.projectTypeStyle,
                    descriptionStyle: widget.descriptionStyle,
                    project: widget.project,
                  ).expandFlex(3),
                ],
              ),
            );

            if (hover) {
              return ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      _shimmerController.value - 0.3,
                      _shimmerController.value,
                      _shimmerController.value + 0.3,
                    ],
                    colors: [
                      Colors.white.withValues(alpha: 0.0),
                      Colors.white.withValues(alpha: 0.35),
                      Colors.white.withValues(alpha: 0.0),
                    ],
                  ).createShader(bounds);
                },
                child: cardContent,
              );
            }

            return cardContent;
          },
        ),
      ),
    );
  }
}