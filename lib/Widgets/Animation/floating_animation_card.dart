import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';

class AnimatedCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final Color iconColor;

  const AnimatedCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.matchedSize(
        large: largeCardWidth, medium: mediumCardWidth, small: smallCardWidth);

    final colors = context.colors;
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text(
          title,
          style: AppTextStyles.titleCard(
            context: context,
            color: colors.text1,
          ),
        ),
        Text(
          description,
          style: AppTextStyles.cardBodyL(
            context: context,
            color: colors.text2,
          ),
        ),
      ],
    );
  }
}
