import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/project_card_preview.dart';
import 'package:portfolio/Utilities/extensions.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectEntity> projects;

  final TextStyle? myStyle, titleStyle;

  const MyProjectsWidget(
      {super.key, this.projects = const [], this.myStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
          titleStyle: titleStyle,
          myStyle: myStyle,
        ),
        16.0.heightBox,
        SizedBox(
          height: 400,
          child: ListView.separated(
            itemBuilder: (context, i) => ProjectItemCard(
              project: projects[i],

            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => 32.0.heightBox,
            itemCount: projects.length,
          ),
        )
      ],
    );
  }
}

