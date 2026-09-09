import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';

import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class SkillsSection extends StatelessWidget {
  final double padding;
  final double vertSpacing, hozSpacing;

  const SkillsSection({
    super.key,
    this.hozSpacing = 48,
    this.vertSpacing = 24,
    this.padding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    final width = HelperFunctions.getWidth(context);
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        sliver: SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: SectionsTitleWidget(
                index: 1,
                title: Strings.mySkill.translate,
                key: GlobalKeys.skill,
              ),
            ),
            SliverToBoxAdapter(
              child: space.heightBox,
            ),
            BlocSelector<PortfolioCubit, PortfolioState,
                    List<TechnicalSkillEntity>>(
                selector: (state) => state.data?.skills ?? [],
                builder: (c, skills) => SliverToBoxAdapter(
                      child: ShadowHoverCardWidget(
                          cardColor: colors.card,
                          borderColor: colors.border,
                          paddingHoz: 0,
                          width: width,
                          paddingVert: 0,
                          child: (h) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                skills.length,
                                (index) {
                                  return CustomSlideAnimationWidget(
                                      key: ValueKey('skill-$index'),
                                      index: index,
                                      child: SkillCard(
                                        skill: skills[index],
                                        isLast: index == skills.length - 1,
                                      ));
                                },
                              ))),
                    ))
          ],
        ));
  }
}
