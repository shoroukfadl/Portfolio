import 'package:flutter/cupertino.dart';

import '../../Core/Theme/theme_model.dart';
import '../router_config.dart';

class Constants {
  static  Shadow get defaultShadow =>   Shadow(color: ThemeFactory.of(CURRENT_CONTEXT!).font1.withOpacity(0.25),
    blurRadius: 4.0,
    offset: const Offset(0, 4.0),
  );
  static  BoxShadow get defaultBoxShadow =>   const BoxShadow(
    color: Color(0x40000000), // 25% opacity black
    offset: Offset(0, 4), // X: 0, Y: 4
    blurRadius: 4,
    spreadRadius: 0,
  );
}