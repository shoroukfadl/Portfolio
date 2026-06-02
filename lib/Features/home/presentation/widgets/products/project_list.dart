import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/curved_card_widget.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class ProjectsList extends StatefulWidget {
  final List<ProjectEntity> projects;


  const ProjectsList(
      {super.key, this.projects = const [], });

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      children: [
        ...widget.projects.map((entry) {
          final project = entry;
          return ProjectItemCard(
            project: project,
          );
        }).toList()
      ],
    );
  }
}

