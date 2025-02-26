import 'package:flutter/material.dart';

import '../../Utilities/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;
  changeTheme() async {
    isDark = !isDark;
    await SharedPref.setTheme(isDark);
    notifyListeners();
  }

  getCurrentTheme() {
    isDark = SharedPref.getTheme();
  }
}
