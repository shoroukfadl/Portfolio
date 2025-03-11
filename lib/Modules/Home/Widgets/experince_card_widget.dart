import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/custom_rounded_icon_button.dart';

import '../../../Models/user_data_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Widgets/sections_title_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  final List<Experince> items;
  const ExperienceCardWidget({super.key,this.items =const[]});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: ThemeFactory.of(context).primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionsTitleWidget(
           title: Strings.experience.translate,
          ),
          16.0.heightBox,
          ListView.separated(itemBuilder: (context,i)=>  ExperienceItemCard(
            item: items[i],
          ),
              separatorBuilder: (context, index) => 16.0.heightBox, itemCount: items.length,shrinkWrap: true,)
        ],
      ),
    );
  }
}

class ExperienceItemCard extends StatelessWidget {
  final Experince? item;
  const ExperienceItemCard({super.key, this.item});

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
              Text("${item?.name??""}", style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(
                color: ThemeFactory.of(context).secondary300
              ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item?.date??"", style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(
                    color: ThemeFactory.of(context).secondary300
                  ),),

                  Text(item?.location??"", style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(
                    color: ThemeFactory.of(context).secondary300
                  ),),
                ],
              ),
            ],
          ),
              16.0.heightBox,
              Text(item?.description??"",
                style: TextStyleHandler.of(context).headingTextStyleRegular20.copyWith(
                  color:ThemeFactory.of(context).card
                ),),
        ],
      ),
    );
  }
}
