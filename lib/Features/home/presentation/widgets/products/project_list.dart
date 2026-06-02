import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

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

