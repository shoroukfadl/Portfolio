import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/Custom/interactive_widget.dart';

class SocialButtonWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color? btnColor, borderColor, iconColor;
  final void Function() onPressed;
  final String title;

  const SocialButtonWidget({
    super.key,
    required this.icon,
    this.size = 14,
    this.btnColor,
    this.borderColor,
    required this.onPressed,
    this.iconColor,
    required this.title,
  });

  @override
  State<SocialButtonWidget> createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: widget.onPressed,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InteractiveCard(
          child: (h) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 36,
                width: context.isLarge ? 120 : 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: h
                        ? LinearGradient(
                            colors: [colors.accent, colors.secondary])
                        : null,
                    border: Border.all(color: colors.border),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.icon,
                      color: h ? Colors.white : colors.text3,
                      size: 14,
                    ),
                    8.0.widthBox,
                    Text(
                      widget.title,
                      style: AppTextStyles.bl1(
                          context: context,
                          color: h ? Colors.white : colors.text3),
                    ),
                  ],
                ),
              )),
    );
  }
}
