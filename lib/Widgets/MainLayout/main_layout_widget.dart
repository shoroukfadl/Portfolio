import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar.dart';
import 'package:portfolio/Widgets/MainLayout/Sections/bottom_navigation.dart';

import '../../Utilities/Constants/global_keys.dart';

class MainLayoutWidget extends StatefulWidget {
  final Widget child;
  final String? currentPath;

  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  static const double _designWidth = 1539;

  void _scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final screenWidth = MediaQuery.of(context).size.width;

    final scale = screenWidth > _designWidth
        ? (screenWidth / _designWidth).clamp(0.5, 1.0)
        : 1.0;

    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      bottomNavigationBar: !context.isLarge
          ? BottomNavigationBarWidget(
              onSectionTap: _scrollToSection,
            )
          : null,
      body: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 400),
        child: Row(
          children: [
            if (context.isLarge)
              MenuSideWidget(
                onSectionTap: _scrollToSection,
              ),
            Column(
              children: [
                if (!context.isLarge) const HomeAppBar(),
                widget.child.expand,
              ],
            ).expand,
          ],
        ),
      ),
    );
  }
}
