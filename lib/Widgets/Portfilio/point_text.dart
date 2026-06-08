import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Core/Language/app_styles.dart';

class PointText extends StatelessWidget {
  final String point;
  final TextStyle? style;
  const PointText({super.key, required this.point, this.style});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.keyboard_arrow_right,
          size: 12,
          color: colors.accent,
        ),
        Text(point,
                maxLines: 2,
                style: style ?? AppTextStyles.regular12(color: colors.text3))
            .expand
      ],
    );
  }
}
