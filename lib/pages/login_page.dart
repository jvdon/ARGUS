// ignore_for_file: use_build_context_synchronously

import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/partials/custom_input.dart';
import 'package:ARGUS/repos/user_repo.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String error = "";
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ARGUS.png"),
            const SizedBox(
              height: 20,
            ),
            (error.isNotEmpty)
                ? Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: palette["green1"]!, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      color: palette["green2"],
                    ),
                    child: Center(
                      child: Text(
                        error,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inder(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            Text("LOGIN\n$error",
                style: GoogleFonts.inder(fontSize: 24, letterSpacing: 2)),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              label: "E-Mail",
              controller: email,
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
              onClick: () async {
                if (key.currentState!.validate()) {
                  UserRepo repo = UserRepo();
                  bool loggedIn = await repo.login(email.text, password.text);
                  print(loggedIn);
                  if (loggedIn) {
                    Navigator.of(context).pushReplacementNamed("/app");
                  } else {
                    setState(() {
                      error = "Unable to login";
                    });
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
