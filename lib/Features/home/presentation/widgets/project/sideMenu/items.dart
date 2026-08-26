import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/projects_side_item_widget.dart';

class ProjectSideItems extends StatelessWidget {
  final List<ProjectEntity> items;
  final void Function(ProjectEntity) onTapProject;
  final ProjectEntity selectedProject;
  const ProjectSideItems(
      {super.key,
      required this.items,
      required this.onTapProject,
      required this.selectedProject});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: items.map(
        (project) {
          return ProjectSideItemWidget(
            key: ValueKey(project.id),
            project: project,
            onTapProject: () => onTapProject(project),
            isSelected: project.id == selectedProject.id,
          );
        },
      ).toList(),
    );
  }
}
