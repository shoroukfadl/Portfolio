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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: colors.secondary,
          child: const SizedBox(
            height: 4,
            width: 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        Text(point,
                maxLines: 4,
                style: style ??
                    AppTextStyles.cardBody(
                        context: context, color: colors.text2))
            .expand
      ],
    ).paddingOnly(bottom: 4);
  }
}
