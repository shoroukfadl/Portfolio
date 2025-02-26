import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rocklis/Utilities/extensions.dart';

import '../Core/Theme/theme_model.dart';

class TextStyleHelper {
  final BuildContext context;
  const TextStyleHelper._(this.context);
  static TextStyleHelper of(BuildContext context) => TextStyleHelper._(context);
  _fontFamily() {
    return GoogleFonts.cairo;
  }

  TextStyle getTextStyle({required double fontSize, FontWeight? fontWeight}) =>
      _fontFamily()(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: ThemeFactory.of(context).font1,
        height: 1.0,
      );

  /// .......... extraBold .......... ///
  TextStyle get extraBold40 => getTextStyle(fontSize: 40, fontWeight: FontWeight.w800);
  TextStyle get extraBold32 => getTextStyle(fontSize: 32, fontWeight: FontWeight.w800);
  TextStyle get extraBold20 =>
      getTextStyle(fontSize: 20, fontWeight: FontWeight.w800);
  TextStyle get extraBold22 =>
      getTextStyle(fontSize: 22, fontWeight: FontWeight.w800);
  TextStyle get extraBold28 => getTextStyle(fontSize: 28, fontWeight: FontWeight.w800);
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
