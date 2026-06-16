// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
//
// import '../Core/Language/app_styles.dart';
// import '../Utilities/extensions.dart';
//
// class CustomHtmlWidget extends StatelessWidget {
//   final String htmlText;
//
//   const CustomHtmlWidget({super.key, required this.htmlText});
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = context.colors;
//
//     return HtmlWidget(
//       htmlText,
//       customStylesBuilder: (element) {
//         if (element.classes.contains('foo')) {
//           return {'color': 'red'};
//         }
//
//         return null;
//       },
//       renderMode: RenderMode.column,
//       textStyle: AppTextStyles.regular14(),
//     );
//   }
// }
