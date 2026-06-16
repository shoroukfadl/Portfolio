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
    return Text("• "+point,
        maxLines: 2,
        style:style??  AppTextStyles.cardBody(context:context,color: colors.text3))
    ;
  }
}
