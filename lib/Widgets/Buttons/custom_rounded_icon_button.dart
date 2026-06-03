import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';

import '../icon_with_rounded_background_widget.dart';

class CustomRoundedIconButton extends StatelessWidget {
  final Function() onPressed;
  final String iconPath;
  final Color? color, iconColor;
  final double? iconSize, buttonSize;
  final bool showShadow;

  const CustomRoundedIconButton(
      {super.key,
      required this.onPressed,
      required this.iconPath,
      this.color,
      this.iconColor,
      this.iconSize,
      this.showShadow = false,
      this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: CustomIconWithBackgroundWidget(
          buttonSize: buttonSize,
          iconPath: iconPath,
          color: color,
          iconColor: iconColor,
          showShadow: showShadow,
          iconSize: iconSize,
        ));
  }
}

class CustomRoundedIconButtonWithAnimation extends StatefulWidget {
  final Function() onPressed;
  final String firstIconPath, secondedIconPath;
  final bool showFirst;
  final Color? color, iconColor;
  final double? iconSize, buttonSize;

  const CustomRoundedIconButtonWithAnimation({
    super.key,
    required this.onPressed,
    required this.firstIconPath,
    required this.secondedIconPath,
    this.color,
    this.iconColor,
    this.iconSize,
    this.showFirst = false,
    this.buttonSize,
  });

  @override
  State<CustomRoundedIconButtonWithAnimation> createState() =>
      _CustomRoundedIconButtonWithAnimationState();
}

class _CustomRoundedIconButtonWithAnimationState
    extends State<CustomRoundedIconButtonWithAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: IconButton(
        key: ValueKey<bool>(widget.showFirst), // Unique key based on the state
        onPressed: widget.onPressed,
        icon: Container(
          width: widget.buttonSize ?? 40,
          height: widget.buttonSize ?? 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: widget.color ?? Theme.of(context).cardColor,
            boxShadow: [defaultBoxShadow],
          ),
          child: SvgPicture.asset(
            widget.showFirst ? widget.firstIconPath : widget.secondedIconPath,
            width: widget.iconSize ?? 20,
            height: widget.iconSize ?? 20,
            colorFilter: ColorFilter.mode(
              widget.iconColor ?? Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
