import 'package:flutter/material.dart';
import 'package:seneca_app/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "login_screen",
      routes: {
        "login_screen": (_) => LoginScreen(),
      },
    );
  }
}