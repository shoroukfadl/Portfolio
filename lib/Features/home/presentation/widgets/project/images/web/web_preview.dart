import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/web/web_item_preivew.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class WebPreview extends StatefulWidget {
  const WebPreview({
    super.key,
    required this.urls,
    required this.height,
    required this.width,
  });

  final List<String> urls;
  final double height;
  final double width;

  @override
  State<WebPreview> createState() => _WebPreviewState();
}

class _WebPreviewState extends State<WebPreview> {
  late final PageController _pageController;
  int _currentPage = 0;

  bool get _hasMultipleImages => widget.urls.length > 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (widget.urls.isEmpty) {
      return SizedBox(width: widget.width, height: widget.height);
    }

    return Container(
      width: double.infinity,
      height: widget.height,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.secondarySoft, colors.accentSoft],
        ),
        border: Border(bottom: BorderSide(color: colors.border)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cardRadius),
          topRight: Radius.circular(cardRadius),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urls.length,
            physics: _hasMultipleImages
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => WebItemPreview(
              width: widget.width,
              height: widget.height,
              url: widget.urls[index],
            ),
          ),
          if (_hasMultipleImages) _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.urls.length, (index) {
              final isActive = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 16 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
