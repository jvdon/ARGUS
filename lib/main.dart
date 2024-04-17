import 'package:ARGUS/pages/login_page.dart';
import 'package:ARGUS/pages/main_page.dart';
import 'package:ARGUS/pages/signup_page.dart';
import 'package:ARGUS/pages/welcome_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool logged = preferences.get("user") != null;

  @override
  Widget build(BuildContext context) {
    print(preferences.get("user"));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const LoginPage(),
        "/register": (context) => const SignupPage(),
        "/app": (context) => const MainPage(),
        "/welcome": (context) => const WelcomePage()
      },
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(body: logged ? const MainPage() : const WelcomePage()),
    );
  }
}
