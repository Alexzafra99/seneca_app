import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_app/provider/login_provider.dart';
import 'package:seneca_app/screens/home_screen.dart';
import 'package:seneca_app/screens/login_screen.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginProvider(), lazy: false,)

      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "login_screen",
      routes: {
        "login_screen": (_) => LoginScreen(),
        "home_screen": (_) => HomeScreen(),
      },
    );
  }
}