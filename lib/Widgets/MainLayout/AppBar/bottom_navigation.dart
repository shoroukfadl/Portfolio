import 'package:flutter/material.dart';

import '../../../Utilities/Constants/constants.dart';
import '../../../Utilities/extensions.dart';
import '../../../Utilities/portifilo_icons.dart';

class HamburgerBtn extends StatelessWidget {
  final bool isOpen;
  final Function() onTap;

  const HamburgerBtn({super.key, 
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(
        large: largeButtonIcon,
        medium: mediumButtonIcon,
        small: smallButtonIcon);
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: colors.accentSoft.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Icon(isOpen ? Portfolio.close : Icons.menu,
              key: ValueKey<bool>(isOpen),
              color: colors.accentSoft,
              size: size / 1.5),
        ),
      ),
    );
  }
}
