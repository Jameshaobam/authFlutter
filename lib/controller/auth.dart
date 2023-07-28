import 'package:dio/dio.dart';

// import 'package:get_storage/get_storage.dart';
class Auth {
  Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.4:8000"));

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> postData = {
      'username': '$username',
      'password': '$password',
    };

    var res = await dio.post(
      "/api/token/",
      options: Options(
        contentType: "application/json",
      ),
      data: postData,
    );
    print(res.data);
    return res.data;
  }

  Future<Map<String, dynamic>> getData() async {
    List users = [];

    Map<String, dynamic> data = {};
    try {
      final response = await dio.get('/api/event/v1/all/?state=manipur');

      data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
      return data;
    }
  }
}
