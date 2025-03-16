
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../Core/Theme/theme_model.dart';
import '../../../Models/user_data_model.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/sections_title_widget.dart';
import '../../../generated/assets.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<Project> projects ;
  const MyProjectsWidget({super.key, this.projects = const []});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: ThemeFactory.of(context).primary,
      child: Column(
        children: [
          SectionsTitleWidget(
            key:  GlobalKeys.projects,
            title: Strings.projects.translate,
          ),
          16.0.heightBox,
          ListView.separated(itemBuilder: (context,i)=>  ProjectItemCard(
            left: i%2 == 0,
            project: projects[i],
            index: i+1,
          ),
            separatorBuilder: (context, index) => 32.0.heightBox, itemCount: projects.length,shrinkWrap: true,)
        ],
      ),
    );
  }
}


class ProjectItemCard extends StatelessWidget {
  final bool left ;
  final Project?project;
  final int index ;
  const ProjectItemCard({super.key, this.left = false, this.project, required this.index});

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
            Text("$index" , style: TextStyleHandler.of(context).displayTextStyleExtraBold48.copyWith(color: ThemeFactory.of(context).card),),
           16.0.heightBox,
            Row(
              children: [
                Text(project?.projectName??"" , style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(color: ThemeFactory.of(context).card),),
                Text("(${project?.type??"" })", style: TextStyleHandler.of(context).headingTextStyleBold16.copyWith(color: ThemeFactory.of(context).secondary300),),
              ],
            ),
            16.0.heightBox,
            Text(project?.description??"" , style: TextStyleHandler.of(context).paragraphTextStyleRegular16.copyWith(color: ThemeFactory.of(context).secondary300),),
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
                Text("$index" , style: TextStyleHandler.of(context).displayTextStyleExtraBold48.copyWith(color: ThemeFactory.of(context).card),),
                16.0.heightBox,
                Row(
                  children: [
                    Text(project?.projectName??"" , style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(color: ThemeFactory.of(context).card),),
                    Text("(${project?.type??"" })", style: TextStyleHandler.of(context).headingTextStyleBold16.copyWith(color: ThemeFactory.of(context).secondary300),),
                  ],
                ),
                16.0.heightBox,
                Text(project?.description??"" , style: TextStyleHandler.of(context).paragraphTextStyleRegular16.copyWith(color: ThemeFactory.of(context).secondary300),),
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
