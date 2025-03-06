import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocklis/Core/Theme/theme_model.dart';
import 'package:rocklis/Utilities/Constants/constants.dart';

class CustomBaseCard extends StatelessWidget {
  final Widget child ;
  final double? height , width;
  final  double? verticalPadding , horizontalPadding;
  final  double? verticalMargin , horizontalMargin;
  final  bool enableHeight;
  const CustomBaseCard({super.key,this.enableHeight = true, required this.child, this.height, this.verticalPadding, this.horizontalPadding, this.verticalMargin, this.horizontalMargin, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:enableHeight?  height ?? 881:null,
      width: width,
      margin:  EdgeInsets.symmetric(horizontal:horizontalMargin ??  128.w,vertical: verticalMargin ?? 86),
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ??  100.w,vertical: verticalPadding?? 105),
      decoration: BoxDecoration(
        color: ThemeFactory.of(context).backgroundColor,
        /*border: Border.all(
          color: ThemeFactory.of(context).font2
        ),*/
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          Constants.defaultBoxShadow
        ]
      ),
      child: child,
    );
  }
}
