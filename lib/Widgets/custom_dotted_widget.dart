import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../Utilities/extensions.dart';
import 'Custom/rounded_doted_widget.dart';

class CustomDottedWidget extends StatelessWidget {
  final Color? dotsColor;
  final bool isSelected;

  final double? size;

  const CustomDottedWidget({
    super.key,
    this.dotsColor,
    this.isSelected = false,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedContainer(
      width: size ?? 16,
      height: size ?? 16.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: dotsColor ?? (isSelected ? colors.accent : Colors.transparent),
          border: Border.all(
            color: colors.accent,
          )),
      duration: const Duration(milliseconds: 400),
    );
  }
}

class CustomDashedLineWidget extends StatelessWidget {
  final double innerRadius, padding, height;

  const CustomDashedLineWidget(
      {super.key, this.innerRadius = 16, this.padding = 8, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      children: [
        RoundedDotedWidget(
          innerRadius: innerRadius,
          padding: padding,
        ),
        DottedBorder(
          options: RectDottedBorderOptions(
            color: context.colors.text1,
            borderPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            strokeCap: StrokeCap.square,
            strokeWidth: 0.2,
          ),
          child: SizedBox(
            height: height,
          ),
        )
      ],
    );
  }
}
