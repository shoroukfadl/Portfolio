// Place fonts/portfolio.otf in your fonts/ directory and
// add the following to your pubspec.yaml
//
// flutter:
//   fonts:
//    - family: portfolio
//      fonts:
//       - asset: fonts/portfolio.otf
import 'package:flutter/widgets.dart';

class Portfolio {
  Portfolio._();

  static const String _fontFamily = 'portfolio';

  static const IconData github = IconData(0xf000, fontFamily: _fontFamily);
  static const IconData cv = IconData(0xf003, fontFamily: _fontFamily);
  static const IconData shield = IconData(0xf004, fontFamily: _fontFamily);
  static const IconData theme = IconData(0xf005, fontFamily: _fontFamily);
  static const IconData bug = IconData(0xf007, fontFamily: _fontFamily);
  static const IconData box = IconData(0xf008, fontFamily: _fontFamily);
  static const IconData database = IconData(0xf009, fontFamily: _fontFamily);
  static const IconData email = IconData(0xf00a, fontFamily: _fontFamily);
  static const IconData link = IconData(0xf00b, fontFamily: _fontFamily);
  static const IconData magniferBug = IconData(0xf00c, fontFamily: _fontFamily);
  static const IconData phone1 = IconData(0xf00d, fontFamily: _fontFamily);
  static const IconData phone2 = IconData(0xf00e, fontFamily: _fontFamily);
  static const IconData linkedin = IconData(0xf00f, fontFamily: _fontFamily);
  static const IconData whatsapp = IconData(0xf010, fontFamily: _fontFamily);
}