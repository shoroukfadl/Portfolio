import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/web_preview.dart';

import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../../../Utilities/extensions.dart';
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
          right: 4,
          bottom: 4,
          child: GalleryWidget(
            project: project,
            mobile: mobile,
            size: 20,
          ),
        )
      ],
    );
  }
}
