import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimatorWrapper extends StatefulWidget {
  final Widget child;
  const ScrollAnimatorWrapper({super.key, required this.child});

  @override
  State<ScrollAnimatorWrapper> createState() => _ScrollAnimatorWrapperState();
}

class _ScrollAnimatorWrapperState extends State<ScrollAnimatorWrapper> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: widget.child
          .animate(target: _isVisible ? 1 : 0)
          .fade(duration: 400.ms)
          .slideY(
              begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOutCubic),
    );
  }
}
