import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Inputs/app_text_widget.dart';
import 'package:portfolio/Widgets/tooltip_widget.dart';

import '../../../Core/Language/app_styles.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style:AppTextStyles.semiBold14().copyWith(
          color: _isHovered ? const Color(0xFF00d9ff) : Colors.white70,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: AppTextStyles.semiBold14(
              color: _isHovered ?colors.accent: colors.textPrimary
            ),),
            if (_isHovered)
              Container(
                height: 2,
                width: 80,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    colors.accent,
                      colors.secondary
                    ],
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
