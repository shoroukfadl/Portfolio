import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/rounded_image_widget.dart';

class MobilePreviewWidget extends StatelessWidget {
  final double width, height, border;
  final String image;
  const MobilePreviewWidget(
      {super.key,
      this.border = 32,
      this.width = 480,
      this.height = 48,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(
        Radius.circular(border),

        ),
        color: colors.textPrimary,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          RoundedImage(
            imagePath: image,
            fit: BoxFit.fill,
            height: height - 16,
            width: width - 16,
            radiusValue: border,
            radius: 0,
          ),
          Container(
            width: 48,
            height: 8,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: colors.textPrimary,
                borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
    );
  }
}
