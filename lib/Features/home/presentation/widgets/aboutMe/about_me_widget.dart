import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../../Utilities/Constants/constants.dart';
import 'floating_card_widget.dart';

class SummarySection extends StatefulWidget {
  final ProfileEntity? profile;
  final double projectProductionNumber,experience;
  final double padding;

  const SummarySection({
    super.key,
    this.profile,
    this.padding = desktopHozPadding,
    required this.projectProductionNumber, required this.experience,
  });

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late List<AnimationController> _cardControllers;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);

    _cardControllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(seconds: 7 + (index * 1)),
        vsync: this,
      )..repeat(reverse: true),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.matchedSize(large: 560, medium: 560, small: 620);
    return AnimatedBackground(
      height: height,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: widget.padding,
          end: widget.padding,
        ),
        child: !context.isSmall
            ? Row(
                spacing: context.isLarge ? 60 : 0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Summary().expand,
                  _FloatingCards().expand,
                ],
              )
            : Column(
                spacing: 100,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Summary(),
                  _FloatingCards(),
                ],
              ),
      ),
    );
  }

  Widget _Summary() => SummaryContent(
        firstName: widget.profile?.firstName ?? "",
        lastName: widget.profile?.lastName ?? "",
        role: widget.profile?.jobTitle ?? "",
        summary: widget.profile?.summary ?? "",
        cv: widget.profile?.cv ?? "",
        email: widget.profile?.email ?? "",
        experince: widget.experience,
        projectNumber: widget.projectProductionNumber,
      );

  Widget _FloatingCards() => FloatingCards(
        floatController: _floatController,
        cardControllers: _cardControllers,
        isMobile: context.isSmall,
      );
}
