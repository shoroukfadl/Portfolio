import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/web_preview.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../../../Utilities/extensions.dart';
import '../../../../../../Widgets/Custom/card_with_text.dart';
import '../../../../domain/entities/project_entity.dart';
import 'grallery.dart';
import 'mobile_preview.dart';

class ImagePreview extends StatelessWidget {
  final ProjectEntity project;

  const ImagePreview({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool mobile = project.projectType?.toLowerCase() == PreviewType.mobile.name;
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomStart,
      children: [
        SizedBox(
          height: 170,
          width: double.infinity,
          child: mobile
              ? MobilePreview(
                  url: project.images.firstOrNull ?? '',
                )
              : WebPreview(
                  height: 170,
                  imageWidth: 260,
                  width: double.infinity,
                  url: project.images.firstOrNull ?? '',
                  logoText: project.projectName ?? '',
                ),
        ),
        Positioned(
          bottom: -12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                color: colors.card, borderRadius: BorderRadius.circular(100)),
            child: CardWithText(
                text: project.projectName?.toUpperCase() ?? "",
                color: colors.text1,
                borderColor: Colors.transparent,
                style: AppTextStyles.titleCardSmall(
                    context: context, color: Colors.white)),
          ),
        ),
        Positioned(
          right: 0,
          bottom: -12,
          child: Row(
            spacing: 8,
            children: [
              if (project.androidLinks.isNotEmpty)
                PlatformButton(
                  links: project.androidLinks,
                  type: PlatformType.android,
                ),
              if (project.iosLinks.isNotEmpty)
                PlatformButton(
                  links: project.iosLinks,
                  type: PlatformType.ios,
                ),
              if (project.webLinks.isNotEmpty)
                PlatformButton(
                  links: project.webLinks,
                  type: PlatformType.web,
                ),
            ],
          ),
        )
      ],
    );
  }
}
