import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_list.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/curved_card_widget.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatefulWidget {
  final List<ProjectEntity> projects;

  final TextStyle? myStyle, titleStyle;

  const MyProjectsWidget(
      {super.key, this.projects = const [], this.myStyle, this.titleStyle});

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  bool isMan =true;
  late List<ProjectEntity> man , auto;
  @override
  void initState() {
    super.initState();

    man =     widget.projects.where((e)=>e.isManual).toList();
    auto =     widget.projects.where((e)=>!e.isManual).toList();
  }
  void previewMan(bool m)=> setState(() {
    isMan = m;
  });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      children: [
        Row(
          children: [
            SectionsTitleWidget(
              key: GlobalKeys.projects,
              title: 'Project Testing Reports',
              titleStyle: widget.titleStyle,
              myStyle: widget.myStyle,
            ),

            const Spacer(),
            CustomButtonWidget(
              title: 'Manual Testing',
              onPressed: (){
                if(!isMan) previewMan(true);
              },
              width: 160,
              titleColor: !isMan ? colors.accent: Colors.white,
              borderColor: isMan ? colors.accent: colors.text3,
              btnColor: isMan ? colors.accent : Colors.transparent,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(8),
                bottomStart: Radius.circular(8),
              ),
            ),
            CustomButtonWidget(
              title: 'Automation Testing',
              onPressed: (){
                if(isMan) previewMan(false);
              },
              width: 160,
              titleColor: isMan ? colors.accent: Colors.white,
              borderColor: !isMan ? colors.accent: colors.text3,
              btnColor: !isMan ? colors.accent : Colors.transparent,
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(8),
                bottomEnd: Radius.circular(8),
              ),
            )

          ],
        ),

        if(isMan) ProjectsList(projects: man,)
        else ProjectsList(projects: auto,)
      ],
    );
  }
}

