import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utilities/extensions.dart';

class CustomIconWithBackgroundWidget extends StatelessWidget {
  final String iconPath;
  final Color? color, iconColor;

  final double? iconSize, buttonSize;
  final bool showShadow;

  const CustomIconWithBackgroundWidget(
      {super.key,
      required this.iconPath,
      this.color,
      this.iconColor,
      this.iconSize,
      this.showShadow = false,
      this.buttonSize});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: buttonSize ?? 40.0,
      height: buttonSize ?? 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(buttonSize != null ? buttonSize! / 8 : 4),
          color: color ?? colors.background,
          border: Border.all(color: colors.accent),
          boxShadow: [
            if (showShadow)
              BoxShadow(
                color: colors.text1.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
          ]),
      child: SvgPicture.asset(
        iconPath,
        width: iconSize ?? 20.0,
        height: iconSize ?? 20.0,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        colorFilter:
            ColorFilter.mode(iconColor ?? colors.accent, BlendMode.srcIn),
      ),
    );
  }
}
