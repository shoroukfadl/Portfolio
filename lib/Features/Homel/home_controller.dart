import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Utilities/email_JS_services.dart';
import 'home_interface.dart';

class HomeController extends ControllerMVC implements HomeInterface {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();

  late TextEditingController nameController,
      emailController,
      messageController,
      phoneController;

  UserDataModel? user;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Future<void> getUserData() async {
    final _supabase = Supabase.instance.client;

    final profileData = await _supabase
        .from('profiles')
        .select('id')
        .limit(1)
        .maybeSingle();
    print('profiles :: ${profileData}');

    if (profileData == null) return ;

    final String firstId = profileData['id'];

    final response = await _supabase.rpc(
      'get_portfolio_by_id',
      params: {'p_id': firstId},
    );
    print('Data :: ${response}');
    setState(() {});
  }

  void sendMessage() async {
    bool success = await EmailService.sendEmail(templateParams: {
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'message': messageController.text,
    });

    if (success) {
      print('تم إرسال البريد الإلكتروني بنجاح!');
    } else {
      print('فشل إرسال البريد الإلكتروني.');
    }
  }
}
