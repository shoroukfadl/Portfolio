import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/mobile/mobile_preview_widget.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class MobilePreview extends StatefulWidget {
  final List<String> urls;
  final double width;
  final double height;

  const MobilePreview({
    super.key,
    required this.urls,
    required this.width,
    this.height = 220,
  });

  @override
  State<MobilePreview> createState() => _MobilePreviewState();
}

class _MobilePreviewState extends State<MobilePreview> {
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
    if (widget.urls.isEmpty) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
      );
    }

    return Container(
      height: widget.height,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsetsGeometry.symmetric(vertical: 8),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [colors.secondarySoft, colors.accentSoft]),
          border: Border(bottom: BorderSide(color: colors.border)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          )),
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.urls.length,
        physics: const PageScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: MobileItemPreviewWidget(
              width: widget.width,
              height: widget.height,
              url: widget.urls[index],
            ),
          );
        },
      ),
    );
  }
}
