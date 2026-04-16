import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Inputs/app_text_widget.dart';

import '../../../Core/Language/app_styles.dart';

class HomeAppBarItem extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final String title;
  final IconData icon;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    this.isSelected = false,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Row(
        spacing: 4,
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected ? colors.accent : colors.textSecondary,
          ),
          AppTextWidget(
            title,
            style: AppTextStyles.labelM(
                color: isSelected ? colors.accent : colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
