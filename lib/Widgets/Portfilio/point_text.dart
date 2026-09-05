import 'package:flutter/material.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';

class PointText extends StatelessWidget {
  final String point;
  final TextStyle? style;

  const PointText({super.key, required this.point, this.style});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      children: [
        CircleAvatar(
          backgroundColor: colors.secondary,
          radius: 3,
        ),
        Text(point,
                maxLines: 4,
                style: style ??
                    AppTextStyles.bc2(context: context, color: colors.text2))
            .expand
      ],
    ).paddingOnly(bottom: 4);
  }
}
