import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Theme/theme_model.dart';
import '../Utilities/text_style_helper.dart';

class TitleWithBookmarkWidget extends StatelessWidget {
  final String? title;
  final double? bookmarkWidth , bookmarkHeight , bookmarkRadius;
  final TextStyle? titleStyle;
  final Color? bookmarkColor;
  const TitleWithBookmarkWidget({super.key,  this.title, this.bookmarkWidth, this.bookmarkHeight, this.titleStyle, this.bookmarkColor, this.bookmarkRadius});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height:bookmarkHeight?? 20,
          width:bookmarkWidth?.w ?? 10.w,
          decoration: BoxDecoration(
            color: bookmarkColor ?? ThemeFactory.of(context).fontWhite,
            borderRadius:  BorderRadius.all(Radius.circular(bookmarkRadius ??4)),
          ),
        ),
        8.0.widthBox,
        Text(
         title ?? "",
          style:titleStyle?? TextStyleHandler.of(context)
              .bold16
              .copyWith(color: ThemeFactory.of(context).fontWhite),
        )
        ]
    );
  }
}
