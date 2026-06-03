import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utilities/extensions.dart';

class CustomRoundedWidget extends StatelessWidget {
  final String iconPath;
  final Color? color;
  final double? size, iconSize;

  const CustomRoundedWidget(
      {super.key,
      required this.iconPath,
      this.color,
      this.size,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: size ?? 34.0,
      height: size ?? 32.0,
      //  padding: EdgeInsets.all(4.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: colors.surface),
      child: iconPath.startsWith("http")
          ? Image.network(
              iconPath,
              width: iconSize ?? 20.0,
              height: iconSize ?? 20.0,
              color: color ?? colors.text1,
            )
          : SvgPicture.asset(
              iconPath,
              colorFilter:
                  ColorFilter.mode(color ?? colors.text1, BlendMode.srcIn),
              width: iconSize ?? 20.0,
              height: iconSize ?? 20.0,
            ),
    );
  }
}
