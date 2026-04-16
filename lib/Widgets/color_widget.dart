import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final String hexColor;
  final double radius;

  const ColorWidget({super.key, required this.hexColor, required this.radius});

  @override
  Widget build(BuildContext context) {
    final String colorCode = '0xff${hexColor.replaceFirst("#", "")}';
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(int.parse(colorCode)),
    );
  }
}
