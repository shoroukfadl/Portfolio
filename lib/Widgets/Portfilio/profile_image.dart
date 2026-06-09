
import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../rounded_image_widget.dart';

class ProfileImage extends StatefulWidget {
  final String image;
  final double width , height;
  const ProfileImage({super.key, required this.image,  this.width =180,  this.height = 180});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return   RoundedImage(
      imagePath:widget.image,
      height: widget.height,
      width: widget.width,
      padding: 0,
      borderColor: colors.accent,
    );
  }
}
