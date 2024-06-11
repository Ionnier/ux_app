import 'package:flutter/material.dart';
import 'package:ux_app/sessions/session_screen.dart';

class GameScreen extends StatelessWidget {
  final Game game;
  const GameScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                height: 170,
                width: 190,
                child: Placeholder(),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                game.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Descriere",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Text(
            game.description,
          ),
        ],
      ),
    ));
  }
}
