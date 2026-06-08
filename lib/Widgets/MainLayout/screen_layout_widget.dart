import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ScreenLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  final String? currentPath;

  const ScreenLayoutWidget(
      {super.key, required this.children, this.currentPath});

  @override
  State<ScreenLayoutWidget> createState() => _ScreenLayoutWidgetState();
}

class _ScreenLayoutWidgetState extends State<ScreenLayoutWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ScreenLayoutWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPath != widget.currentPath) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return RawScrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      child: CustomScrollView(
          controller: _scrollController, slivers: [
        ...widget.children,
      ]),
    );
  }
}
