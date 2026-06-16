import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Utilities/extensions.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact/contact_me.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/project/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

class MediumHomeView extends StatelessWidget {
  const MediumHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('In Medium ....');
    final colors = context.colors;
    return ScreenLayoutWidget(
      children: [
        /// about
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.profile != c.data?.profile,
              builder: (context, s) {
                return SummarySection(
                  profile: s.data?.profile,
                ).paddingSymmetric(horizontal: Constants.tabletHozPadding);
              }),
        ),

        SliverToBoxAdapter(child: 40.0.heightBox),

        /// skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.skills != c.data?.skills,
                builder: (context, s) {
                  return SkillsSection(
                    skills: s.data?.skills ?? [],
                    padding: Constants.tabletHozPadding,
                    iconSize: 32,

                  );
                })),
        SliverToBoxAdapter(child: 40.0.heightBox),

        /// experince
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.experience != c.data?.experience,
              builder: (context, s) {
                return ExperienceSection(
                  experiences: s.data?.experience ?? [],
                  titleStyle: AppTextStyles.extraBold32(),
                  padding: Constants.tabletHozPadding,
                  employeeTypeStyle:
                      AppTextStyles.medium10(color: Colors.white),
                  roleStyle: AppTextStyles.semiBold16(
                    color: colors.text1,
                  ),
                  dateStyle: AppTextStyles.medium12(
                    color: colors.secondary,
                  ),
                );
              }),
        ),

        /// education
        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => p.data?.education != c.data?.education,
              builder: (c, s) => EducationSection(
                    education: s.data?.education.firstOrNull,
                    titleStyle: AppTextStyles.extraBold32(),
                    padding: Constants.tabletHozPadding,
                  )),
        ),
        //
        SliverPadding(
            padding: const EdgeInsets.all(Constants.tabletHozPadding),
            sliver: SliverToBoxAdapter(
                child: BlocBuilder<PortfolioCubit, PortfolioState>(
                    buildWhen: (c, p) => p.data?.projects != c.data?.projects,
                    builder: (c, s) => MyProjectsWidget(
                          projects: s.data?.projects ?? [],
                        )))),

        /// contact me
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => p.data?.profile != c.data?.profile,
                builder: (c, s) => ContactMeWidget(
                      email: s.data?.profile?.email ?? "",
                      linkedIN: s.data?.profile?.linkedin ?? "",
                      phoneNumber: s.data?.profile?.phone ?? "",
                      github: s.data?.profile?.github ?? "",
                      cv: s.data?.profile?.cv ?? "",
                      iconSize: 16,
                      contactMeStyle:
                          AppTextStyles.medium24(color: colors.accent),
                      copyRightStyle:
                          AppTextStyles.medium14(color: colors.text1),
                    )))
      ],
    );
  }
}
