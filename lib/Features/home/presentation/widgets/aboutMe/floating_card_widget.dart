import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Animation/floating_animation_card.dart';

class FloatingCards extends StatelessWidget {
  const FloatingCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (!context.isSmall) {
      return Row(
        children: [
          ...List.generate(items(colors: colors).length, (e) {
            final borderR = e == 0
                ? BorderRadiusDirectional.only(
                    topStart: Radius.circular(cardRadius),
                    bottomStart: Radius.circular(cardRadius))
                : (e == items(colors: colors).length - 1)
                    ? BorderRadiusDirectional.only(
                        topEnd: Radius.circular(cardRadius),
                        bottomEnd: Radius.circular(cardRadius))
                    : BorderRadius.zero;
            return InfoCardWidget(
              item: items(colors: colors)[e],
              borderRadius: borderR,
            ).expand;
          })
        ],
      );
    }
    return Column(
      children: [
        ...List.generate(items(colors: colors).length, (e) {
          final borderR = e == 0
              ? BorderRadiusDirectional.only(
                  topStart: Radius.circular(cardRadius),
                  topEnd: Radius.circular(cardRadius))
              : (e == items(colors: colors).length - 1)
                  ? BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(cardRadius),
                      bottomEnd: Radius.circular(cardRadius))
                  : BorderRadius.zero;
          return InfoCardWidget(
            item: items(colors: colors)[e],
            borderRadius: borderR,
          );
        })
      ],
    );
  }

  List<InfoCard> items({
    required AppColors colors,
  }) =>
      [
        InfoCard(
          title: 'Focused',
          description: 'Pixel-perfect apps with attention to detail',
          iconColor: colors.accent,
          icon: Icons.check,
        ),
        InfoCard(
          title: 'Fast',
          description: 'Optimized performance and smooth 60fps animations',
          iconColor: colors.warning,
          icon: Icons.flash_on_outlined,
        ),
        InfoCard(
          title: 'Modern',
          description: 'Latest Flutter patterns and best practices',
          iconColor: colors.secondary,
          icon: Icons.rocket_launch_outlined,
        ),
      ];
}
