// Place fonts/portifilo.otf in your fonts/ directory and
// add the following to your pubspec.yaml
//
// flutter:
//   fonts:
//    - family: portifilo
//      fonts:
//       - asset: fonts/portifilo.otf
import 'package:flutter/widgets.dart';

class Portfolio {
  Portfolio._();

  static const String _fontFamily = 'portifilo';

  static const IconData projects = IconData(0xf003, fontFamily: _fontFamily);
  static const IconData github = IconData(0xf00b, fontFamily: _fontFamily);
  static const IconData linkedIn = IconData(0xf004, fontFamily: _fontFamily);
  static const IconData download = IconData(0xf000, fontFamily: _fontFamily);
  static const IconData notification = IconData(0xf001, fontFamily: _fontFamily);
  static const IconData copy = IconData(0xf002, fontFamily: _fontFamily);
  static const IconData home = IconData(0xf005, fontFamily: _fontFamily);
  static const IconData link = IconData(0xf006, fontFamily: _fontFamily);
  static const IconData date = IconData(0xf007, fontFamily: _fontFamily);
  static const IconData email = IconData(0xf008, fontFamily: _fontFamily);
  static const IconData moon = IconData(0xf009, fontFamily: _fontFamily);
  static const IconData sun = IconData(0xf00a, fontFamily: _fontFamily);
  static const IconData work = IconData(0xf00d, fontFamily: _fontFamily);
  static const IconData check = IconData(0xf010, fontFamily: _fontFamily);
  static const IconData close = IconData(0xf011, fontFamily: _fontFamily);
  static const IconData skills = IconData(0xf012, fontFamily: _fontFamily);
  static const IconData phone = IconData(0xf015, fontFamily: _fontFamily);
  static const IconData edu = IconData(0xf018, fontFamily: _fontFamily);
}