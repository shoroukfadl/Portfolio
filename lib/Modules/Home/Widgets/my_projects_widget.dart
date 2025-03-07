
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../Core/Theme/theme_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/sections_title_widget.dart';
import '../../../generated/assets.dart';

class MyProjectsWidget extends StatelessWidget {
  const MyProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: ThemeFactory.of(context).primary,
      child: Column(
        children: [
          SectionsTitleWidget(
            title: Strings.projects.translate,
          ),
          16.0.heightBox,
          ListView.separated(itemBuilder: (context,i)=>  ProjectItemCard(
            left: i%2 == 0,
          ),
            separatorBuilder: (context, index) => 32.0.heightBox, itemCount: 3,shrinkWrap: true,)
        ],
      ),
    );
  }
}


class ProjectItemCard extends StatelessWidget {
  final bool left ;
  const ProjectItemCard({super.key, this.left = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(left)
       ...[
         RoundedImage(
           imagePath: "",
           height: 340,
           width: 400,
           radiusValue: 16,
           radius: 0,
         ),
        16.0.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("01" , style: TextStyleHandler.of(context).displayTextStyleExtraBold48.copyWith(color: ThemeFactory.of(context).card),),
           16.0.heightBox,
            Text("jjgkortopirommn jflkgkspdflpd " , style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(color: ThemeFactory.of(context).card),),
           16.0.heightBox,
            Text("jjgkortopirommn jflkgkspdflpd " , style: TextStyleHandler.of(context).paragraphTextStyleRegular16.copyWith(color: ThemeFactory.of(context).secondary300),),
           16.0.heightBox,
            InkWell(
              onTap: (){},
              child: SvgPicture.asset(Assets.linearExport, width: 20,height: 20,),
            )

          ],
        ).expandFlex(2)
       ]
        else
          ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("01" , style: TextStyleHandler.of(context).displayTextStyleExtraBold48.copyWith(color: ThemeFactory.of(context).card),),
                16.0.heightBox,
                Text("jjgkortopirommn jflkgkspdflpd " , style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(color: ThemeFactory.of(context).card),),
                16.0.heightBox,
                Text("jjgkortopirommn jflkgkspdflpd " , style: TextStyleHandler.of(context).paragraphTextStyleRegular16.copyWith(color: ThemeFactory.of(context).secondary300),),
                16.0.heightBox,
                InkWell(
                  onTap: (){},
                  child: SvgPicture.asset(Assets.linearExport, width: 20,height: 20,),
                )

              ],
            ).expandFlex(2),
            16.0.widthBox,
          RoundedImage(
            imagePath: "",
            height: 340,
            width: 400,
            radiusValue: 16,
            radius: 0,
          ),
        ]
      ],
    );
  }
}
