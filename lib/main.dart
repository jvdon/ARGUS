import 'package:ARGUS/models/user.dart';
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

  final bool logged = preferences.get("user") != null;
  bool empresa = false;
  @override
  Widget build(BuildContext context) {
    print(preferences.get("user"));

    if(logged){
      User user = User.fromJson(preferences.getString("user")!);
      empresa = user.empresa;
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const LoginPage(),
        "/register": (context) => const SignupPage(),
        "/app": (context) => const MainPage(empresa: false,),
        "/empresa":(context) => const MainPage(empresa: true,),
        "/welcome": (context) => const WelcomePage()
      },
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(body: logged ? MainPage(empresa: empresa,) : const WelcomePage()),
    );
  }
}
