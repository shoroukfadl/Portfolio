import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';

import '../../Utilities/extensions.dart';

class IconToolTipButtonWidget extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const IconToolTipButtonWidget({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Tooltip(
      decoration: BoxDecoration(
          color: colors.text3, borderRadius: BorderRadius.circular(100)),
      textStyle:
          AppTextStyles.titleCardSmall(context: context, color: Colors.white),
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
