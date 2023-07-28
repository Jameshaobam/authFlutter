import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import '../controller/auth.dart';
import 'package:flutter/material.dart';

class Home extends HookWidget {
  Home({super.key});

  // Future<Map<String, dynamic>> getData() async {
  //   List users = [];

  //   Map<String, dynamic> data = {};
  //   try {
  //     final response = await dio.get('/api/event/v1/all/?state=manipur');

  //     data = response.data;
  //     return data;
  //   } catch (e) {
  //     print(e.toString());
  //     return data;
  //   }
  // }
  Auth authcont = Auth();

  @override
  Widget build(BuildContext context) {
    final client = useQueryClient();
    final events = useQuery(['events'], authcont.getData);
    print(events.data!["datas"]);

    return Scaffold(
        appBar: AppBar(
          title: Text("Dio&Fquery"),
        ),
        body: Builder(
          builder: (context) {
            if (events.isFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (events.isError) {
              return Center(
                child: Text(events.error!.toString()),
              );
            }
            return Center(
              child: Column(
                children: [
                  Text(events.data!["datas"][0].toString()),
                  ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "loginpage"),
                      child: Text("Next"))
                ],
              ),
            );
          },
        ));
  }
}
