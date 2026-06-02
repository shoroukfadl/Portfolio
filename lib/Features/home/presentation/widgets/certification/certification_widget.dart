import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/strings.dart';
import 'certification_card.dart';

class CertificationSection extends StatelessWidget {
  final List<CertificateEntity> data;
  const CertificationSection({super.key,  this.data =const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(title: Strings.certification.translate.toUpperCase() ,subtitle: '${data.length} Certifications' ,),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (c,i)=>8.0.heightBox,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CertificationCard(
                  item: data[index],
                ),
                if(index <data.length-1)
                  DividerWidget(thickness: 0.8,)
              ],
            );
          },
        ),
      ],
    );
  }
}



