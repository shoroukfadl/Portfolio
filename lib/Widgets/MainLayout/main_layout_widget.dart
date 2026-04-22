import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar.dart';

import '../../Features/Homel/home_controller.dart';
import '../../Features/home/presentation/cubit/cubit.dart';
import '../../Features/home/presentation/cubit/state.dart';
import '../../Features/home/presentation/widgets/aboutMe/about_me_widget.dart';
import '../../Utilities/Constants/global_keys.dart';
import '../../Utilities/helper_function.dart';
import '../../Utilities/portifilo_icons.dart';
import '../Buttons/custom_button_widget.dart';
import '../Portfilio/animated_background.dart';

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
    final colors =context.colors;
    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,

            decoration: BoxDecoration(
                color: colors.surface,
                boxShadow: [BoxShadow(
                    color: colors.secondary.withAlpha(30),
                    blurRadius: 2,
                    spreadRadius: 2
                )],
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                  topStart: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              spacing: 40,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<PortfolioCubit, PortfolioState>(
                    buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                    builder: (context, state) {
                      return SummarySection(
                        profile: state.data?.profile,
                      );
                    }),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    // CustomButtonWidget(
                    //   onPressed: () {
                    //     String? url = HomeController().user?.cv;
                    //     if (url != null) HelperFunctions.openUrl(url, context);
                    //   },
                    //   btnColor: colors.accent,
                    //   width: 32,
                    //   height: 32,
                    //   borderRadiusValue: 8,
                    //   child: Icon(
                    //     Portfolio.cv,
                    //     color: colors.surface,
                    //     size: 16,
                    //   ),
                    // ),

                    CustomButtonWidget.outLined(
                      borderRadiusValue: 8,
                      onPressed: () {
                        String gmailWebUri =
                            "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.email}";
                        HelperFunctions.openUrl(gmailWebUri, context);
                      },
                      borderColor: colors.secondary,
                      width: 32,
                      height: 32,
                      child: Icon(
                        Portfolio.email,
                        color: colors.secondary,
                        size: 16,
                      ),
                    ),
                    CustomButtonWidget.outLined(
                      borderRadiusValue: 8,
                      onPressed: () {

                      },
                      borderColor: colors.secondary,
                      width: 32,
                      height: 32,
                      child: Icon(
                        Portfolio.linkedin,
                        color: colors.secondary,
                        size: 16,
                      ),
                    ),
                    CustomButtonWidget.outLined(
                      borderRadiusValue: 8,
                      onPressed: () {

                      },
                      borderColor: colors.secondary,
                      width: 32,
                      height: 32,
                      child: Icon(
                        Portfolio.whatsapp,
                        color: colors.secondary,
                        size: 16,
                      ),
                    ),
                    CustomButtonWidget.outLined(
                      borderRadiusValue: 8,
                      onPressed: () {

                      },
                      borderColor: colors.secondary,
                      width: 32,
                      height: 32,
                      child: Icon(
                        Portfolio.github,
                        color: colors.secondary,
                        size: 16,
                      ),
                    ),
                    // CustomButtonWidget.outLined(
                    //   width: 32,
                    //   height: 32,
                    //   borderRadiusValue: 8,
                    //   borderColor: colors.accent,
                    //   onPressed: () {},
                    //   child: Icon(
                    //     Icons.light_mode_outlined,
                    //     color: colors.accent,
                    //     size: 16,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ).expand,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const HomeAppBar(),
              widget.child.expand,
            ],
          ).expandFlex(3),
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
