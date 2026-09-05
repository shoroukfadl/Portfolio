import 'package:flutter/material.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Utilities/extensions.dart';

class InfoCardWidget extends StatelessWidget {
  final InfoCard item;
  final BorderRadiusGeometry borderRadius;

  const InfoCardWidget({
    super.key,
    required this.item,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
        height: 96,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: colors.border, width: 0.5),
        ),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(
                  item.icon,
                  color: item.iconColor,
                ),
                Text(
                  item.title ?? "",
                  style: AppTextStyles.hc1(
                    context: context,
                    color: colors.text1,
                  ),
                ),
              ],
            ),
            Text(
              item.description ?? "",
              style: AppTextStyles.bc1(
                context: context,
                color: colors.text2,
              ),
            ),
          ],
        ));
  }
}

class InfoCard {
  final String? title;
  final IconData? icon;
  final String? description;
  final Color? iconColor;

  const InfoCard({
    this.title,
    this.icon,
    this.description,
    this.iconColor,
  });
}
