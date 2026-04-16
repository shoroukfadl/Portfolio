import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'experince_item_card.dart';

class ExperienceCardWidget extends StatelessWidget {
  final List<ExperienceModel> items;
  final TextStyle? myStyle, titleStyle;
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const ExperienceCardWidget(
      {super.key,
      this.items = const [],
      this.myStyle,
      this.titleStyle,
      this.nameStyle,
      this.dateStyle,
      this.locationStyle,
      this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.surfaceElevated),
      child: Column(
        children: [
          SectionsTitleWidget(
            key: GlobalKeys.experince,
            title: Strings.experience.translate,
            titleStyle: titleStyle,
            myStyle: myStyle,
          ),
          16.0.heightBox,
          ListView.separated(
            itemBuilder: (context, i) => ExperienceItemCard(
                item: ExperienceModel(
                    companyLocation: 'Cognizant, Mumbai',
                    companyName: 'xxx Company',
                    companyUrl: '',
                    date: '2020 -2024',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales ',
                    roleName: 'flutter Developer'),
                dateStyle: dateStyle,
                nameStyle: nameStyle,
                locationStyle: locationStyle,
                descriptionStyle: descriptionStyle),
            separatorBuilder: (context, index) => 16.0.heightBox,
            itemCount: 1,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
