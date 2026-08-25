import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

import '../../../../../Utilities/extensions.dart';
import '../Animation/animated_counter.dart';

class StatsRow extends StatelessWidget {
  final List<Stat> items;
  final TextStyle? numStyle, titleStyle;

  const StatsRow({this.items = const [], this.numStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.text3, width: 0.5),
      ),
      child: Wrap(
          spacing: 32,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: List.generate(
              items.length,
              (e) => StatItem(
                    item: items[e],
                    enableDiv: e != items.length - 1,
                    titleStyle: titleStyle,
                    numStyle: numStyle,
                  ))),
    );
  }
}

// ──────────────────────────────────────────
//  SINGLE STAT
// ──────────────────────────────────────────
class StatItem extends StatelessWidget {
  final Stat item;
  final bool enableDiv;
  final TextStyle? numStyle, titleStyle;

  const StatItem(
      {required this.item,
      this.numStyle,
      this.titleStyle,
      this.enableDiv = true});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 40,
      children: [
        // Gradient number
        Column(
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
        0.0.widthBox,
        if (enableDiv)
          VerticalDividerWidget(
            height: 120,
            color: colors.text3,
          ),
      ],
    );
  }
}

class Stat {
  final String? name;
  final String? subTitle;
  final double? value;

  const Stat({this.name, this.value, this.subTitle});
}
