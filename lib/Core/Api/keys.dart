import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String subbaseKey = dotenv.env['subbaseKey']??"" ;
  static String subbaseAnonKey = dotenv.env['subbaseAnonKey'] ??"";
}