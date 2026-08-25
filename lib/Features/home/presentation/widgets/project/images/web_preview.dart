import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Widgets/rounded_image_widget.dart';

class WebPreview extends StatefulWidget {
  final List<String> urls;
  final String logoText;
  final double width, height, imageWidth;

  const WebPreview({
    super.key,
    required this.urls,
    required this.logoText,
    required this.width,
    required this.height,
    required this.imageWidth,
  });

  @override
  State<WebPreview> createState() => _WebPreviewState();
}

class _WebPreviewState extends State<WebPreview> {
  late final PageController _pageController;
  int _currentPage = 0;

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

    return Container(
      height: widget.height,
      width: widget.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.surface, colors.background],
        ),
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urls.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return RoundedImage(
                imagePath: widget.urls[index],
                fit: BoxFit.cover,
                height: widget.height * (2 / 3),
                width: widget.imageWidth,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(cardRadius / 2),
                  bottomRight: Radius.circular(cardRadius / 2),
                ),
                backgroundColor: colors.background,
              );
            },
          ),

          // Dot indicator — only shown when there's more than one image
          if (widget.urls.length > 1)
            Positioned(
              bottom: 8,
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
                          : Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
