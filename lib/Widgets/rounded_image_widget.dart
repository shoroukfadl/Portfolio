import 'package:flutter/material.dart';

import '../Utilities/extensions.dart';

class RoundedImage extends StatelessWidget {
  final Color? backgroundColor, borderColor;
  final double? radius, padding, radiusValue, width, height, borderWidth;
  final String? imagePath;
  final BoxFit? fit;

  const RoundedImage(
      {super.key,
      this.backgroundColor,
      this.borderColor,
      this.radius,
      this.imagePath,
      this.fit,
      this.padding,
      this.radiusValue,
      this.width,
      this.borderWidth,
      this.height});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return imagePath == null
        ? Container(
            padding: EdgeInsets.all(padding ?? 8),
            height: height ?? radius,
            width: width ?? radius,
            decoration: BoxDecoration(
              shape: radiusValue == null ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: radiusValue == null
                  ? null
                  : BorderRadius.circular(radiusValue!),
              color: backgroundColor ?? colors.surface,
            ))
        : Container(
            padding: EdgeInsets.all(padding ?? 8),
            height: height ?? radius,
            width: width ?? radius,
            decoration: BoxDecoration(
                shape:
                    radiusValue == null ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: radiusValue == null
                    ? null
                    : BorderRadius.circular(radiusValue!),
                color: backgroundColor ?? colors.surface,
                border: borderColor == null
                    ? null
                    : Border.all(
                        color: borderColor!,
                        width: borderWidth ?? 1,
                      ),
                image: imagePath?.contains("http") ?? false
                    ? DecorationImage(
                        onError: (exception, stackTrace) => CircleAvatar(
                              radius: ((radius ?? 16) / 2),
                              backgroundColor: colors.textPrimary,
                            ),
                        fit: fit ?? BoxFit.fill,
                        image: NetworkImage(imagePath!))
                    : DecorationImage(
                        onError: (exception, stackTrace) => CircleAvatar(
                          radius: ((radius ?? 16) / 2),
                          backgroundColor: colors.textPrimary,
                        ),
                        fit: fit ?? BoxFit.fill,
                        image: AssetImage(
                          imagePath!,
                        ),
                      )),
          );
  }
}
