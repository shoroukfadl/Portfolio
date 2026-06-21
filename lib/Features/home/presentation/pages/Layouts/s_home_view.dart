import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Animation/widget_visiablity.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/project/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

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
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.profile != c.data?.profile,
              builder: (context, s) {
                return ScrollAnimatorWrapper(
                  child: SummarySection(
                    profile: s.data?.profile,
                    padding: mobileHozPadding,
                    projectProductionNumber:
                        (s.data?.projects.length ?? 0).toDouble(),
                  ),
                );
              }),
        ),

        SliverToBoxAdapter(child: 40.0.heightBox),

        /// skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.skills != c.data?.skills,
                builder: (context, s) {
                  return ScrollAnimatorWrapper(
                    child: SkillsSection(
                      padding: mobileHozPadding,
                      perRow: 1,
                      mainAxisExtent: 120,
                      skills: s.data?.skills ?? [],
                    ),
                  );
                })),

        SliverToBoxAdapter(child: 40.0.heightBox),

        /// experince
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.experience != c.data?.experience,
              builder: (context, s) {
                return ScrollAnimatorWrapper(
                  child: ExperienceSection(
                    padding: mobileHozPadding,
                    experiences: s.data?.experience ?? [],
                  ),
                );
              }),
        ),
        SliverToBoxAdapter(child: 40.0.heightBox),

        /// Projects
        SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: mobileHozPadding,
            ),
            sliver: SliverToBoxAdapter(
                child: BlocBuilder<PortfolioCubit, PortfolioState>(
                    buildWhen: (c, p) => p.data?.projects != c.data?.projects,
                    builder: (c, s) => ScrollAnimatorWrapper(
                          child: MyProjectsWidget(
                            perRow: 1,
                            mainAxisExtent: 326,
                            projects: s.data?.projects ?? [],
                          ),
                        )))),

        /// education
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.education != c.data?.education,
              builder: (c, s) => ScrollAnimatorWrapper(
                  child: EducationSection(
                      padding: mobileHozPadding,
                      education: s.data?.education.firstOrNull))),
        ),

        /// Contact
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.profile != c.data?.profile,
                builder: (c, s) => ScrollAnimatorWrapper(
                      child: ContactMeWidget(
                        email: s.data?.profile?.email ?? "",
                        linkedIN: s.data?.profile?.linkedin ?? "",
                        phoneNumber: s.data?.profile?.phone ?? "",
                        github: s.data?.profile?.github ?? "",
                        cv: s.data?.profile?.cv ?? "",
                        padding: mobileHozPadding,
                      ),
                    ))),
        SliverToBoxAdapter(child: 16.0.heightBox),
      ],
    );
  }
}
