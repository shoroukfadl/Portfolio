import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Utilities/animation_configaration.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatefulWidget {
  final String title;
  final int index;

  const SectionsTitleWidget(
      {super.key, required this.title, required this.index});

  @override
  State<SectionsTitleWidget> createState() => _SectionsTitleWidgetState();
}

class _SectionsTitleWidgetState extends State<SectionsTitleWidget> {
  AnimationController? _controller;
  bool _hasAnimated = false;
  void _handleVisibility(VisibilityInfo info) {
    if (_hasAnimated) return;
    if (info.visibleFraction < 0.15) return;

    _hasAnimated = true;

    Future.delayed(
      Duration(milliseconds: widget.index * 80),
      () {
        if (mounted) _controller?.forward();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final duration = PortfolioAnimationConfig.duration(context);

    return VisibilityDetector(
      key: ValueKey(widget.title),
      onVisibilityChanged: _handleVisibility,
      child: Text(
        widget.title,
        style: AppTextStyles.h2(context: context, color: colors.text1),
      )
          .animate(
            autoPlay: false,
            onInit: (controller) => _controller = controller,
          )
          .fadeIn(duration: duration, curve: Curves.easeOut)
          .blurXY(
            begin: 10,
            end: 0,
            duration: duration,
            curve: Curves.easeOut,
          ),
    );
  }
}
