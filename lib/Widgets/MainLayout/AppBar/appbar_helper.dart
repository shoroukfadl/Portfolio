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
        buildWhen: (c, p) =>
            c.data?.profile?.firstName != p.data?.profile?.firstName ||
            c.data?.profile?.lastName != p.data?.profile?.lastName,
        builder: (context, state) {
          final profile = state.data?.profile;
          return Card(
            color: colors.secondary,
            shape: RoundedRectangleBorder(
                borderRadius:
                    const BorderRadiusGeometry.all(Radius.circular(8))),
            child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Text(
                  "${(profile?.firstName) == null ? "" : (profile!.firstName!).substring(0, 1)}${(profile?.lastName) == null ? "" : (profile!.lastName!).substring(0, 1)}.",
                  style: AppTextStyles.hc3(
                    context: context,
                    color: colors.secondarySoft,
                  ),
                )),
          );
        });
  }
}
