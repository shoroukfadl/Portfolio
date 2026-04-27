import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'education_card.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  @override
  Widget build(BuildContext context) {
    final education = [
      EductionModel(
        degree: 'Bachelor of Science',
        field: 'Computer Science',
        institution: 'Cairo University',
        year: '2018 - 2022',
        description: 'Focus on mobile development and software engineering principles.',
        details: 'GPA: 3.8/4.0 | Dean\'s List',
        icon: '🎓',
      ),
    ];

    final colors = context.colors;
    return Column(
      spacing: 60,
      children: [
       SectionsTitleWidget(title: Strings.education.translate),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: education.length,
          itemBuilder: (context, index) {
            return EducationCard(
              item: education[index],
              index: index,
              totalItems: education.length,
            );
          },
        ),
      ],
    );
  }
}



