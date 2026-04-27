// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:portfolio/Models/user_data_model.dart';
//
// import '../../Utilities/email_JS_services.dart';
// import 'home_interface.dart';
//
// class HomeController extends ControllerMVC implements HomeInterface {
//   // singleton
//   factory HomeController() {
//     _this ??= HomeController._();
//     return _this!;
//   }
//
//   static HomeController? _this;
//
//   HomeController._();
//
//   late TextEditingController nameController,
//       emailController,
//       messageController,
//       phoneController;
//
//   UserDataModel? user;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//     emailController = TextEditingController();
//     messageController = TextEditingController();
//     phoneController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     messageController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Future<void> getUserData() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection("1").get();
//     user = UserDataModel.fromJson({
//       "name": "Shorouk Fadl",
//       "jobName": "Flutter Developer (Web & Mobile)",
//       "location": "Giza, Egypt",
//       "email": "shoroukfad1975@gmail.com",
//       "linkedIn": "https://linkedin.com/in/shorouk-fadl",
//       "github": "https://github.com/shorouk-fadl",
//       "cv": "Shorouk_fadl_flutter_developer.pdf",
//       "summary":
//           "Dynamic Flutter Developer with 2+ years of experience in building high-performance, cross-platform applications. Proven expertise in Clean Architecture, BLoC, and creating responsive, pixel-perfect UIs.",
//       "skills": [
//         {
//           "skillTitle": "Frameworks & Languages",
//           "skillDesc": "Flutter (Web & Mobile), Dart."
//         },
//         {
//           "skillTitle": "State Management",
//           "skillDesc": "BLoC, Provider, GetX."
//         },
//         {
//           "skillTitle": "Architecture",
//           "skillDesc": "Clean Architecture, MVVM, MVC, SOLID Principles."
//         },
//         {
//           "skillTitle": "Backend & Tools",
//           "skillDesc":
//               "Firebase, RESTful APIs, Git, GitHub, JIRA, Google Cloud Platform."
//         }
//       ],
//       "project": [
//         {
//           "projectName": "Jana Pack",
//           "companyName": "Gulf Grid",
//           "description":
//               "Architected and developed a full-scale E-commerce solution consisting of a Customer Web Portal and a Centralized Admin Dashboard using Clean Architecture.",
//           "link": "https://janapack.com",
//           "projectType": "Web Application",
//           "images": []
//         },
//         {
//           "projectName": "Healing Tours",
//           "companyName": "Noouh For Integrated Solutions",
//           "description":
//               "Healthcare Consultation platform using MVVM. Features include appointment booking and interactive medical profiles.",
//           "link": "",
//           "projectType": "Mobile Application",
//           "images": []
//         },
//         {
//           "projectName": "MTGY System",
//           "companyName": "Graduation Project",
//           "description":
//               "Comprehensive guide to entertainment options, landmarks with VR integration and booking services.",
//           "link": "",
//           "projectType": "Mobile & Web App",
//           "images": []
//         }
//       ],
//       "experience": [
//         {
//           "companyName": "Gulf Grid",
//           "roleName": "Flutter Developer",
//           "date": "April 2025 - Present",
//           "description":
//               "Lead development using Clean Architecture and BLoC. Collaborating with UI/UX designers and mentoring the team.",
//           "companyLocation": "Giza, Egypt"
//         },
//         {
//           "companyName": "Noouh For Integrated Solutions",
//           "roleName": "Flutter Developer",
//           "date": "June 2024 - March 2025",
//           "description":
//               "Engineered mobile applications following MVC pattern and utilized Provider for state handling.",
//           "companyUrl": "",
//           "companyLocation": "6th October, Egypt"
//         }
//       ],
//       "eduction": {
//         "uniName": "Fayoum University",
//         "country": "Egypt",
//         "link": "",
//         "date": "2019 - 2023",
//         "desc":
//             "Bachelor's degree in Computer Science. Grade: Very Good (B) (3.18/4)."
//       }
//     });
//     print("Data ::::::::::::::::::::::::::: >............. ${user?.toJson()}");
//
//     setState(() {});
//   }
//
//   void sendMessage() async {
//     bool success = await EmailService.sendEmail(templateParams: {
//       'name': nameController.text,
//       'email': emailController.text,
//       'phone': phoneController.text,
//       'message': messageController.text,
//     });
//
//     if (success) {
//       print('تم إرسال البريد الإلكتروني بنجاح!');
//     } else {
//       print('فشل إرسال البريد الإلكتروني.');
//     }
//   }
// }
