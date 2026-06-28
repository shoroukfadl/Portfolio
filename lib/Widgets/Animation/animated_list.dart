import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedGridView<T> extends StatelessWidget {
  final int perRow;
  final double mainAxisExtent;
  final List<T> items;
  final Widget Function(int) buildChild;
  const AnimatedGridView(
      {super.key,
      required this.perRow,
      required this.mainAxisExtent,
      required this.items,
      required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: perRow,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
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
  const AnimatedListView(
      {super.key, required this.items, required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (c, i) => 20.0.heightBox,
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

class AnimatedHozListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(int) buildChild;
  final ScrollController? scrollController;
  const AnimatedHozListView({
    super.key,
    required this.items,
    required this.buildChild,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (c, i, anim) => 20.0.widthBox,
      removedSeparatorBuilder: (c, i, a) => 20.0.widthBox,
      padding: EdgeInsets.symmetric(vertical: 20),
      initialItemCount: items.length,
      controller: scrollController,
      itemBuilder: (context, index, anim) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0), // ← أفقي مش رأسي
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: anim,
            curve: Curves.easeOut,
          )),
          child: FadeTransition(
            opacity: anim,
            child: buildChild(index),
          ),
        );
      },
    );
  }
}
