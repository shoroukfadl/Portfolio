import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rocklis/Utilities/text_style_helper.dart';

class CustomHtmlWidget extends StatelessWidget {
  final String htmlText;
  const CustomHtmlWidget( {super.key, required this.htmlText});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
     htmlText ,
      customStylesBuilder: (element) {
        if (element.classes.contains('foo')) {
          return {'color': 'red'};
        }

        return null;
      },
      renderMode: RenderMode.column,
      textStyle: TextStyleHelper.of(context).regular16,
    );
  }
}
