import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/Animation/Summary/number_card_item.dart';

import '../../../../../Utilities/extensions.dart';

class StatsRow extends StatelessWidget {
  final List<Stat> items;
  final TextStyle? numStyle, titleStyle;

  const StatsRow({super.key, this.items = const [], this.numStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    if (!context.isSmall) {
      return Row(
        spacing: 8,
        children: [
          ...List.generate(items.length, (e) {
            final borderR = BorderRadiusDirectional.all(
              Radius.circular(cardRadius),
            );
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
