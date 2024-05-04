import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/partials/custom_input.dart';
import 'package:ARGUS/repos/user_repo.dart';
import 'package:ARGUS/utils.dart';
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
  bool empresa = false;

  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

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
              type: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              label: "CONFIRM PASSWORD",
              controller: rePassword,
              type: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Empresa",
                  style: GoogleFonts.inder(fontSize: 24, color: Colors.white),
                ),
                Switch(
                  value: empresa,
                  thumbIcon: thumbIcon,
                  activeColor: palette["green3"],
                  inactiveThumbColor: palette["red"],
                  onChanged: (value) {
                    setState(() {
                      empresa = value;
                    });
                  },
                ),
              ],
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
                      username.text, email.text, empresa, password.text);
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
