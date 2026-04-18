import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import '../Core/Language/app_languages.dart';
import '../Core/Language/app_styles.dart';
import '../Utilities/extensions.dart';
import 'Inputs/app_text_widget.dart';
import 'hover_widget.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({
    required this.toolTipTitle,
    required this.child,
    super.key,
    this.toolTipPosition,
  });

  final String toolTipTitle;
  final Widget child;
  final TooltipDirection? toolTipPosition;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return HoverWidget(
      builder: (hovered) {
        return SimpleTooltip(
          arrowLength: 6,
          animationDuration: const Duration(milliseconds: 150),
          show: hovered,
          tooltipDirection: toolTipPosition ??
              (!appLangIsArabic(context: context)
                  ? TooltipDirection.right
                  : TooltipDirection.left),
          content: AppTextWidget(
            toolTipTitle,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular10().copyWith(
              decorationThickness: 0,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          arrowBaseWidth: 10,
          arrowTipDistance: 0,
          borderWidth: 1,
          borderColor: colors.background,
          maxHeight: 60,
          minHeight: 20,
          minimumOutSidePadding: 0,
          ballonPadding: EdgeInsets.zero,
          hideOnTooltipTap: true,
          child: child,
        );
      },
    );
  }
}
