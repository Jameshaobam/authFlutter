// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart';

// import 'package:get_storage/get_storage.dart';
class Auth {
  static String office = "http://192.168.1.4:8000";
  static String home_jio = "http://192.168.29.62:8000";
  static String home_phone = 'http://192.168.43.103:8000';
  // Dio dio = Dio(BaseOptions(baseUrl: home));
  Logger logger = Logger();
  var res;

  Future<Map<String, dynamic>> login(String username, String password) async {
    logger.d("head");
    Map<String, dynamic> postData = {
      'username': '$username',
      'password': '$password',
    };
    logger.d("head1");
    try {
      Response res =
          await post(Uri.parse("$office/account/login/"), body: postData);

      // res = await dio.post(
      //   "/api/token/",
      //   options: Options(
      //     contentType: "application/json",
      //   ),
      //   data: postData,
      // );
      // logger.d(res.realUri);

      print("Response " + res.statusCode.toString());

      // print(jsonDecode(res.body)["access"]);
      return jsonDecode(res.body);
    } catch (e) {
      print(res);
      print("Handling Error " + e.toString());
      return {"error": e};
    }
  }

  Future<Map<String, dynamic>> isAuth(String access) async {
    Map<String, dynamic> datas = {};
    try {
      print(access);
      if (access.length <= 0) {
        Response response = await get(
          Uri.parse("$office/account/isauth"),
        );
        print(response.body);
        return jsonDecode(response.body);
      }

      Response response = await get(Uri.parse("$office/account/isauth/"),
          headers: {"Authorization": "Bearer $access"});
      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      return {};
    }
  }

  // Future<Map<String, dynamic>> getData() async {
  //   List users = [];

  //   Map<String, dynamic> data = {};
  //   try {
  //     final response = await get('/api/event/v1/all/?state=manipur');

  //     data = response.body;
  //     return data;
  //   } catch (e) {
  //     print(e.toString());
  //     return data;
  //   }
  // }
}
