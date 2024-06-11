import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              InkWell(
                onTap: () => {},
                child: const Chip(
                    label: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF6750A4),
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text("Account",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Manage account details",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ])),
                  ],
                )),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () => {},
                child: const Chip(
                    label: Row(
                  children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text("Notifications",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Manage notification settings",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ])),
                    Icon(Icons.arrow_right)
                  ],
                )),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () => {},
                child: const Chip(
                    label: Row(
                  children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text("About",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                        ])),
                    Icon(Icons.arrow_right)
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
