import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';

class NameAppBar extends StatelessWidget {
  const NameAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) => c.data?.profile != p.data?.profile,
        builder: (context, state) {
          final profile = state.data?.profile;
          return Text(
            "${(profile?.firstName) == null ? "" : (profile!.firstName!).substring(0, 1)}${(profile?.lastName) == null ? "" : (profile!.lastName!).substring(0, 1)}.",
            style: AppTextStyles.title(
              context: context,
              color: colors.text2,
            ),
          );
        });
  }
}
