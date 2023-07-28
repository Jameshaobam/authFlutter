import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  var data = {'title': 'My first post'};
  http
      .post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: json.encode(data),
  )
      .then((resp) {
    print(resp.body);
  });
}
