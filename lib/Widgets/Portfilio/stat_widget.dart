import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/Animation/floating_animation_card.dart';

import '../../../../../Utilities/extensions.dart';

class StatsRow extends StatelessWidget {
  final List<Stat> items;
  final TextStyle? numStyle, titleStyle;

  const StatsRow({this.items = const [], this.numStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (!context.isSmall) {
      return Row(
        children: [
          ...List.generate(items.length, (e) {
            final borderR = e == 0
                ? BorderRadiusDirectional.only(
                    topStart: Radius.circular(cardRadius),
                    bottomStart: Radius.circular(cardRadius))
                : (e == items.length - 1)
                    ? BorderRadiusDirectional.only(
                        topEnd: Radius.circular(cardRadius),
                        bottomEnd: Radius.circular(cardRadius))
                    : BorderRadius.zero;
            return StatItem(
              item: items[e],
              borderRadius: borderR,
              titleStyle: titleStyle,
              numStyle: numStyle,
            ).expand;
          })
        ],
      );
    }
    return Column(
      children: [
        ...List.generate(items.length, (e) {
          final borderR = e == 0
              ? BorderRadiusDirectional.only(
                  topStart: Radius.circular(cardRadius),
                  topEnd: Radius.circular(cardRadius))
              : (e == items.length - 1)
                  ? BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(cardRadius),
                      bottomEnd: Radius.circular(cardRadius))
                  : BorderRadius.zero;
          return StatItem(
            item: items[e],
            borderRadius: borderR,
            titleStyle: titleStyle,
            numStyle: numStyle,
          );
        })
      ],
    );
  }
}
