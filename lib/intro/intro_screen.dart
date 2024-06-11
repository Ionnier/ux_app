import 'package:flutter/material.dart';
import 'package:ux_app/login/login_screen.dart';
import 'package:ux_app/main.dart';
import 'package:ux_app/sessions/session_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 56,
            ),
            const SizedBox(
              height: 168,
              child: Placeholder(),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Connect with Fellow Enthusiasts in Your Area!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Spacer(),
            FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: CustomColors.rust,
                    minimumSize: const Size.fromHeight(40)),
                onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SessionsScreen()),
                      )
                    },
                child: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
