import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/content.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../../Utilities/Constants/constants.dart';

class SummarySection extends StatefulWidget {
  final ProfileEntity? profile;
  final double projectProductionNumber, experience;
  final double padding;

  const SummarySection({
    super.key,
    this.profile,
    this.padding = desktopHozPadding,
    required this.projectProductionNumber,
    required this.experience,
  });

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  @override
  Widget build(BuildContext context) {
    final height = context.matchedSize(large: 480, medium: 560, small: 680);
    return AnimatedBackground(
      height: height,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: widget.padding,
          end: widget.padding,
        ),
        child: _summary(),
      ),
    );
  }

  Widget _summary() => SummaryContent(
        firstName: widget.profile?.firstName ?? "",
        location: widget.profile?.location ?? "",
        lastName: widget.profile?.lastName ?? "",
        role: widget.profile?.jobTitle ?? "",
        summary: widget.profile?.summary ?? "",
        cv: widget.profile?.cv ?? "",
        email: widget.profile?.email ?? "",
        experince: widget.experience,
        projectNumber: widget.projectProductionNumber,
      );
}
