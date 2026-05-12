import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final IconData icon;
  final String label;
  final bool isSelected;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.icon,
    this.label = "",
    this.isSelected=false
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final activeColor = colors.accent;
    final idleColor = colors.surface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.icon,
                  color: _isHovered || widget.isSelected ? activeColor : idleColor,
                  size: 20,
                ),
              ),

              const SizedBox(height: 4),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: _isHovered || widget.isSelected ? 20 : 0, // يتمدد من 0 إلى 20
                height: 3,
                decoration: BoxDecoration(
                  color: activeColor,
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
