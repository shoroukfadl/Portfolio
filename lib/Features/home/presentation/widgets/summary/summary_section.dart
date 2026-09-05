import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/content.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../../Utilities/Constants/constants.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({
    super.key,
    this.profile,
    this.padding = desktopHozPadding,
    required this.projectProductionNumber,
    required this.experience,
  });

  final ProfileEntity? profile;
  final double projectProductionNumber;
  final double experience;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final height = context.matchedSize(large: 480, medium: 560, small: 680);

    return AnimatedBackground(
      height: height,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: padding, end: padding),
        child: SummaryContent(
          firstName: profile?.firstName ?? '',
          lastName: profile?.lastName ?? '',
          location: profile?.location ?? '',
          role: profile?.jobTitle ?? '',
          summary: profile?.summary ?? '',
          cv: profile?.cv ?? '',
          email: profile?.email ?? '',
          experince: experience,
          projectNumber: projectProductionNumber,
        ),
      ),
    );
  }
}
