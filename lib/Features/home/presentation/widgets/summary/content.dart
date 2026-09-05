import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/role.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/Summary/number_card_item.dart';

import '../../../../../Widgets/Portfilio/stat_widget.dart';

class SummaryContent extends StatefulWidget {
  final String firstName, lastName, location, role, summary, cv, email;
  final double projectNumber, experince;

  const SummaryContent({
    super.key,
    required this.firstName,
    required this.role,
    required this.summary,
    required this.lastName,
    required this.cv,
    required this.email,
    required this.experince,
    required this.projectNumber,
    required this.location,
  });

  @override
  State<SummaryContent> createState() => _SummaryContentState();
}

class _SummaryContentState extends State<SummaryContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _roleAnimation;
  late final Animation<double> _nameAnimation;
  late final Animation<double> _summaryAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _roleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.00,
        0.25,
        curve: Curves.easeOutCubic,
      ),
    );

    _nameAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.30,
        0.55,
        curve: Curves.easeOutCubic,
      ),
    );

    _summaryAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.60,
        0.85,
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
    double offset = 20,
  }) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, offset / 100),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
          animation: _roleAnimation,
          child: RoleWidget(
            location: widget.location,
            role: widget.role,
          ),
        ),

        8.0.heightBox,

        // Name
        _animatedItem(
          animation: _nameAnimation,
          offset: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.firstName,
                style: AppTextStyles.h1(
                  context: context,
                  color: colors.text1,
                ),
              ),
              Text(
                widget.lastName,
                style: AppTextStyles.h1(
                  context: context,
                  color: colors.secondary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Summary
        _animatedItem(
          animation: _summaryAnimation,
          offset: 18,
          child: SizedBox(
            width: width,
            child: Text(
              widget.summary,
              style: AppTextStyles.b1(
                context: context,
                color: colors.text2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        // Stats
        SizedBox(
          width: context.isLarge
              ? maxWidth * 1 / 2
              : context.isMedium
                  ? maxWidth * 2 / 3
                  : null,
          child: StatsRow(
            numStyle: AppTextStyles.h3(
              context: context,
              color: colors.accent,
            ),
            titleStyle: AppTextStyles.h5(
              context: context,
              color: colors.text3,
            ),
            items: [
              Stat(
                value: widget.experince,
                name: 'YEARS SHIPPING',
                hasDigit: true,
                sign: '+',
              ),
              Stat(
                value: widget.projectNumber,
                name: 'PRODUCTION APPS',
              ),
              const Stat(
                value: 3,
                name: 'PLATFORMS',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
