import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Widgets/Animation/Summary/number_card_item.dart';

import '../../../../../Utilities/extensions.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
  });

  List<Stat> items(double experince, double projectNumber) => [
        Stat(
          value: experince,
          name: 'YEARS SHIPPING',
          hasDigit: true,
          sign: '+',
        ),
        Stat(
          value: projectNumber,
          name: 'PRODUCTION APPS',
        ),
        const Stat(
          value: 3,
          name: 'PLATFORMS',
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, t) =>
            c.data?.profile?.experince != t.data?.profile?.experince ||
            c.data?.projects.length != t.data?.projects.length,
        builder: (context, s) {
          final experince = s.data?.profile?.experince ?? 0;
          final projectNumber = (s.data?.projects.length ?? 0.0).toDouble();
          final items = this.items(experince, projectNumber);
          if (!context.isSmall) {
            return Row(
              spacing: 8,
              children: [
                ...List.generate(items.length, (e) {
                  final borderR = BorderRadiusDirectional.all(
                    Radius.circular(cardRadius),
                  );
                  return StatItem(
                    item: items[e],
                    borderRadius: borderR,
                  ).expand;
                })
              ],
            );
          }
          return Column(
            children: [
              ...List.generate(items.length, (e) {
                final borderR = e == 0
                    ? BorderRadiusDirectional.only(
                        topStart: Radius.circular(cardRadius),
                        topEnd: Radius.circular(cardRadius))
                    : (e == items.length - 1)
                        ? BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(cardRadius),
                            bottomEnd: Radius.circular(cardRadius))
                        : BorderRadius.zero;
                return StatItem(
                  item: items[e],
                  borderRadius: borderR,
                );
              })
            ],
          );
        });
  }
}
