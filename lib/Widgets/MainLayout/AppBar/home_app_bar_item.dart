import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Custom/custom_tooltip_widget.dart';

import '../../../Utilities/extensions.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;
  final IconData icon;
  final bool selected;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    this.selected = false,
    required this.icon,
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
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: CustomTooltipWidget(
            title: widget.title,
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 8),
              duration: Duration(milliseconds: 500),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  gradient: widget.selected
                      ? LinearGradient(
                          colors: [colors.accent, colors.secondary])
                      : null,
                  color: _isHovered ? colors.accentSoft : null,
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(widget.icon,
                  color: widget.selected ? Colors.white : colors.text1,
                  size: 20),
            )),
      ),
    );
    // return MouseRegion(
    //   cursor: SystemMouseCursors.click,
    //   onEnter: (_) => setState(() => _isHovered = true),
    //   onExit: (_) => setState(() => _isHovered = false),
    //   child: GestureDetector(
    //     onTap: widget.onTap,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 14,
    //         vertical: 8,
    //       ),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           AnimatedDefaultTextStyle(
    //             duration: const Duration(milliseconds: 250),
    //             curve: Curves.easeOut,
    //             style: AppTextStyles.title(
    //               context: context,
    //               color: active ? colors.text1 : colors.border,
    //             ),
    //             child: Text(widget.title),
    //           ),
    //           const SizedBox(height: 4),
    //           AnimatedContainer(
    //             duration: const Duration(milliseconds: 250),
    //             curve: Curves.easeOut,
    //             height: 2,
    //             width: active ? 80 : 0,
    //             alignment: Alignment.center,
    //             decoration: BoxDecoration(
    //               color: colors.accentSoft,
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
