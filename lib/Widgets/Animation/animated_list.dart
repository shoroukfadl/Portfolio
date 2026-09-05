import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedGridView<T> extends StatelessWidget {
  final int perRow;
  final double hozSpace, vertSpace;
  final double mainAxisExtent;
  final List<T> items;
  final Widget Function(int) buildChild;

  const AnimatedGridView({
    super.key,
    required this.perRow,
    required this.mainAxisExtent,
    required this.items,
    this.hozSpace = 8,
    this.vertSpace = 8,
    required this.buildChild,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: perRow,
        mainAxisSpacing: vertSpace,
        crossAxisSpacing: hozSpace,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ScrollReveal(
          offset: 20,
          key: ValueKey('project-reveal-grid-$index'),
          child: buildChild(index),
        );
      },
    );
  }
}

class AnimatedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(int) buildChild;
  final double spacing;
  const AnimatedListView(
      {super.key,
      required this.items,
      this.spacing = 20,
      required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (c, i) => spacing.heightBox,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ScrollReveal(
          offset: 20,
          key: ValueKey('project-reveal-$index'),
          child: buildChild(index),
        );
      },
    );
  }
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 20,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _slide = Tween<Offset>(
      begin: Offset(0, widget.offset / 100),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _handleVisibility(VisibilityInfo info) {
    if (_hasAnimated) return;

    if (info.visibleFraction >= 0.15) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: _handleVisibility,
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}

class ExperienceReveal extends StatefulWidget {
  final Widget child;
  final int index;

  const ExperienceReveal({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  State<ExperienceReveal> createState() => _ExperienceRevealState();
}

class _ExperienceRevealState extends State<ExperienceReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0.08, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_hasAnimated) return;

    if (info.visibleFraction >= 0.1) {
      _hasAnimated = true;

      Future.delayed(
        Duration(milliseconds: widget.index * 120),
        () {
          if (mounted) {
            _controller.forward();
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('experience-reveal-${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}

class SkillReveal extends StatefulWidget {
  final Widget child;
  final int index;

  const SkillReveal({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  State<SkillReveal> createState() => _SkillRevealState();
}

class _SkillRevealState extends State<SkillReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _opacity = curve;

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(curve);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_hasAnimated) return;

    if (info.visibleFraction >= 0.1) {
      _hasAnimated = true;

      Future.delayed(
        Duration(milliseconds: widget.index * 100),
        () {
          if (mounted) {
            _controller.forward();
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('skill-reveal-${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}
