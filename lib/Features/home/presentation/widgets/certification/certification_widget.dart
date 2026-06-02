import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'certification_card.dart';

class CertificationSection extends StatelessWidget {
  final List<CertificateEntity> data;
  const CertificationSection({super.key,  this.data =const []});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (c,i)=>8.0.heightBox,
      itemBuilder: (context, index) {
        return CertificationCard(
          item: data[index],
        );
      },
    ).expand;
  }
}



