// import 'package:emailjs/emailjs.dart' as emailjs;
//
// class EmailService {
//   static const String serviceId = 'service_hisdn7t';
//   static const String templateId = 'template_ob5p3ic';
//   static const String userId = 'UBnRmqAJ-J0ws5dkB';
//
//   static Future<bool> sendEmail({dynamic templateParams}) async {
//     try {
//       await emailjs.send(
//         serviceId,
//         templateId,
//         templateParams,
//         const emailjs.Options(
//           publicKey: userId,
//         ),
//       );
//       print('SUCCESS!');
//       return true;
//     } catch (error) {
//       if (error is emailjs.EmailJSResponseStatus) {
//         print('ERROR... ${error.status}: ${error.text}');
//       }
//       print(error.toString());
//       return false;
//     }
//   }
// }
