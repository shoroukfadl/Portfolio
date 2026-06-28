import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/arrow_button.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Shortcuts/shortcut_widget.dart';

import '../../../../../Widgets/Animation/animated_list.dart';
import 'newCard/project_card_widget.dart';

class ProjectsListWidget extends StatelessWidget {
  final double mainAxisExtent;
  final List<ProjectEntity> items;
  final int perRow;
  const ProjectsListWidget(
      {super.key,
      this.perRow = 4,
      required this.items,
      required this.mainAxisExtent});

  @override
  Widget build(BuildContext context) {
    return AnimatedGridView<ProjectEntity>(
        perRow: perRow,
        mainAxisExtent: mainAxisExtent,
        items: items,
        buildChild: (i) => ProjectCard(project: items[i])
            .paddingSymmetric(horizontal: 8, vertical: 8));
  }
}
