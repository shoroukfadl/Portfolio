import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/content.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../../Utilities/Constants/constants.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({
    super.key,
    this.padding = desktopHozPadding,
  });

  final double padding;

  @override
  Widget build(BuildContext context) {
    final height = context.matchedSize(large: 480, medium: 560, small: 680);

    return AnimatedBackground(
      height: height,
      key: GlobalKeys.aboutMe,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: padding, end: padding),
        child: const SummaryContent(),
      ),
    );
  }
}
