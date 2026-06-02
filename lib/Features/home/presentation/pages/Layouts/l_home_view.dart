import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/home_summary_widget.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../widgets/certification/certification_widget.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/products/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class LargeHomeView extends StatelessWidget {
  const LargeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                builder: (context, state) {
                  return HomeSummarySection(
                    profile: state.data?.profile,
                    certNumber: state.data?.certificates.length ?? 0,
                    projectsNumber: state.data?.projects.length ?? 0,
                  );
                })),


        /// Skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.skills != p.data?.skills,
                builder: (context, state) {
                  return SkillsSection(
                    skills: state.data?.skills ?? [],
                  );
                })),

        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),  SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),

        /// Experince
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.experience != p.data?.experience,
                builder: (context, state) {
                  return ExperienceSection(
                    experiences: state.data?.experience ?? [],
                  );
                })),

        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),  SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),




        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.certificates != p.data?.certificates,
              builder: (context, state) {
                return CertificationSection(
                        data: state.data?.certificates ?? []);
              }),
        ),

        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),  SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.projects != p.data?.projects,
              builder: (context, state) {
                return MyProjectsWidget(projects: state.data?.projects ?? []);
              }),
        ),
      ],
    );
  }
}
