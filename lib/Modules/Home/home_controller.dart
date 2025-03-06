import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  late TextEditingController nameController  , emailController , messageController  , phoneController;

  List<QueryDocumentSnapshot> data = [];


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
   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("1").get();
   data.addAll(querySnapshot.docs);
   print("Data ::::::::::::::::::::::::::: >............. ${data.firstOrNull?["name"]}");
   setState((){});
  }




}
