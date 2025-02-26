import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/Theme/theme_model.dart';


class CustomDottedWidget extends StatelessWidget {
  final Color? dotsColor;
  final bool isSelected ;
  final double? size;
  const CustomDottedWidget({super.key, this.dotsColor,  this.isSelected = false, this.size , });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size?.w ?? 16.w,
      height:size ??  16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotsColor ?? (isSelected?  ThemeFactory.of(context).primary : Colors.transparent ) ,
        border: Border.all(
          color: ThemeFactory.of(context).primary,
        )
      ), duration: const Duration(milliseconds: 400),

    );
  }
}
