import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';

import '../../Utilities/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.init());

  void changeTheme() async {
    emit(state.copyWithMethod(isDark: !state.isDark));
    await SharedPref.setTheme(state.isDark);
    print('tHEEE : ${SharedPref.getTheme()}');
  }

  void getCurrentTheme() {
    bool isDark = SharedPref.getTheme()??false;
    print('tHEEE gggg: ${SharedPref.getTheme()}');
    emit(state.copyWithMethod(isDark: isDark));
  }
}
