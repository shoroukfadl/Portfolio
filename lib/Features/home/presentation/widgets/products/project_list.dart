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
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 1.2),
      itemBuilder: (c,i)=> ProjectItemCard(
        project: projects[i],
      )
    );
  }
}

