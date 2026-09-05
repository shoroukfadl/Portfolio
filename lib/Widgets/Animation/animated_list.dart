import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedGridView<T> extends StatelessWidget {
  final int perRow;
  final double hozSpace, vertSpace;
  final double mainAxisExtent;
  final List<T> items;
  final Widget Function(int) buildChild;
  const AnimatedGridView(
      {super.key,
      required this.perRow,
      required this.mainAxisExtent,
      required this.items,
      this.hozSpace = 8,
      this.vertSpace = 8,
      required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: perRow,
          mainAxisSpacing: vertSpace,
          crossAxisSpacing: hozSpace,
          mainAxisExtent: mainAxisExtent),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 1000),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: buildChild(index))));
      },
    );
  }
}

class AnimatedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(int) buildChild;
  final double spacing;
  const AnimatedListView(
      {super.key,
      required this.items,
      this.spacing = 20,
      required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (c, i) => spacing.heightBox,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 1000),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: buildChild(index))));
      },
    );
  }
}

class AnimatedWrapView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(int) buildChild;
  const AnimatedWrapView(
      {super.key, required this.items, required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(items.length, (index) {
        bool isFullWidth = (index + 1) % 3 == 0;
        return SizedBox(
          width: isFullWidth ? double.infinity : (context.width / 2.3),
          child: AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 1000),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: buildChild(index)))),
        );
      }),
    );
  }
}
