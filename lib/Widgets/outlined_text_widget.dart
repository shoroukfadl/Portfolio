import 'package:flutter/material.dart';
import 'package:rocklis/Core/Theme/theme_model.dart';

class OutlineText extends StatelessWidget {
  final Text child;
  final double strokeWidth;
  final Color? strokeColor;
  final TextOverflow? overflow;

  const OutlineText(this.child, {
    super.key,
    // default storke width
    this.strokeWidth = 2,
    this.strokeColor,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // stroke text
        Text(
          // need to set text scale if needed
          textScaleFactor: child.textScaleFactor,
          child.data!,
          style: TextStyle(
            fontFamily: child.style?.fontFamily,
            decorationStyle:  TextDecorationStyle.double,
            fontSize: child.style?.fontSize,
            fontWeight: child.style?.fontWeight,
            foreground: Paint()
             ..strokeJoin = StrokeJoin.round
              ..color = strokeColor ?? Theme
                  .of(context)
                  .shadowColor
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth,
          ),
          // handle overflow
          overflow: overflow,
        ),
        // original text
      ],
    );
  }
}