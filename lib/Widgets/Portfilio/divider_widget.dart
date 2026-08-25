import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class DividerWidget extends StatelessWidget {
  final double thickness;
  final Color? color;

  const DividerWidget({super.key, this.thickness = 1, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color ?? context.colors.text3,
    );
  }
}

class VerticalGradientDivider extends StatefulWidget {
  final double? width, height;
  final Color color1, color2;
  final int repation;
  final AlignmentGeometry begin, end;

  const VerticalGradientDivider(
      {super.key,
      this.begin = AlignmentGeometry.topCenter,
      this.end = AlignmentGeometry.topEnd,
      this.width,
      this.height,
      required this.color1,
      required this.color2,
      this.repation = 1});

  @override
  State<VerticalGradientDivider> createState() =>
      _VerticalGradientDividerState();
}

class _VerticalGradientDividerState extends State<VerticalGradientDivider> {
  List<Color> getColorsList() {
    final List<Color> colors = [];
    for (int i = 0; i < widget.repation; i++) {
      if (i % 2 == 0)
        colors.add(widget.color1);
      else
        colors.add(widget.color2);
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 0.4,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
              begin: widget.begin,
              end: widget.end,
              colors: [...getColorsList()])),
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  final double? width, height;
  final Color color;

  const VerticalDividerWidget({
    super.key,
    this.width,
    this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.4,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
    );
  }
}
