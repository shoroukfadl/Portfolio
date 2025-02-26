import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Core/Theme/theme_model.dart';
import '../Utilities/text_style_helper.dart';
import 'app_text_widget.dart';

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
    return InkWell(
      focusNode: focusNode,
      onTap: () => handleTap(
        context: context,
        isLoading: isLoading,
        onPressed: onPressed,
      ),
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 36.0,
        width: width ?? 108.0.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.0),
          color: btnColor ?? ThemeFactory.of(context).primary,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading
            ? Center(
                child: SpinKitThreeBounce(
                    color: ThemeFactory.of(context).fontWhite, size: 24.0))
            : child ??
                AppTextWidget(
                  title ?? "",
                  style: TextStyleHelper.of(context)
                      .regular16
                      .copyWith(color: titleColor ?? ThemeFactory.constFont1),
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
