import 'package:flutter/material.dart';
import 'package:learndio/controller/auth.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static String routeName = "loginpage";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usercont = TextEditingController();

  TextEditingController passcont = TextEditingController();

  var data;

  Auth auth = Auth();

  void goToLogin(String username, String password) async {
    var res = await auth.login(username, password);
    var access_token = res["access"];
    print(access_token == null);
    print(" Helooooooo " + res.toString());
    if (access_token != null) {
      var user_auth = await auth.isAuth(access_token);
      setState(() {
        data = user_auth;
      });
    } else {
      // var user_auth = await auth.isAuth(access: '');
      setState(() {
        data = res;
      });
    }

    // print(user_auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I am login page"),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: usercont,
            decoration: InputDecoration(hintText: "username"),
          ),
          TextField(
              controller: passcont,
              decoration: InputDecoration(hintText: "password")),
          ElevatedButton(
              onPressed: () {
                data = "";
                goToLogin(usercont.text, passcont.text);
              },
              child: const Text("Login")),
          Text(data.toString()),
        ],
      )),
    );
  }
}
