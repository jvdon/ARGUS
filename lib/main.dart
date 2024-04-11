import 'package:ARGUS/pages/login_page.dart';
import 'package:ARGUS/pages/main_page.dart';
import 'package:ARGUS/pages/signup_page.dart';
import 'package:ARGUS/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  // preferences = await SharedPreferences.getInstance();  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool logged = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => SignupPage()
      },
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(body: logged ? MainPage() : WelcomePage()),
    );
  }
}

