import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Models/user_data_model.dart';

import 'floating_card_widget.dart';

class SummarySection extends StatefulWidget {
  const SummarySection({super.key});

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
               lastName: "fadl",
               firstName: "shorouk",
               role: "flutter developer",
                summary:
                   "Jenny’s Exceptional product design ensure our website’s success. Highly Recommended",

             ),
            const SizedBox(height: 40),
            FloatingCards(
              floatController: _floatController,
              cardControllers: _cardControllers,
              eduction:  EductionModel(
                      country: 'Egp',
                      date: '2023',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales ',
                      uniName: 'FCGS OF COMPAUTER '),
              isMobile: true,
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: SummaryContent(    lastName: "fadl",
              firstName: "shorouk",
              role: "flutter developer",
              summary:
              "Jenny’s Exceptional product design ensure our website’s success. Highly Recommended",

            ),),
            const SizedBox(width: 60),
            Expanded(
              child: FloatingCards(
                floatController: _floatController,
                cardControllers: _cardControllers,
                eduction:  EductionModel(
                      country: 'Egp',
                      date: '2023',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales ',
                      uniName: 'FCGS OF COMPAUTER '),
                isMobile: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
