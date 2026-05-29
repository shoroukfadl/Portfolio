import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Widgets/rounded_image_widget.dart';

class MobilePreviewWidget extends StatelessWidget {
  final double width, height, border;
  final String image;
  const MobilePreviewWidget(
      {super.key,
      this.border = 16,
      this.width = 200,
      this.height = 48,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        RoundedImage(
          imagePath: image,
          fit: BoxFit.fill,
          height: height,
          width: width - 4,
          radiusValue: border,
          radius: 0,
          borderColor: colors.accent,
          borderWidth: 2,
        ),
        Container(
          width: 32,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: colors.text1, borderRadius: BorderRadius.circular(100)),
        )
      ],
    );
  }
}
