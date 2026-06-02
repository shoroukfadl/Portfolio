import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ProjectsList extends StatelessWidget {
  final List<ProjectEntity> projects;


  const ProjectsList(
      {super.key, this.projects = const [], });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
      ...  List.generate(projects.length, (i)=>ProjectItemCard(
          project: projects[i],
        ))
      ],
    );
  }
}

