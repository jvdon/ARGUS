import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ARGUS.png"),
            // Text(
            //   "ARGUS",
            //   style: GoogleFonts.handjet(fontSize: 76, letterSpacing: 4),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Conectando o mundo para um futuro sem lixo",
              style: GoogleFonts.handjet(fontSize: 24),
            ),
            CustomButton(
              content: "LOGIN",
              onClick: () {
                Navigator.of(context).pushNamed("/login");
              },
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/register");
              },
              child: Text(
                "Don’t have an account yet? Sign-up for free",
                style: GoogleFonts.inder(
                  fontSize: 12,
                  color: palette["green2"],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
