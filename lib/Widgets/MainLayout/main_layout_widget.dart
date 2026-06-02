import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/summary_card.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar.dart';

import '../../Features/home/presentation/cubit/cubit.dart';
import '../../Features/home/presentation/cubit/state.dart';
import '../../Features/home/presentation/widgets/aboutMe/about_me_widget.dart';
import '../../Utilities/Constants/constants.dart';
import '../../Utilities/Constants/global_keys.dart';
import '../../Utilities/helper_function.dart';
import '../../Utilities/portifilo_icons.dart';
import '../Buttons/custom_button_widget.dart';

class MainLayoutWidget extends StatefulWidget {
  final Widget child;
  final String? currentPath;

  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Row(
        children: [
          Column(
            children: [
              const SummaryCard(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colors.accent25.withAlpha(90),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ],
                  border: Border.all(color: colors.accent),
                  borderRadius: const BorderRadiusDirectional.all(
                    Radius.circular(Constants.cardRadius),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ContactButton(
                      onTap: () {},
                      icon: Portfolio.email,
                    ),
                    ContactButton(
                      onTap: () {},
                      icon: Portfolio.linkedin,
                    ),
                    ContactButton(
                      onTap: () {},
                      icon: Portfolio.github,
                    ),
                    ContactButton(
                      onTap: () {},
                      icon: Portfolio.whatsapp,
                    ),
                  ],
                ),
              ),
            ],
          ).expand,
          widget.child.expandFlex(3),
        ],
      ),
    );
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
