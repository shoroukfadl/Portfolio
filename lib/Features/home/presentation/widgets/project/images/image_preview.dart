import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/mobile_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/web_preview.dart';

import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../../../Utilities/extensions.dart';
import '../../../../domain/entities/project_entity.dart';

class ImagePreview extends StatelessWidget {
  final ProjectEntity project;

  const ImagePreview({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool mobile = project.projectType?.toLowerCase() == PreviewType.mobile.name;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: mobile
          ? MobilePreview(
              url: project.images.firstOrNull ?? '',
            )
          : WebPreview(
              height: 170,
              imageWidth: 260,
              width: double.infinity,
              urls: project.images,
              logoText: project.projectName ?? '',
            ),
    );
  }
}
