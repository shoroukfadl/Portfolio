import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/web_preview_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Widgets/rounded_image_widget.dart';
import 'mobile_preview_widget.dart';

class ImagePreviewWidget extends StatelessWidget {
  final double width, height, cardWidth;
  final bool mobile;
  final String image, name;

  const ImagePreviewWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.mobile,
      required this.image,
      required this.cardWidth,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (mobile) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: colors.accentSoft,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: MobilePreviewWidget(
          image: image,
          height: height,
          width: width,
        ),
      );
    } else {
      return Column(
        children: [
          WebPreviewWidget(
            projectName: name,
            width: cardWidth,
          ),
          RoundedImage(
            imagePath: image,
            fit: BoxFit.fill,
            height: height,
            width: cardWidth,
            backgroundColor: colors.background,
            radiusValue: 0,
            radius: 0,
          ).expand,
        ],
      );
    }
  }
}
