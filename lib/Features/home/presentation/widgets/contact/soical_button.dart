import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class SocialButtonWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color? btnColor, borderColor, iconColor;
  final void Function() onPressed;

  const SocialButtonWidget({
    super.key,
    required this.icon,
    this.size = 20,
    this.btnColor,
    this.borderColor,
    required this.onPressed,
    this.iconColor,
  });

  @override
  State<SocialButtonWidget> createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        hoverColor: Colors.transparent,
        child: AnimatedRotation(
          turns: isHovered ? 1.0 : 0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Container(
            width: widget.size * 2,
            height: widget.size * 2,
            decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(100)),
                border: widget.borderColor == null
                    ? null
                    : Border.all(
                        color: widget.borderColor!,
                      ),
                color: widget.btnColor ?? colors.secondary,
                boxShadow: !isHovered
                    ? null
                    : [
                        BoxShadow(
                          color: colors.accent.withValues(alpha: 0.3),
                          spreadRadius: 2,
                        )
                      ]),
            child: Icon(
              widget.icon,
              color: widget.iconColor ?? Colors.white,
              size: widget.size,
            ),
          ),
        ),
      ),
    );
  }
}
