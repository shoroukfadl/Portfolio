import 'package:flutter/material.dart';

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
    final colors=context.colors;
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: colors.danger.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: colors.danger, size: 18),
        ),
      ),
    );
  }
}