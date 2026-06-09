
import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../rounded_image_widget.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final double width , height;
  const ProfileImage({super.key, required this.image,  this.width =180,  this.height = 180});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return   RoundedImage(
      imagePath:image,
      height: height,
      width: width,
      borderColor: colors.accent,
    );
  }
}
