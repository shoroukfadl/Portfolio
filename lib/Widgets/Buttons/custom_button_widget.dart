import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';
import '../Inputs/app_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;

  final double? width, height, borderRadiusValue;
  final String? title;
  final FocusNode? focusNode;
  final Widget? child;
  final Color? btnColor, titleColor, borderColor;

  const CustomButtonWidget(
      {super.key,
      this.width,
      this.height,
      this.title,
      this.onPressed,
      this.child,
      this.focusNode,
      this.borderRadiusValue,
      this.isLoading = false,
      this.btnColor,
      this.borderColor,
      this.titleColor});

  const CustomButtonWidget.outLined(
      {super.key,
      this.width,
      this.height,
      this.title,
      this.onPressed,
      this.child,
      this.focusNode,
      this.borderRadiusValue,
      this.isLoading = false,
      this.borderColor,
      this.titleColor})
      : btnColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      focusNode: focusNode,
      onTap: () => handleTap(
        context: context,
        isLoading: isLoading,
        onPressed: onPressed,
      ),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 36.0,
        width: width ?? 108.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 100.0),
          color: btnColor ?? colors.accent,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading
            ? Center(
                child:
                    SpinKitThreeBounce(color: colors.textOnAccent, size: 24.0))
            : child ??
                AppTextWidget(
                  title ?? "",
                  style: AppTextStyles.bodyM()
                      .copyWith(color: titleColor ?? colors.textPrimary),
                ),
      ),
    );
  }

  void handleTap({
    required BuildContext context,
    required bool isLoading,
    VoidCallback? onPressed,
  }) {
    if (isLoading) return;
    onPressed?.call();
  }
}
