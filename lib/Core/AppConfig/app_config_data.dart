
import '../Language/app_languages.dart';

class AppConfig {
  AppConfig._();
  static final AppConfig _instance = AppConfig._();
  static AppConfig get instance => _instance;

  // Global values
   String  currentCurrency() => !appLangIsArabic() ?  'IQD':"د.ع";
}