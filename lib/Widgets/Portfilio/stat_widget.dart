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
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.accent),
      ),
      child: Wrap(
        spacing: 32,
        children: items
            .map((s) => StatItem(
                  item: s,
                  titleStyle: titleStyle,
                  numStyle: numStyle,
                ))
            .toList(),
      ),
    );
  }
}

// ──────────────────────────────────────────
//  SINGLE STAT
// ──────────────────────────────────────────
class StatItem extends StatelessWidget {
  final Stat item;
  final TextStyle? numStyle, titleStyle;

  const StatItem({
    required this.item,
    this.numStyle,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient number
        AnimatedCounter(
          targetNumber: item.value ?? 0.0,
          subtitle: item.subTitle,
          style: numStyle,
        ),
        const SizedBox(height: 5),
        Text(item.name?.toUpperCase() ?? "", style: (titleStyle)),
        SizedBox(
          width: 100,
          child: DividerWidget(
            thickness: 2,
            color: colors.accent,
          ),
        )
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
