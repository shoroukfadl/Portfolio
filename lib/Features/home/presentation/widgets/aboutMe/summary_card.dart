import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';

import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import 'about_me_widget.dart';

class SummaryCard extends StatefulWidget {
  const SummaryCard({super.key});

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 16),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: child,
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surface,
              boxShadow: [
                BoxShadow(
                  color: colors.accent25.withAlpha(90),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
              border: Border.all(
                color: colors.accent
              ),
              borderRadius: const BorderRadiusDirectional.all(
                 Radius.circular(Constants.cardRadius),

              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                builder: (context, state) {
                  return SummarySection(
                    profile: state.data?.profile,
                  );
                }),
          ),
          const PositionedDirectional(
              end: -8,
              child: ThemeButton())
        ],
      ),
    );
  }
}