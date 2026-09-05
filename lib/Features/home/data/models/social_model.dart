import 'package:flutter/cupertino.dart';

class SocialModel {
  final String title;
  final IconData icon;
  final void Function() onPressed;
  const SocialModel(
      {required this.title, required this.onPressed, required this.icon});
}
