import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final IconData icon;
  final String label; // أضفت نص بجانب الأيقونة إذا أردت

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.icon,
    this.label = "",
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // الألوان بناءً على حالة الـ Hover
    final activeColor = colors.accent; // اللون عند الـ Hover
    final idleColor = colors.surface.withOpacity(0.7); // اللون الافتراضي

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
              // أنميشن للأيقونة (تغيير الحجم واللون)
              AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.icon,
                  color: _isHovered ? activeColor : idleColor,
                  size: 24,
                ),
              ),

              const SizedBox(height: 4),

              // أنميشن للمؤشر السفلي (Container يتمدد)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: _isHovered ? 20 : 0, // يتمدد من 0 إلى 20
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
