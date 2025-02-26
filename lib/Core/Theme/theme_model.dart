import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';

class ThemeFactory {
  static ThemeFactory of(BuildContext context) =>
      Provider.of<ThemeProvider>(context, listen: false).isDark
          ? ThemeFactory.dark()
          : ThemeFactory.light();
  static ThemeFactory get defaultTheme {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark
        ? ThemeFactory.dark()
        : ThemeFactory.light();
  }

  static const constFont1 = Color(0xFFF0F0F2);
  final Color primary;
  final Color primary75;
  final Color primary25;
  final Color darkPrimary;
  final Color backgroundColor;
  final Color blackWhiteColor;
  final Color card;
  final Color subCard;
  final Color tableBackground;
  final Color font1;
  final Color font2;
  final Color font3;
  final Color font4;
  final Color fontWhite;
  final Color additional;
  final Color danger;
  final Color successColor;
  final Color dividerColor;
  final Color yellow;
  final Color black;
  final Color grayColor;
  final Color angry;
  final Color sad;
  final Color like;
  final Color love;
  final Color wow;
  final Color blackGray;

  ThemeFactory.light({
    this.angry = const  Color(0xffFF6722),
    this.sad = const  Color(0xffFFAE35),
    this.like = const  Color(0xff096CD2),
    this.love = const  Color(0xffEB001B),
    this.wow = const  Color(0xffFFAE35),
    this.primary = const Color(0xffC6352E),
    this.primary75 = const Color(0xffD46862),
    this.primary25 = const Color(0xffF0CCCA),
    this.darkPrimary = const Color(0xff601A16),
    this.yellow = const Color(0xfffacf21),
    this.tableBackground = const Color(0xffEFEFEF),
    this.backgroundColor = const Color(0xffFFFFFF),
    this.blackWhiteColor = const Color(0xff000000),
    this.card = const Color(0xFFFFFFFF), //
    this.subCard = const Color(0xFFF1F1F1), //
    this.font1 = const Color(0xff000000), //
    this.font2 = const Color(0xFF7A7A7A), //
    this.fontWhite = const Color(0xFFFFFFFF), //
    this.font3 = const Color(0xFF5C5F68), //
    this.font4 = const Color(0xFF97A1AD), //
    this.additional = const Color(0xFFFACF21),
    this.danger = const Color(0xFFF04940), //
    this.successColor = const Color(0xff2DB224),
    this.dividerColor = const Color(0xFFE4E7E9),
    this.grayColor = const Color(0xFFD7D7D7),
    this.black = const Color(0xff000000),
    this.blackGray = const Color(0xff212121),
  }); // Safety check

  /// Handle Dark Theme Color
  ThemeFactory.dark({
    this.primary = const Color(0xffC6352E),
    this.primary75 = const Color(0xffD46862),
    this.primary25 = const Color(0xffF0CCCA),
    this.darkPrimary = const Color(0xff601A16),
    this.backgroundColor = const Color(0xffFFFFFF),
    this.blackWhiteColor = const Color(0xff000000),
    this.yellow = const Color(0xfffacf21),
    this.card = const Color(0xFFFFFFFF), //
    this.subCard = const Color(0xFFF1F1F1), //
    this.font1 = const Color(0xff000000), //
    this.font2 = const Color(0xFF7A7A7A), //
    this.fontWhite = const Color(0xFFFFFFFF), //
    this.font3 = const Color(0xFF5C5F68), //
    this.font4 = const Color(0xFF97A1AD), //
    this.additional = const Color(0xFFFACF21),
    this.danger = const Color(0xFFF04940), //
    this.successColor = const Color(0xff2DB224),
    this.dividerColor = const Color(0xFFE4E7E9),
    this.grayColor = const Color(0xFFD7D7D7),
    this.tableBackground = const Color(0xffEFEFEF),
    this.black = const Color(0xff000000),
    this.angry = const  Color(0xffFF6722),
    this.sad = const  Color(0xffFFAE35),
    this.like = const  Color(0xff096CD2),
    this.love = const  Color(0xffEB001B),
    this.wow = const  Color(0xffFFAE35),
    this.blackGray = const Color(0xff212121),
  }); // Safety check
}
