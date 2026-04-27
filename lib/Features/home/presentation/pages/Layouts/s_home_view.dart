import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../widgets/contact_me.dart';

class SmallHomeView extends StatelessWidget {

  const SmallHomeView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.0.heightBox,
        // PersonalInfoWidget(
        //   personalData: con.user?.summary,
        // ).paddingSymmetric(horizontal: 32),

        64.0.heightBox,


        // AboutMeWidget(
        //   name: con.user?.name ?? "",
        //   role: con.user?.jobName ?? "",
        //   desc: con.user?.summary ??
        //       "Jenny’s Exceptional product design ensure our website’s success. Highly Recommended",
        // ),

        ContactMeWidget()
      ],
    );
  }
}
