import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/home_summary_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact_me.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';
import '../../widgets/certification/certification_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/general/spacer_widget.dart';
import '../../widgets/products/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class MediumHomeView extends StatelessWidget {
  const MediumHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return ScreenLayoutWidget(
      children: [
        /// Summary
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                builder: (context, state) {
                  return HomeSummarySection(
                    profile: state.data?.profile,
                    certNumber: state.data?.certificates.length ?? 0,
                    projectsNumber: state.data?.projects.length ?? 0,
                    hozPadding: tabletHozPadding,
                  );
                })),
        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),

        /// Skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.skills != p.data?.skills,
                builder: (context, state) {
                  return SkillsSection(
                    hozPadding: tabletHozPadding,
                    skills: state.data?.skills ?? [],
                    iconSize: 22,
                    countPerRow: 2,
                    titleStyle: AppTextStyles.medium14(color: colors.text1),
                    nameStyle: AppTextStyles.semiBold12(color: colors.secondary),
                    contentStyle: AppTextStyles.regular10(color: colors.text1),
                  );
                })),

        const SliverToBoxAdapter(
          child: SpacerWidget(),
        ),

        /// Experince
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.experience != p.data?.experience,
                builder: (context, state) {
                  return ExperienceSection(
                    experiences: state.data?.experience ?? [],
                    hozPadding: tabletHozPadding,
                    jobTitleStyle:AppTextStyles.regular12(color: colors.text1) ,
                    descriptionStyle: AppTextStyles.regular10(color: colors.text2),
                    nameStyle: AppTextStyles.semiBold14(color: colors.secondary),
                    dateStyle: AppTextStyles.regular10(color: colors.secondary),
                  );
                })),

        const SliverToBoxAdapter(
          child: SpacerWidget(),
        ),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.certificates != p.data?.certificates,
              builder: (context, state) {
                return CertificationSection(
                    titleStyle: AppTextStyles.semiBold14(color: colors.text1),
                    providerStyle: AppTextStyles.medium12(color: colors.accent),
                    dateStyle: AppTextStyles.regular10(color: colors.secondary),
                    hozPadding: tabletHozPadding,
                    data: state.data?.certificates ?? []);
              }),
        ),

        const SliverToBoxAdapter(child: SpacerWidget()),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.projects != p.data?.projects,
              builder: (context, state) {
                return MyProjectsWidget(
                  projects: state.data?.projects ?? [],
                  hozPadding: tabletHozPadding,
                  titleStyle: AppTextStyles.medium14(color: colors.text1),

                );
              }),
        ),
        const SliverToBoxAdapter(child: SpacerWidget()),
        const SliverToBoxAdapter(child: ContactWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 16,)),

      ],
    );
  }
}
