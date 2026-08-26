import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Animation/animated_counter.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';

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
          border: Border.all(color: colors.text3, width: 0.5),
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
                  style: AppTextStyles.titleCard(
                    context: context,
                    color: colors.text1,
                  ),
                ),
              ],
            ),
            Text(
              item.description ?? "",
              style: AppTextStyles.cardBodyL(
                context: context,
                color: colors.text2,
              ),
            ),
          ],
        ));
  }
}

class StatItem extends StatelessWidget {
  final Stat item;
  final BorderRadiusGeometry borderRadius;

  final TextStyle? numStyle, titleStyle;

  const StatItem({
    required this.item,
    this.numStyle,
    this.titleStyle,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 88,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: colors.text3, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCounter(
            targetNumber: item.value ?? 0.0,
            subtitle: item.subTitle,
            style: numStyle,
          ),
          const SizedBox(height: 6),
          Text(item.name?.toUpperCase() ?? "", style: (titleStyle)),
        ],
      ),
    );
  }
}

class Stat {
  final String? name;
  final String? subTitle;
  final double? value;

  const Stat({this.name, this.value, this.subTitle});
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
