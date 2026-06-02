import 'package:flutter/material.dart';

class Constants {
  static Shadow get defaultShadow => Shadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4.0,
        offset: const Offset(0, 4.0),
      );

  static BoxShadow get defaultBoxShadow => const BoxShadow(
        color: Color(0x40000000), // 25% opacity black
        offset: Offset(0, 4), // X: 0, Y: 4
        blurRadius: 4,
        spreadRadius: 0,
      );

  static const desktopHozPadding = 80.0;
  static const cardRadius = 20.0;
}
