import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rocklis/Modules/Splash/support_interface.dart';

class SplashController extends ControllerMVC implements SupportInterface {
  // singleton
  factory SplashController() {
    _this ??= SplashController._();
    return _this!;
  }

  static SplashController? _this;

  SplashController._();




}
