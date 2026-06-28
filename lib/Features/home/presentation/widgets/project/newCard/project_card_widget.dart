import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/image_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';
import 'grallery.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ZoomOutAnimatedCardWidget(
      paddingVert: 0,
      paddingHoz: 8,
      child: (h) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.0.heightBox,
          // Preview
          ImagePreview(
            project: project,
          ),

          // Body

          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            margin: EdgeInsets.only(top: 24, bottom: 8),
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(cardRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      project.company?.toUpperCase() ?? "",
                      style: AppTextStyles.cardBody(
                          context: context, color: colors.text1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).expand,
                    GalleryWidget(
                      project: project,
                      mobile: project.projectType?.toLowerCase() == "mobile",
                      size: 16,
                    ),
                  ],
                ),
                if (project.content.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...project.content.map((e) => Text(
                            e,
                            style: AppTextStyles.cardBody(
                                context: context, color: colors.text2),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ).expand
              ],
            ),
          ).expand,
        ],
      ),
    );
  }
}
