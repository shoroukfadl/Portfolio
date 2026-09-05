import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class WebItemPreview extends StatelessWidget {
  final double height, width;
  final String url;
  final bool hover;

  const WebItemPreview(
      {super.key,
      required this.width,
      required this.height,
      this.hover = false,
      required this.url});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedScale(
        scale: hover ? 1.03 : 1,
        duration: Duration(milliseconds: 300),
        child: Column(
          children: [
            WebBarWidget(width: width),
            RoundedImage(
              imagePath: url,
              fit: BoxFit.fill,
              height: 600,
              width: width,
              radiusValue: 0,
              borderColor: Colors.transparent,
              padding: 0,
              backgroundColor: colors.background,
            ).expand
          ],
        ));
  }
}

class WebBarWidget extends StatelessWidget {
  final double width;

  const WebBarWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: width,
      height: 20,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        spacing: 4,
        children: [
          CircleAvatar(
            radius: 4,
            backgroundColor: colors.border,
          ),
          CircleAvatar(
            radius: 4,
            backgroundColor: colors.border,
          ),
          CircleAvatar(
            radius: 4,
            backgroundColor: colors.border,
          ),
        ],
      ),
    );
  }
}
