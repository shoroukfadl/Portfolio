import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/mobile_preview_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../../Widgets/rounded_image_widget.dart';

class MainViewWidget extends StatelessWidget {
  final List<String> images;
  final Function() onDoubleTap ,onInteractionEnd;
  final Function(int i) onPageChange ;
  final PageController pageController;
  final TransformationController? Function(int i) transformController ;
  final bool isZoomed,isMobile;
  const MainViewWidget({super.key, required this.images, required this.onDoubleTap, required this.onPageChange, required this.pageController, required this.isZoomed, required this.transformController, required this.onInteractionEnd, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return  GestureDetector(
      onDoubleTap: () {
        onDoubleTap();
      },
      child: PageView.builder(
        controller: pageController,
        physics: isZoomed
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        onPageChanged: (i) => onPageChange(i),
        itemCount: images.length,
        itemBuilder: (_, i) {
          return InteractiveViewer(
            transformationController: transformController != null ? transformController!(i):null,
            minScale: 1,
            maxScale: 5,
            onInteractionEnd: (details) {
              onInteractionEnd();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: isMobile ? MobilePreviewWidget(image: images[i], height: 600 , width: 300,): RoundedImage(imagePath:images[i],fit: BoxFit.fill,radiusValue: 8,borderColor: colors.text3,),
            ),
          );
        },
      ),
    );
  }
}
