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

class SmallHomeView extends StatelessWidget {
  const SmallHomeView({super.key});

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
                    hozPadding: mobileHozPadding,
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
                    hozPadding: mobileHozPadding,
                    skills: state.data?.skills ?? [],
                    iconSize: 20,
                   countPerRow: 1,
                    titleStyle: AppTextStyles.medium12(color: colors.text1),
                    nameStyle: AppTextStyles.semiBold10(color: colors.secondary),
                    contentStyle: AppTextStyles.regular8(color: colors.text1),
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
                    hozPadding: mobileHozPadding,
                    jobTitleStyle:AppTextStyles.regular10(color: colors.text1) ,
                    descriptionStyle: AppTextStyles.regular8(color: colors.text2),
                    nameStyle: AppTextStyles.semiBold12(color: colors.secondary),
                    dateStyle: AppTextStyles.medium8(color: colors.secondary),
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
                    hozPadding: mobileHozPadding,
                    titleStyle: AppTextStyles.semiBold12(color: colors.text1),
                    providerStyle: AppTextStyles.medium10(color: colors.accent),
                    dateStyle: AppTextStyles.regular8(color: colors.secondary),
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
                  hozPadding: mobileHozPadding,
                  titleStyle: AppTextStyles.medium12(color: colors.text1),

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
