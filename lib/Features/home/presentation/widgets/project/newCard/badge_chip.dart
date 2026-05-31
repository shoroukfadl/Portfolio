import 'package:flutter/material.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Core/Theme/theme_colors.dart';
import '../../../../../../Utilities/Constants/enums.dart';

class BadgeChip extends StatelessWidget {
  final BadgeType type;
  const BadgeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (type) {
      BadgeType.app        => ('App',        AppColors.appBadgeBg,    AppColors.appBadgeText),
      BadgeType.web        => ('Web',        AppColors.webBadgeBg,    AppColors.webBadgeText),
      BadgeType.ecomm      => ('E-Commerce', AppColors.ecommBadgeBg,  AppColors.ecommBadgeText),
      BadgeType.health     => ('Healthcare', AppColors.healthBadgeBg, AppColors.healthBadgeText),
      BadgeType.enterprise => ('Enterprise', AppColors.webBadgeBg,    AppColors.webBadgeText),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label.toUpperCase(),
        style:  AppTextStyles.medium10(color: fg),
      ),
    );
  }
}