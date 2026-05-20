import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class CvButton extends StatefulWidget {
  final String cv;
  const CvButton({super.key, required this.cv});

  @override
  State<CvButton> createState() => _CvButtonState();
}

class _CvButtonState extends State<CvButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: InkWell(
        onTap: () => HelperFunctions.openUrl(widget.cv, context),
        hoverColor: Colors.transparent,
        child: Container(
          width: 140,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    width: _widthAnimation.value * 140,
                    height: 40,
                    color: colors.secondaryEv,

                  ),
                  Center(child: child),
                ],
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.resume.translate,
                  style: AppTextStyles.medium14(color: Colors.white),
                ),
                const SizedBox(width: 8),
                const Icon(Portfolio.download, size: 14, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}