import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../../Widgets/rounded_image_widget.dart';

class ThumbnailsWidget extends StatelessWidget {
  final double width, height;
  final List<String> images;
  final Function(int i) onSelectOne;

  final int current;

  const ThumbnailsWidget(
      {super.key,
      this.images = const [],
      this.height = 80,
      this.width = 64,
      required this.onSelectOne,
      required this.current});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.text3.withValues(alpha: .07)),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: images.length,
        itemBuilder: (_, i) {
          final isActive = i == current;
          return GestureDetector(
            onTap: () {
              onSelectOne(i);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isActive
                      ? colors.accent
                      : colors.text3.withValues(alpha: .12),
                  width: isActive ? 2 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Opacity(
                  opacity: isActive ? 1 : .45,
                  child: RoundedImage(
                    imagePath: images[i],
                    fit: BoxFit.fill,
                    radiusValue: 0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
