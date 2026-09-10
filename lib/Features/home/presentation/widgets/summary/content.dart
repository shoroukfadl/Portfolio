import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/role.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/Portfilio/stat_widget.dart';

class SummaryContent extends StatelessWidget {
  const SummaryContent({super.key});

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

        // Role -> fadeIn + slideX (من الشمال)
        const RoleWidget()
            .animate()
            .fadeIn(duration: 400.ms, curve: Curves.easeOutCubic)
            .slideX(
              begin: -0.2,
              end: 0,
              duration: 400.ms,
              curve: Curves.easeOutCubic,
            ),

        8.0.heightBox,

        // Name -> fadeIn + slideY + scale خفيف
        const NameWidget()
            .animate()
            .fadeIn(
              delay: 150.ms,
              duration: 450.ms,
              curve: Curves.easeOutCubic,
            )
            .slideY(
              begin: 0.18,
              end: 0,
              delay: 150.ms,
              duration: 450.ms,
              curve: Curves.easeOutCubic,
            )
            .scale(
              begin: const Offset(0.94, 0.94),
              end: const Offset(1, 1),
              delay: 150.ms,
              duration: 450.ms,
              curve: Curves.easeOutCubic,
            ),

        24.0.heightBox,

        // Summary -> fadeIn + blurXY (ناعم)
        SizedBox(
          width: width,
          child: const SummaryWidget(),
        )
            .animate()
            .fadeIn(
              delay: 320.ms,
              duration: 500.ms,
              curve: Curves.easeOutCubic,
            )
            .blurXY(
              begin: 8,
              end: 0,
              delay: 320.ms,
              duration: 500.ms,
              curve: Curves.easeOut,
            ),

        const SizedBox(height: 40),

        // Stats -> fadeIn + scale (pop effect)
        SizedBox(
          width: width,
          child: const StatsRow(),
        )
            .animate()
            .fadeIn(
              delay: 550.ms,
              duration: 450.ms,
              curve: Curves.easeOutCubic,
            )
            .scale(
              begin: const Offset(0.85, 0.85),
              end: const Offset(1, 1),
              delay: 550.ms,
              duration: 450.ms,
              curve: Curves.easeOutBack,
            ),
      ],
    );
  }
}
