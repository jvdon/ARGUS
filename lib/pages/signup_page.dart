import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/partials/custom_input.dart';
import 'package:ARGUS/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> key = GlobalKey();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Text("SIGN-UP",
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
              label: "EMAIL",
              controller: email,
              type: TextInputType.emailAddress,
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
            CustomInput(
              label: "CONFIRM PASSWORD",
              controller: rePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              content: "SIGN-UP",
              onClick: () async {
                if (key.currentState!.validate()) {
                  UserRepo repo = UserRepo();
                  bool loggedIn = await repo.register(
                      username.text, email.text, password.text);
                  if (loggedIn) {
                    Navigator.of(context).pushReplacementNamed("/app");
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
