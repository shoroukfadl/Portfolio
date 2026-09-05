import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../../Widgets/rounded_image_widget.dart';

class MobileItemPreviewWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const MobileItemPreviewWidget({
    super.key,
    required this.url,
    required this.width,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.border,
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: RoundedImage(
              imagePath: url,
              fit: BoxFit.cover,
              width: width,
              height: height,
              backgroundColor: colors.background,
              radiusValue: 16,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 26,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
