import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Widgets/rounded_image_widget.dart';

class MobilePreview extends StatelessWidget {
  final String url;

  const MobilePreview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.surface, colors.background],
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 80,
        height: 148,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: colors.text3, width: 1.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.14),
                blurRadius: 20,
                offset: const Offset(0, 4)),
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 4,
                offset: const Offset(0, 1)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Screen background
              RoundedImage(
                imagePath: url,
                fit: BoxFit.fill,
                width: 120,
                height: 170,
                backgroundColor: colors.background,
                radiusValue: 0,
              ),
              // Notch
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 26,
                    height: 5,
                    decoration: BoxDecoration(
                      color: colors.text1,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
