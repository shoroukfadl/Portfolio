import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Language/app_styles.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;
  final IconData icon;
  final TextStyle? titleStyle;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.titleStyle,
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: _isHovered
              ? colors.accent.withValues(alpha: 0.2)
              : Colors.transparent,
          child: Row(
            spacing: 12,
            children: [
              Icon(widget.icon,
                  size: 14, color: _isHovered ? colors.accent : colors.text1),
              Text(
                widget.title,
                style: AppTextStyles.medium12(
                    color: _isHovered ? colors.accent : colors.text1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
