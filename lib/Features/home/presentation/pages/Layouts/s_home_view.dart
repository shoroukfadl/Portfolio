import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/my_skills.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/extensions.dart';
import '../../widgets/contact/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/project/my_projects_widget.dart';
import '../../widgets/summary/summary_section.dart';

class SmallHomeView extends StatelessWidget {
  const SmallHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// about
        SliverToBoxAdapter(
          child: const SummarySection(
            padding: mobileHozPadding,
          ),
        ),

        SliverToBoxAdapter(child: smallSectionSpacing.heightBox),

        /// skills
        const SkillsSection(
          padding: mobileHozPadding,
          vertSpacing: 24,
        ),

        SliverToBoxAdapter(child: smallSectionSpacing.heightBox),

        /// experince
        const ExperienceSection(
          padding: mobileHozPadding,
        ),

        SliverToBoxAdapter(child: smallSectionSpacing.heightBox),

        /// Projects
        const MyProjectsWidget(
          padding: mobileHozPadding,
          perRow: 1,
        ),

        SliverToBoxAdapter(child: smallSectionSpacing.heightBox),

        /// education
        const EducationSection(
          padding: mobileHozPadding,
        ),

        SliverToBoxAdapter(child: smallSectionSpacing.heightBox),

        /// Contact
        const SliverToBoxAdapter(
          child: ContactMeWidget(
            padding: mobileHozPadding,
          ),
        ),
        SliverToBoxAdapter(child: 16.0.heightBox),
      ],
    );
  }
}
