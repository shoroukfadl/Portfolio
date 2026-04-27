import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Models/user_data_model.dart';

import 'floating_card_widget.dart';

class SummarySection extends StatefulWidget {
  final ProfileEntity? profile;
  const SummarySection({super.key, this.profile});

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
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: isMobile ? 600 : 500,
        child: isMobile
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SummaryContent(
                    firstName: widget.profile?.firstName ?? "",
                    lastName: widget.profile?.lastName ?? "",
                    role: widget.profile?.jobTitle ?? "",
                    summary: widget.profile?.summary ?? "",
                  ),
                  const SizedBox(height: 40),
                  FloatingCards(
                    floatController: _floatController,
                    cardControllers: _cardControllers,
                    eduction: EductionModel(),
                    isMobile: true,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SummaryContent(
                      firstName: widget.profile?.firstName ?? "",
                      lastName: widget.profile?.lastName ?? "",
                      role: widget.profile?.jobTitle ?? "",
                      summary: widget.profile?.summary ?? "",
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    child: FloatingCards(
                      floatController: _floatController,
                      cardControllers: _cardControllers,
                      eduction: EductionModel(),
                      isMobile: false,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
