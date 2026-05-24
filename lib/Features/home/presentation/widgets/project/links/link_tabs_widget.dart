import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'links_list_widget.dart';


class LinkTabsWidget extends StatefulWidget {
  final List<LinkEntity> ios;
  final List<LinkEntity> web;
  final List<LinkEntity> android;

  const LinkTabsWidget({
    super.key,
    this.ios = const [],
    this.web = const [],
    this.android = const [],
  });

  @override
  State<LinkTabsWidget> createState() => _LinkTabsWidgetState();
}

class _LinkTabsWidgetState extends State<LinkTabsWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.android.isNotEmpty)
        LinksListWidget(
         links: widget.android,
          title: 'android',
          icon:Icons.android ,
          color: Colors.green,
       ),

        if(widget.ios.isNotEmpty)
          LinksListWidget(
         links: widget.ios,
          title: 'ios',
          color: Colors.black,
          icon:Icons.apple ,
       ),
        if(widget.web.isNotEmpty)
          LinksListWidget(
         links: widget.web,
          title: 'web',
          color: Colors.grey,
          icon:Icons.language ,
       ),
      ],
    );
  }


}
