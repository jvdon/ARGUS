import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/partials/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ARGUS.png"),
            const SizedBox(
              height: 20,
            ),
            Text("LOGIN",
                style: GoogleFonts.inder(fontSize: 24, letterSpacing: 2)),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              label: "USERNAME",
              controller: username,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              label: "PASSWORD",
              controller: password,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              content: "LOGIN",
              onClick: () {},
            )
          ],
        ),
      ),
    );
  }
}