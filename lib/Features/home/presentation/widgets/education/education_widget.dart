import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/Custom/rounded_doted_widget.dart';
import '../../../../../Widgets/sections_title_widget.dart';

import 'package:flutter/material.dart';

import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final List<EducationEntity> education;
  const EducationSection({Key? key,  this.education =const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {


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



