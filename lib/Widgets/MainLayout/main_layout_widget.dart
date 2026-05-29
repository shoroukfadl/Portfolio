import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/Constants/global_keys.dart';
import '../Buttons/theme_button.dart';
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
    final colors = context.colors;
    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      floatingActionButton: ThemeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(
        children: [
          const AnimatedBackground(),
          widget.child,
        ],
      ),
    );
  }
}
