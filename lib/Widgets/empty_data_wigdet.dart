import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Inputs/app_text_widget.dart';

import '../Core/Language/app_styles.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget(
      {super.key,
      this.title,
      this.svgIconPath,
      this.svgWidth,
      this.svgHeight,
      this.titleFontSize,
      this.subTitle,
      this.subTitleFontSize,
      this.actionButton});

  final String? title;
  final String? svgIconPath;
  final double? svgWidth;
  final double? svgHeight;
  final double? titleFontSize;
  final Widget? actionButton;
  final String? subTitle;
  final double? subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgIconPath ?? "",
          width: svgWidth ?? (context.isLarge ? 200 : 100),
          height: svgHeight ?? (context.isLarge ? 200 : 100),
        ),
        16.0.heightBox,
        AppTextWidget(
          title ?? "",
          style: AppTextStyles.regular14().copyWith(
              fontSize: titleFontSize ??
                  (context.isLarge
                      ? 20
                      : context.isMedium
                          ? 18
                          : 16),
              height: 1.4),
        ),
        if (subTitle != null)
          AppTextWidget(
            subTitle!,
            style: AppTextStyles.regular14().copyWith(
              fontSize: subTitleFontSize ?? 16,
              color: colors.text2,
              height: 1.4,
            ),
          ),
        if (actionButton != null) actionButton!.paddingSymmetric(vertical: 16),
      ],
    );
  }
}
