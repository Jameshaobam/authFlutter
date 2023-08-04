import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:learndio/screens/login.page.dart';
import './screens/home.page.dart';

void main() {
  var queryClient = QueryClient();

  runApp(
    QueryClientProvider(
      queryClient: queryClient,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        Login.routeName: (context) => Login()
      },
    );
  }
}
