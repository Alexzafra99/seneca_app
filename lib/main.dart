import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_app/provider/email_provider.dart';
import 'package:seneca_app/provider/login_provider.dart';
import 'package:seneca_app/screens/home_screen.dart';
import 'package:seneca_app/screens/loginFireBase_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginProvider(), lazy: false),
        ChangeNotifierProvider(create: (context)=> EmailProvider(), lazy: false,)
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
      initialRoute: "loginFireBase_screen",
      routes: {
        "loginFireBase_screen": (_) => LoginFireBaseScreen(),
        "home_screen": (_) => HomeScreen(),
      },
    );
  }
}