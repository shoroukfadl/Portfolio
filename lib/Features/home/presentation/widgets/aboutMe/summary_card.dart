import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact_me.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../education/education_widget.dart';
import 'about_me_widget.dart';

class LargeSummaryCard extends StatelessWidget {
  const LargeSummaryCard({super.key});

  Widget divider(AppColors colors) => Divider(
        color: colors.border,
        thickness: 0.5,
      );
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 300,
      color: colors.surface,
      child: RawScrollbar(
          thumbVisibility: true,

          child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: 24.0.heightBox),
            SliverToBoxAdapter(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                  buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                  builder: (context, state) {
                    return LargeSummarySection(
                      profile: state.data?.profile,
                    );
                  }),
            ),
            SliverToBoxAdapter(child: 8.0.heightBox),
            SliverToBoxAdapter(child: divider(colors)),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.summary,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.aboutMe.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.aboutMe.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.education,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.education.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.education.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.skills,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.skill.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.mySkill.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.work,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.experince.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.experience.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.projects,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.projects.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.projects.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.certification,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.certification.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.certification.translate,
              ),
            ),
            SliverToBoxAdapter(child: 8.0.heightBox),
            SliverToBoxAdapter(child: divider(colors)),
            SliverToBoxAdapter(child: 8.0.heightBox),
            SliverToBoxAdapter(
              child: BlocBuilder<PortfolioCubit, PortfolioState>(
                  buildWhen: (c, p) => c.data?.education != p.data?.education,
                  builder: (context, state) {
                    return EducationSection(
                        education: state.data?.education ?? []);
                  }),
            ),
            SliverToBoxAdapter(child: 8.0.heightBox),
            SliverToBoxAdapter(child: divider(colors)),
            SliverToBoxAdapter(child: 8.0.heightBox),
            const SliverToBoxAdapter(
              child:ContactWidget(),
            ),
            SliverToBoxAdapter(
              child: 16.0.heightBox,
            )
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  Widget divider(AppColors colors) => Divider(
    color: colors.border,
    thickness: 0.5,
  );
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 320,
      color: colors.surface,
      child: RawScrollbar(
        thumbVisibility: true,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: 24.0.heightBox),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.summary,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.aboutMe.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.aboutMe.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.education,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.education.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.education.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.skills,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.skill.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.mySkill.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.work,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.experince.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.experience.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.projects,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.projects.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.projects.translate,
              ),
            ),
            SliverToBoxAdapter(
              child: HomeAppBarItem(
                icon: Portfolio.certification,
                onTap: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.certification.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                title: Strings.certification.translate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

