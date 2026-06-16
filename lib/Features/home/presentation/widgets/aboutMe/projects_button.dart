import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class ProjectsButton extends StatefulWidget {
  const ProjectsButton({super.key});

  @override
  State<ProjectsButton> createState() => _ProjectsButtonState();
}

class _ProjectsButtonState extends State<ProjectsButton>
    with SingleTickerProviderStateMixin {
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
        onTap: () {
          Scrollable.ensureVisible(
            GlobalKeys.aboutMe.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        hoverColor: Colors.transparent,
        child: Container(
          width: 140,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    width: _widthAnimation.value * 140,
                    height: 40,
                    color: colors.card,
                  ),
                  Center(child: child),
                ],
              );
            },
            child: Text(
              Strings.projects.translate,
              style: AppTextStyles.medium14(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
