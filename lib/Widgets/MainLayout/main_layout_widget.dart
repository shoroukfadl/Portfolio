import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/summary_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/Constants/global_keys.dart';
import 'menu_button.dart';

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
          if (context.isLarge)
            const LargeSummaryCard(),
          widget.child.expand,
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
