import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/role.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/Portfilio/stat_widget.dart';

class SummaryContent extends StatefulWidget {
  const SummaryContent({
    super.key,
  });

  @override
  State<SummaryContent> createState() => _SummaryContentState();
}

class _SummaryContentState extends State<SummaryContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _roleAnim;
  late final Animation<double> _nameAnim;
  late final Animation<double> _summaryAnim;
  late final Animation<double> _statsAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _roleAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.00,
        0.25,
        curve: Curves.easeOutCubic,
      ),
    );

    _nameAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.18,
        0.43,
        curve: Curves.easeOutCubic,
      ),
    );

    _summaryAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.36,
        0.68,
        curve: Curves.easeOutCubic,
      ),
    );

    _statsAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.62,
        1.00,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedItem({
    required Animation<double> animation,
    required Widget child,
    double offset = 12,
  }) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          final value = animation.value;

          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(
                0,
                (1 - value) * offset,
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;

    final width = context.matchedSize(
      large: maxWidth * 2 / 3,
      medium: maxWidth * 3.2 / 4,
      small: maxWidth,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),

        // Role
        _animatedItem(
          animation: _roleAnim,
          offset: 10,
          child: const RoleWidget(),
        ),

        8.0.heightBox,

        // Name
        _animatedItem(
          animation: _nameAnim,
          offset: 14,
          child: const NameWidget(),
        ),

        24.0.heightBox,

        // Summary
        _animatedItem(
          animation: _summaryAnim,
          offset: 12,
          child: SizedBox(
            width: width,
            child: const SummaryWidget(),
          ),
        ),

        const SizedBox(height: 40),

        // Stats
        _animatedItem(
          animation: _statsAnim,
          offset: 10,
          child: SizedBox(
            width: width,
            child: const StatsRow(),
          ),
        ),
      ],
    );
  }
}
