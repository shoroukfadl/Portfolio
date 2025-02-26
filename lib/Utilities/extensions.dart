import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocklis/Core/Language/locales.dart';

extension StringExtensions on String {
  String get translate {
    return tr;
  }
}

extension WidgetsExtensions on Widget {
  Widget align(AlignmentDirectional position) => Align(
        alignment: position,
        child: this,
      );
  Widget get expand => Expanded(child: this);
  Widget expandFlex(int flex) => Expanded(flex: flex, child: this);
  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal.w,
        ),
        child: this,
      );
  Widget paddingAll({double padding = 0.0}) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
  Widget paddingOnly({
    double start = 0.0,
    double end = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.only(
            start: start.w, end: end.w, top: top, bottom: bottom),
        child: this,
      );
}

extension MapExtensions on Map {
  Map<String, String> dynamicMapToString() {
    Map<String, String> body = {};
    forEach((key, value) {
      if (value is List) {
        body.addAll(_mapListValueHandler(key, value));
      } else if (value is Map) {
        body.addAll(value.dynamicMapToString());
      } else if (value is DateTime) {
        body[key] = value.toIso8601String();
      } else if (value != null) {
        body[key] = value.toString();
      }
    });
    return body;
  }

  Map<String, String> _mapListValueHandler(String key, List iterator) {
    Map<String, String> result = {};
    for (var item in iterator) {
      result["$key[${iterator.indexOf(item)}]"] = item.toString();
    }
    return result;
  }
}

extension DoubleExtensions on double {
  Widget get heightBox => SizedBox(height: this);
  Widget get widthBox => SizedBox(width: this.w);
}

extension LayoutExtensions on BuildContext {
  bool get isLarge => MediaQuery.of(this).size.width > 1200;
  bool get isMedium =>
      MediaQuery.of(this).size.width > 768 &&
      MediaQuery.of(this).size.width <= 1200;
  bool get isSmall => MediaQuery.of(this).size.width <= 768;

  double get authDialogWidth => isLarge
      ? 450
      : isMedium
          ? 350
          : 300;
}
