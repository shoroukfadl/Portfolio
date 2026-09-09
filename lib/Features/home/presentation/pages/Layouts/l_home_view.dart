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

class LargeHomeView extends StatelessWidget {
  const LargeHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// about
        SliverToBoxAdapter(
          child: const SummarySection(),
        ),

        SliverToBoxAdapter(child: largeSectionSpacing.heightBox),

        /// skills

        const SkillsSection(),

        SliverToBoxAdapter(child: largeSectionSpacing.heightBox),

        /// experince
        const ExperienceSection(),
        SliverToBoxAdapter(child: largeSectionSpacing.heightBox),

        // /// Projects
        const MyProjectsWidget(),

        SliverToBoxAdapter(child: largeSectionSpacing.heightBox),

        /// education

        const EducationSection(),

        SliverToBoxAdapter(child: largeSectionSpacing.heightBox),

        const SliverToBoxAdapter(
          child: ContactMeWidget(),
        ),
        SliverToBoxAdapter(child: 16.0.heightBox),
      ],
    );
  }
}
