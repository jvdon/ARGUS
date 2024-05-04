import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Logged out!"),
            const Text("Redirecting to login in"),
            Countdown(
              seconds: 5,
              build: (BuildContext context, double time) =>
                  Text(time.toString()),
              interval: const Duration(milliseconds: 100),
              onFinished: () async {
                final preferences = await SharedPreferences.getInstance();
                await preferences.remove("user");

                Navigator.of(context).pushReplacementNamed("/welcome");
              },
            ),
          ],
        ),
      ),
    );
  }
}
