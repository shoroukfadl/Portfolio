import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Animation/widget_visiablity.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/project/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

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
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.profile != c.data?.profile,
              builder: (context, s) {
                return ScrollAnimatorWrapper(
                  child: SummarySection(
                    profile: s.data?.profile,
                  ).paddingSymmetric(horizontal: Constants.desktopHozPadding),
                );
              }),
        ),
        SliverToBoxAdapter(child: 64.0.heightBox),

        /// education
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.education != c.data?.education,
              builder: (c, s) => ScrollAnimatorWrapper(
                  child: EducationSection(
                      education: s.data?.education.firstOrNull))),
        ),

        /// experince
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.experience != c.data?.experience,
              builder: (context, s) {
                return ScrollAnimatorWrapper(
                  child: ExperienceSection(
                    experiences: s.data?.experience ?? [],
                  ),
                );
              }),
        ),
        SliverToBoxAdapter(child: 64.0.heightBox),

        /// skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.skills != c.data?.skills,
                builder: (context, s) {
                  return ScrollAnimatorWrapper(
                    child: SkillsSection(
                      skills: s.data?.skills ?? [],
                    ),
                  );
                })),
        SliverToBoxAdapter(child: 64.0.heightBox),

        /// Projects
        SliverPadding(
            padding: const EdgeInsets.all(Constants.desktopHozPadding),
            sliver: SliverToBoxAdapter(
                child: BlocBuilder<PortfolioCubit, PortfolioState>(
                    buildWhen: (c, p) => p.data?.projects != c.data?.projects,
                    builder: (c, s) => ScrollAnimatorWrapper(
                          child: MyProjectsWidget(
                            projects: s.data?.projects ?? [],
                          ),
                        )))),

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
                      ),
                    ))),
        SliverToBoxAdapter(child: 16.0.heightBox),
      ],
    );
  }
}
