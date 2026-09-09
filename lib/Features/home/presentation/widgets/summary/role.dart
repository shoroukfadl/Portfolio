import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Portfilio/divider_widget.dart';

class RoleWidget extends StatelessWidget {
  const RoleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) =>
            p.data?.profile?.jobTitle != c.data?.profile?.jobTitle ||
            p.data?.profile?.location != c.data?.profile?.location,
        builder: (context, s) {
          return Row(
            spacing: 4,
            children: [
              SizedBox(
                  width: 20,
                  child: DividerWidget(
                    thickness: 2,
                    color: colors.accent,
                  )),
              Text(
                  "${(s.data?.profile?.jobTitle ?? "").toUpperCase()} . ${(s.data?.profile?.location ?? "").toUpperCase()}",
                  style: AppTextStyles.l1(
                          context: context, color: colors.secondary)
                      .copyWith(letterSpacing: 1.3)),
            ],
          );
        });
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) =>
            p.data?.profile?.firstName != c.data?.profile?.firstName ||
            p.data?.profile?.lastName != c.data?.profile?.lastName,
        builder: (context, s) {
          final firstName = s.data?.profile?.firstName ?? "";
          final lastName = s.data?.profile?.lastName ?? "";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstName,
                style: AppTextStyles.h1(
                  context: context,
                  color: colors.text1,
                ),
              ),
              Text(
                lastName,
                style: AppTextStyles.h1(
                  context: context,
                  color: colors.secondary,
                ),
              ),
            ],
          );
        });
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) =>
            p.data?.profile?.summary != c.data?.profile?.summary,
        builder: (context, s) {
          final summary = s.data?.profile?.summary ?? "";
          return Text(
            summary,
            style: AppTextStyles.b1(
              context: context,
              color: colors.text2,
            ),
          );
        });
  }
}
