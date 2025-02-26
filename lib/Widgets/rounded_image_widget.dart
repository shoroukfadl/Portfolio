import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/Theme/theme_model.dart';
import '../Models/images_model.dart';

class RoundedImage extends StatelessWidget {
  final Color? backgroundColor, borderColor;
  final double? radius, padding, radiusValue, width, height, borderWidth;
  final String? imagePath;
  final BoxFit? fit;
  final GenericFile? memoryImage;
  const RoundedImage(
      {super.key,
      this.backgroundColor,
      this.borderColor,
      this.radius,
      this.imagePath,
      this.fit,
      this.padding,
      this.memoryImage,
      this.radiusValue,
      this.width,
      this.borderWidth,
      this.height});

  @override
  Widget build(BuildContext context) {
    print("memoryImage: $imagePath");
    return memoryImage != null
        ? SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radiusValue ?? 200.0),
              child: Image.memory(
                memoryImage!.bytes,
                height: height ?? radius,
                width: width ?? radius,
                fit: BoxFit.cover,
              ),
            ),
          )
        : imagePath == null
            ? Container(
                padding: EdgeInsets.all(padding ?? 8),
                height: height ?? radius,
                width: width ?? radius,
                decoration: BoxDecoration(
                  shape: radiusValue == null
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  borderRadius: radiusValue == null
                      ? null
                      : BorderRadius.circular(radiusValue!),
                  color: backgroundColor ?? ThemeFactory.of(context).font4,
                ))
            : Container(
                padding: EdgeInsets.all(padding ?? 8),
                height: height ?? radius,
                width: width ?? radius,
                decoration: BoxDecoration(
                    shape: radiusValue == null
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    borderRadius: radiusValue == null
                        ? null
                        : BorderRadius.circular(radiusValue!),
                    color: backgroundColor ?? ThemeFactory.of(context).font4,
                    border: borderColor == null
                        ? null
                        : Border.all(
                            color: borderColor!,
                            width: borderWidth ?? 1.w,
                          ),
                    image: imagePath?.contains("http") ?? false
                        ? DecorationImage(
                            onError: (exception, stackTrace) => CircleAvatar(
                                  radius: ((radius ?? 16) / 2),
                                  backgroundColor:
                                      ThemeFactory.of(context).font1,
                                ),
                            fit: fit ?? BoxFit.fill,
                            image: NetworkImage(imagePath!))
                        : DecorationImage(
                            onError: (exception, stackTrace) => CircleAvatar(
                              radius: ((radius ?? 16) / 2),
                              backgroundColor: ThemeFactory.of(context).font1,
                            ),
                            fit: fit ?? BoxFit.fill,
                            image: AssetImage(
                              imagePath!,
                            ),
                          )),
              );
  }
}
