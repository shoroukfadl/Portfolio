import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me.dart';
import 'package:portfolio/Features/home/presentation/widgets/education/education_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/experince/experince_card_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/my_projects_widget.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../widgets/skills/my_skills.dart';
import '../../widgets/summary/summary_section.dart';

class MediumHomeView extends StatelessWidget {
  const MediumHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// about
        SliverToBoxAdapter(
          child: const SummarySection(
            padding: tabletHozPadding,
          ),
        ),

        SliverToBoxAdapter(child: mediumSectionSpacing.heightBox),

        /// skills

        const SkillsSection(
          padding: tabletHozPadding,
          hozSpacing: 24,
        ),

        SliverToBoxAdapter(child: mediumSectionSpacing.heightBox),

        /// experince
        const ExperienceSection(
          padding: tabletHozPadding,
        ),
        SliverToBoxAdapter(child: mediumSectionSpacing.heightBox),

        // /// Projects
        const MyProjectsWidget(
          padding: tabletHozPadding,
          perRow: 1,
        ),

        SliverToBoxAdapter(child: mediumSectionSpacing.heightBox),

        /// education

        const EducationSection(
          padding: tabletHozPadding,
        ),

        SliverToBoxAdapter(child: mediumSectionSpacing.heightBox),

        const SliverToBoxAdapter(
          child: ContactMeWidget(
            padding: tabletHozPadding,
          ),
        ),
        SliverToBoxAdapter(child: 16.0.heightBox),
      ],
    );
  }
}
