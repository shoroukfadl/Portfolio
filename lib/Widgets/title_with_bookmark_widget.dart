import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Language/app_styles.dart';

class TitleWithBookmarkWidget extends StatelessWidget {
  final String? title;
  final double? bookmarkWidth, bookmarkHeight, bookmarkRadius;
  final TextStyle? titleStyle;
  final Color? bookmarkColor;

  const TitleWithBookmarkWidget(
      {super.key,
      this.title,
      this.bookmarkWidth,
      this.bookmarkHeight,
      this.titleStyle,
      this.bookmarkColor,
      this.bookmarkRadius});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(children: [
      Container(
        height: bookmarkHeight ?? 20,
        width: bookmarkWidth ?? 10,
        decoration: BoxDecoration(
          color: bookmarkColor ?? Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(bookmarkRadius ?? 4)),
        ),
      ),
      8.0.widthBox,
      Text(
        title ?? "",
        style: titleStyle ??
            AppTextStyles.regular14().copyWith(color: colors.text2),
      )
    ]);
  }
}
