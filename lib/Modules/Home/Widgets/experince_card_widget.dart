import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/custom_rounded_icon_button.dart';

import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';

class ExperienceCardWidget extends StatelessWidget {
  const ExperienceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: ThemeFactory.of(context).primary,
      child: Column(
        children: [
          Text(
            Strings.myExperience.translate,
            style: TextStyleHandler.of(context)
                .headingTextStyleExtraBold20
                .copyWith(color: ThemeFactory.of(context).secondary),
          ),
          16.0.heightBox,
          ListView.separated(itemBuilder: (context,i)=> const ExperienceItemCard(),
              separatorBuilder: (context, index) => 16.0.heightBox, itemCount: 3).expand
        ],
      ),
    );
  }
}

class ExperienceItemCard extends StatelessWidget {
  const ExperienceItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeFactory.of(context).secondary300
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Company Name", style: TextStyleHandler.of(context).headingTextStyleBold20,),
              Text("Nov 19 - Present", style: TextStyleHandler.of(context).headingTextStyleBold20,),
            ],
          ),
              16.0.heightBox,
              Text("description here , this is description ...............", style: TextStyleHandler.of(context).headingTextStyleBold20,),
        ],
      ),
    );
  }
}
