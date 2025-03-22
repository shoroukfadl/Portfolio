import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Core/Language/app_languages.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Theme/theme_model.dart';

class TextStyleHandler {
  final BuildContext context;
  const TextStyleHandler._(this.context);
  static TextStyleHandler of(BuildContext context) =>
      TextStyleHandler._(context);
  _fontFamily() {
    return appLangIsArabic(context: context) ? GoogleFonts.cairo : GoogleFonts.sora;
  }

  TextStyle getTextStyle({required double fontSize, FontWeight? fontWeight}) =>
      _fontFamily()(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: ThemeFactory.of(context).font1,
        height: 1.4,
      );

  /// ************************** Display text ************************* ///
  TextStyle get displayTextStyleRegular48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  TextStyle get displayTextStyleSemiBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w600);
  TextStyle get displayTextStyleBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.bold);
  TextStyle get displayTextStyleExtraBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w800);


  TextStyle get displayTextStyleRegular32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w400);
  TextStyle get displayTextStyleSemiBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  TextStyle get displayTextStyleBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle get displayTextStyleExtraBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w800);


  TextStyle get displayTextStyleRegular24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle get displayTextStyleSemiBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  TextStyle get displayTextStyleBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get displayTextStyleExtraBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  /// ************************** Outlined text ************************* ///
  TextStyle get outLinedTextStyleRegular48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w400).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
  TextStyle get outLinedTextStyleSemiBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w600).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
  TextStyle get outLinedTextStyleBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.bold).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
  TextStyle get outLinedTextStyleExtraBold48 =>
      getTextStyle(fontSize: 48, fontWeight: FontWeight.w800).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );


  TextStyle get outLinedTextStyleRegular32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w400).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
  TextStyle get outLinedTextStyleSemiBold32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w600).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
  TextStyle get outLinedTextStyleBold32=>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.bold).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
  TextStyle get outLinedTextStyleExtraBold32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w800).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );


  TextStyle get outLinedTextStyleRegular24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w400).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4,
      );
  TextStyle get outLinedTextStyleSemiBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w600).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4,
      );
  TextStyle get outLinedTextStyleBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.bold).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4,
      );
  TextStyle get outLinedTextStyleExtraBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w800).copyWith(
        foreground: Paint()
          ..strokeJoin = StrokeJoin.round
          ..color = ThemeFactory.of(context).font1
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4,
      );


  /// ************************** Sub Heading text ************************* ///
  TextStyle get subHeadingTextStyleRegular => getTextStyle(fontSize: 40, fontWeight: FontWeight.w400);
  TextStyle get subHeadingTextStyleSemiBold => getTextStyle(fontSize: 40, fontWeight: FontWeight.w600);
  TextStyle get subHeadingTextStyleBold => getTextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  TextStyle get subHeadingTextStyleExtraBold => getTextStyle(fontSize: 40, fontWeight: FontWeight.w800);



  /// **************************  Heading H text ************************* ///
  TextStyle get headingTextStyleRegular36 => getTextStyle(fontSize: 36, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold36 => getTextStyle(fontSize: 36, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold36 => getTextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold36 => getTextStyle(fontSize: 36, fontWeight: FontWeight.w800);

  TextStyle get headingTextStyleRegular32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w800);

  TextStyle get headingTextStyleRegular28 => getTextStyle(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold28 => getTextStyle(fontSize: 28, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold28 => getTextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold28 => getTextStyle(fontSize: 28, fontWeight: FontWeight.w800);


  TextStyle get headingTextStyleRegular24 => getTextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold24 => getTextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold24 => getTextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold24 => getTextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  TextStyle get headingTextStyleRegular20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  TextStyle get headingTextStyleRegular16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w800);


  TextStyle get headingTextStyleRegular14 => getTextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold14 => getTextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold14 => getTextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold14 => getTextStyle(fontSize: 14, fontWeight: FontWeight.w800);


  TextStyle get headingTextStyleRegular12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle get headingTextStyleSemiBold12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  TextStyle get headingTextStyleBold12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle get headingTextStyleExtraBold12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.w800);

  /// **************************  Heading H text ************************* ///
  TextStyle get paragraphTextStyleRegular20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle get paragraphTextStyleSemiBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle get paragraphTextStyleBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get paragraphTextStyleExtraBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  TextStyle get paragraphTextStyleRegular16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle get paragraphTextStyleRegular14 => getTextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle get paragraphTextStyleSemiBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get paragraphTextStyleBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get paragraphTextStyleExtraBold16=> getTextStyle(fontSize: 16, fontWeight: FontWeight.w800);

  TextStyle get paragraphTextStyleRegular12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle get paragraphTextStyleSemiBold12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  TextStyle get paragraphTextStyleBold12 => getTextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle get paragraphTextStyleExtraBold12=> getTextStyle(fontSize: 12, fontWeight: FontWeight.w800);



  /// **************************  Button  text ************************* ///
  TextStyle get buttonTextStyleRegular20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle get buttonTextStyleSemiBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle get buttonTextStyleBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get buttonTextStyleExtraBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  TextStyle get buttonTextStyleRegular16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle get buttonTextStyleSemiBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get buttonTextStyleBold16 => getTextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get buttonTextStyleExtraBold16=> getTextStyle(fontSize: 16, fontWeight: FontWeight.w800);


  /// **************************  underline  text ************************* ///
  TextStyle get underlineTextStyleRegular20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle get underlineTextStyleSemiBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle get underlineTextStyleBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get underlineTextStyleExtraBold20 => getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);



  /// .......... extraBold .......... ///
  TextStyle get extraBold40 =>
      getTextStyle(fontSize: 40, fontWeight: FontWeight.w800);
  TextStyle get extraBold32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w800);
  TextStyle get extraBold20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);
  TextStyle get extraBold22 =>
      getTextStyle(fontSize: 22, fontWeight: FontWeight.w800);
  TextStyle get extraBold28 =>
      getTextStyle(fontSize: 28, fontWeight: FontWeight.w800);
  TextStyle get extraBold26 =>
      getTextStyle(fontSize: 26, fontWeight: FontWeight.w800);

  TextStyle get extraBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  TextStyle get extraBold18 =>
      getTextStyle(fontSize: 18, fontWeight: FontWeight.w800);
  TextStyle get extraBold16 =>
      getTextStyle(fontSize: 16, fontWeight: FontWeight.w800);
  TextStyle get extraBold14 =>
      getTextStyle(fontSize: 14, fontWeight: FontWeight.w800);
  TextStyle get extraBold8 =>
      getTextStyle(fontSize: 8, fontWeight: FontWeight.w800);

  /// .......... Bold .......... ///
  TextStyle get bold32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle get bold28 =>
      getTextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  TextStyle get bold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get bold22 =>
      getTextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle get bold20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get bold16 =>
      getTextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get bold18 =>
      getTextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle get bold14 =>
      getTextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  TextStyle get bold12 =>
      getTextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  TextStyle get bold10 =>
      getTextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  TextStyle get bold9 => getTextStyle(fontSize: 9, fontWeight: FontWeight.bold);

  /// .......... SemiBold .......... ///
  TextStyle get semiBold40 =>
      getTextStyle(fontSize: 40, fontWeight: FontWeight.w600);
  TextStyle get semiBold32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  TextStyle get semiBold24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  TextStyle get semiBold28 =>
      getTextStyle(fontSize: 28, fontWeight: FontWeight.w600);
  TextStyle get semiBold22 =>
      getTextStyle(fontSize: 22, fontWeight: FontWeight.w600);
  TextStyle get semiBold20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  TextStyle get semiBold18 =>
      getTextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  TextStyle get semiBold16 =>
      getTextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  TextStyle get semiBold14 =>
      getTextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle get semiBold12 =>
      getTextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  TextStyle get semiBold10 =>
      getTextStyle(fontSize: 10, fontWeight: FontWeight.w600);
  TextStyle get semiBold8 =>
      getTextStyle(fontSize: 8, fontWeight: FontWeight.w600);

  /// .......... Medium .......... ///
  TextStyle get medium36 =>
      getTextStyle(fontSize: 36, fontWeight: FontWeight.w500);
  TextStyle get medium32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w500);
  TextStyle get medium30 =>
      getTextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  TextStyle get medium22 =>
      getTextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  TextStyle get medium20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  TextStyle get medium18 =>
      getTextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle get medium8 =>
      getTextStyle(fontSize: 8, fontWeight: FontWeight.w500);

  TextStyle get medium16 =>
      getTextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle get medium14 =>
      getTextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  TextStyle get medium12 =>
      getTextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  /// .......... Regular .......... ///
  TextStyle get regular32 =>
      getTextStyle(fontSize: 32, fontWeight: FontWeight.w400);

  TextStyle get regular28 =>
      getTextStyle(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle get regular20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle get regular24 =>
      getTextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle get regular16 =>
      getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle get regular18 =>
      getTextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle get regular14 =>
      getTextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle get regular12 =>
      getTextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle get regular10 =>
      getTextStyle(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle get regular8 =>
      getTextStyle(fontSize: 8, fontWeight: FontWeight.w400);

  /*  TextStyle textFormFieldTitle(BuildContext context) {
    return context.isSmall
        ? getTextStyle(fontSize: 12, fontWeight: FontWeight.w400)
        : getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  } */

  TextStyle get textFormFieldLableTitle => context.isSmall
      ? getTextStyle(fontSize: 12, fontWeight: FontWeight.w400)
      : context.isMedium
          ? getTextStyle(fontSize: 14, fontWeight: FontWeight.w400)
          : getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get textFormFieldErrorMessage => context.isSmall
      ? getTextStyle(fontSize: 10, fontWeight: FontWeight.w400)
      : context.isMedium
          ? getTextStyle(fontSize: 12, fontWeight: FontWeight.w400)
          : getTextStyle(fontSize: 12, fontWeight: FontWeight.w400);

  TextStyle get textFormFieldHint => context.isSmall
      ? getTextStyle(fontSize: 12, fontWeight: FontWeight.w400)
      : context.isMedium
          ? getTextStyle(fontSize: 14, fontWeight: FontWeight.w400)
          : getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get textFormFieldContent => context.isSmall
      ? getTextStyle(fontSize: 12, fontWeight: FontWeight.w400)
      : context.isMedium
          ? getTextStyle(fontSize: 14, fontWeight: FontWeight.w400)
          : getTextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}
