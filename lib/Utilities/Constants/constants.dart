import 'package:flutter/material.dart';

Shadow get defaultShadow => Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.0,
      offset: const Offset(0, 4.0),
    );

BoxShadow get defaultBoxShadow => const BoxShadow(
      color: Color(0x40000000), // 25% opacity black
      offset: Offset(0, 4), // X: 0, Y: 4
      blurRadius: 4,
      spreadRadius: 0,
    );

const desktopHozPadding = 64.0;
const tabletHozPadding = 16.0;
const mobileHozPadding = 8.0;
const cardRadius = 20.0;
const smallButtonRadius = 6.0;
const mediumButtonRadius = 12.0;
const largeButtonRadius = 18.0;

const smallButtonIcon = 24.0;
const mediumButtonIcon = 28.0;
const largeButtonIcon = 36.0;

const smallButtonHeight = 32.0;
const mediumButtonHeight = 32.0;
const largeButtonHeight = 40.0;

const smallCardWidth = 160.0;
const mediumCardWidth = 180.0;
const largeCardWidth = 200.0;
