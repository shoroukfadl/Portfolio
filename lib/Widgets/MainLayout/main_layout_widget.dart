import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocklis/Utilities/extensions.dart';
import 'package:rocklis/Widgets/MainLayout/custom_drawer_widget.dart';
import 'package:rocklis/Widgets/MainLayout/home_app_bar.dart';

import '../../Core/Language/app_languages.dart';
import '../../Core/Theme/theme_model.dart';
import '../../Core/Theme/theme_provider.dart';
import '../../Utilities/Constants/enums.dart';
import '../../Utilities/Constants/global_keys.dart';

class MainLayoutWidget extends StatefulWidget {
  static String routeName = ScreenRoutes.mainScreen.name;
  final Widget child;
  final String? currentPath;
  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant MainLayoutWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset the scroll position if the current path changes
    if (oldWidget.currentPath != widget.currentPath) {
      _scrollController.jumpTo(0); // Reset the scroll position to the top
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("current path >> ${widget.currentPath}  ------------------");
    return Consumer2<ThemeProvider, AppLanguage>(
        builder: (context, themeProvider, appLang, _) {
      return Scaffold(
        backgroundColor: ThemeFactory.of(context).backgroundColor,
        endDrawer: context.isLarge
            ? null
            : CustomDrawer(
                currentPath: widget.currentPath,
              ),
        appBar: const PreferredSize(preferredSize:Size.fromHeight(80), child: HomeAppBar()),
        key: GlobalKeys.scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Sliver AppBar for disappearing app bar


           

            // Main content
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  widget.child.paddingSymmetric(horizontal: 32),
                ],
              ),
            ),
          ],
        ),
      );
    });
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
