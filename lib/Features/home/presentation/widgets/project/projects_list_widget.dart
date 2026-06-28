import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/arrow_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Shortcuts/shortcut_widget.dart';

import '../../../../../Widgets/Animation/animated_list.dart';
import 'newCard/project_card_widget.dart';

class ProjectsListWidget extends StatefulWidget {
  final double mainAxisExtent;
  final List<ProjectEntity> items;
  const ProjectsListWidget(
      {super.key, required this.items, required this.mainAxisExtent});

  @override
  State<ProjectsListWidget> createState() => _ProjectsListWidgetState();
}

class _ProjectsListWidgetState extends State<ProjectsListWidget> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPressNext() {
    controller.animateTo(
      (controller.offset + 340).clamp(0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void onPressPrevious() {
    controller.animateTo(
      (controller.offset - 340).clamp(0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.mainAxisExtent,
      child: ShortcutWidget(
        previousPress: onPressPrevious,
        nextPress: onPressNext,
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            ArrowBtn(
              icon: Icons.keyboard_arrow_left,
              onTap: onPressPrevious,
            ),
            AnimatedHozListView<ProjectEntity>(
              scrollController: controller,
              items: widget.items,
              buildChild: (i) => ProjectCard(
                height: widget.mainAxisExtent,
                width: 340,
                project: widget.items[i],
              ),
            ).expand,
            ArrowBtn(
              icon: Icons.keyboard_arrow_right,
              onTap: onPressNext,
            ),
          ],
        ),
      ),
    );
  }
}
