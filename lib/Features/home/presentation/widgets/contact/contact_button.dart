import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class ContactButton extends StatefulWidget {
  final double width, height, iconSize;
  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor, borderColor, iconColor;
  const ContactButton(
      {super.key,
      this.width = 32,
      this.height = 32,
      this.iconSize = 14,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.borderColor,
      this.iconColor});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool hover = false;
  void hovering(bool h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: AnimatedScale(
        scale: hover ? 1.02 : 1,
        duration: const Duration(milliseconds: 250),
        child: CustomButtonWidget(
          borderRadiusValue: 4,
          onPressed: widget.onTap,
          btnColor: widget.backgroundColor ?? Colors.transparent,
          borderColor: hover
              ? colors.accent
              : widget.borderColor ?? colors.text1.withValues(alpha: 0.7),
          width: widget.width,
          height: widget.height,
          child: Icon(
            widget.icon,
            color: hover
                ? colors.accent
                : widget.iconColor ?? colors.text1.withValues(alpha: 0.7),
            size: widget.iconSize,
          ),
        ),
      ),
    );
  }
}
