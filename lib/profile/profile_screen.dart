import 'package:flutter/material.dart';
import 'package:ux_app/sessions/session_screen.dart';

class ProfileScreen extends StatelessWidget {
  User user;
  ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 170,
            child: Placeholder(),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF6750A4),
                child: Text(
                  user.name[0].toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 400,
            height: 400,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              scrollDirection: Axis.vertical,
              crossAxisCount: 6,
              // Generate 100 widgets that display their index in the List.
              children: [
                Icon(Icons.abc),
                Icon(Icons.abc_outlined),
                Icon(Icons.sentiment_dissatisfied),
                Icon(Icons.dns_sharp),
                Icon(Icons.sd),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
