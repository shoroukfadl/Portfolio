import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Models/user_data_model.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Widgets/sections_title_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  final List<Experince> items;
  final TextStyle? myStyle , titleStyle;
  final TextStyle? nameStyle , dateStyle, locationStyle, descriptionStyle;
  const ExperienceCardWidget({super.key,this.items =const[], this.myStyle, this.titleStyle, this.nameStyle, this.dateStyle, this.locationStyle, this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: ThemeFactory.of(context).primary,
      child: Column(
        children: [
          SectionsTitleWidget(
            key:  GlobalKeys.experince,
           title: Strings.experience.translate,
            titleStyle: titleStyle,
            myStyle: myStyle,
          ),
          16.0.heightBox,
          ListView.separated(itemBuilder: (context,i)=>  ExperienceItemCard(
            item: items[i],
            dateStyle: dateStyle,
            nameStyle: nameStyle,
            locationStyle: locationStyle, descriptionStyle: descriptionStyle
          ),
              separatorBuilder: (context, index) => 16.0.heightBox, itemCount: items.length,shrinkWrap: true,)
        ],
      ),
    );
  }
}

class ExperienceItemCard extends StatelessWidget {
  final Experince? item;
  final TextStyle? nameStyle , dateStyle, locationStyle, descriptionStyle;
  const ExperienceItemCard({super.key, this.item, this.nameStyle, this.dateStyle, this.locationStyle, this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ThemeFactory.of(context).secondary300
        )
      ),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item?.name??"", style: ( nameStyle ??TextStyleHandler.of(context).headingTextStyleBold20).copyWith(
                color: ThemeFactory.of(context).secondary300
              ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item?.date??"", style: (dateStyle ??TextStyleHandler.of(context).headingTextStyleBold20).copyWith(
                    color: ThemeFactory.of(context).secondary300
                  ),),

                  Text(item?.location??"", style: (locationStyle ?? TextStyleHandler.of(context).headingTextStyleBold20).copyWith(
                    color: ThemeFactory.of(context).secondary300
                  ),),
                ],
              ),
            ],
          ),
              16.0.heightBox,
              Text(item?.description??"",
                style: (descriptionStyle ??
                    TextStyleHandler.of(context).headingTextStyleRegular20).copyWith(
                  color:ThemeFactory.of(context).card
                ),),
        ],
      ),
    );
  }
}
