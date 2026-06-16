import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';

import '../../../../../Utilities/Constants/constants.dart';
import 'floating_card_widget.dart';

class SummarySection extends StatefulWidget {
  final ProfileEntity? profile;

  const SummarySection({super.key, this.profile,});

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
    final colors =context.colors;
    return AnimatedBackground(
      height: 560,
      child: Padding(
        padding:EdgeInsetsDirectional.only(
            start: Constants.desktopHozPadding,end:  Constants.desktopHozPadding, ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SummaryContent(
                firstName: widget.profile?.firstName ?? "",
                lastName: widget.profile?.lastName ?? "",
                role: widget.profile?.jobTitle ?? "",
                summary: widget.profile?.summary ?? "",
                cv: widget.profile?.cv ?? "",
                email: widget.profile?.email ?? "",
              ),
            ),
            const SizedBox(width: 60),
            Expanded(
              child: FloatingCards(
                floatController: _floatController,
                cardControllers: _cardControllers,
                isMobile: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
