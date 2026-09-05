import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/Constants/constants.dart';
import '../../Utilities/extensions.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;
  final Function(bool hover)? onHover;
  final EdgeInsets? padding;
  final double? width, height, borderRadiusValue;
  final String? title;
  final FocusNode? focusNode;
  final Widget? child;
  final Color? btnColor, titleColor, borderColor;
  final BoxShadow? shadow;

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
      this.titleColor,
      this.padding,
      this.onHover,
      this.shadow});

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
      this.onHover,
      this.borderColor,
      this.shadow,
      this.padding,
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
      onHover: onHover,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        alignment: Alignment.center,
        height: height ?? 36.0,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          boxShadow: shadow == null ? null : [shadow!],
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 100.0),
          color: btnColor ?? colors.accent,
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading
            ? Center(child: SpinKitThreeBounce(color: colors.text2, size: 24.0))
            : child ??
                Text(
                  title ?? "",
                  style: AppTextStyles.hc1(
                      context: context, color: titleColor ?? colors.text1),
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

class CustomZaraButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  final bool active;

  const CustomZaraButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.active = false});

  @override
  State<CustomZaraButton> createState() => _CustomZaraButtonState();
}

class _CustomZaraButtonState extends State<CustomZaraButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final iconSize = context.matchedSize(
      large: largeButtonIcon,
      medium: mediumButtonIcon,
      small: smallButtonIcon,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          height: iconSize,
          width: iconSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: widget.active
                ? colors.accentSoft
                : _hovered
                    ? colors.border.withValues(alpha: 0.3)
                    : colors.background,
            border: Border.all(
              color: widget.active ? colors.accentSoft : colors.accent,
            ),
          ),
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: _hovered ? 0.083 : 0,
            curve: Curves.easeOut,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                widget.icon,
                size: iconSize / 2,
                color: widget.active ? Colors.white : colors.accent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
