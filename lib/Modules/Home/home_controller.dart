import 'package:mvc_pattern/mvc_pattern.dart';
import 'home_interface.dart';

class HomeController extends ControllerMVC implements HomeInterface {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();




}
