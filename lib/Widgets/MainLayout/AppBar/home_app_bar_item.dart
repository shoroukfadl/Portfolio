import 'package:flutter/material.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Utilities/extensions.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;
  final bool selected;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    this.selected = false,
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final active = widget.selected || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                style: AppTextStyles.title(
                  context: context,
                  color: active ? colors.accent : colors.text2,
                ),
                child: Text(widget.title.toUpperCase()),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                height: 2,
                width: active ? 80 : 0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
