import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

mixin LayoutHandlerMixin {
  // bool isSmallScreen(BuildContext context) =>
  //     1.sw <= 768;
  //
  // bool isMediumScreen(BuildContext context) =>
  //     1.sw <= 1200 &&
  //     1.sw > 768;

  Widget buildLayout(BuildContext context) {
    print("herrr ,,,,");
    return LayoutBuilder(builder: (context, constraints) {
      if (context.isSmall) {
    print("herrr ,,,, Small");
        return buildSmallScreen();
      } else if (context.isMedium) {
    print("herrr ,,,, Medium");
        return buildMediumScreen();
      } else {
    print("herrr ,,,, Large");
        return buildLargeScreen();
      }
    });
  }
  /* Widget buildLayout(BuildContext context, {double? additionWidth}) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth + (additionWidth ?? 0);
      if (width <= 768) {
        return buildSmallScreen();
      } else if (width <= 1200 && width > 768) {
        return buildMediumScreen();
      } else {
        return buildLargeScreen();
      }
    });
  } */

  Widget buildLargeScreen();

  Widget buildMediumScreen();

  Widget buildSmallScreen();
}
