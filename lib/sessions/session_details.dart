import 'package:flutter/material.dart';
import 'package:ux_app/login/login_screen.dart';
import 'package:ux_app/profile/profile_screen.dart';
import 'package:ux_app/sessions/session_screen.dart';

class SessionDetails extends StatefulWidget {
  final Session session;
  const SessionDetails({super.key, required this.session});

  @override
  State<SessionDetails> createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  late Session session;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = widget.session;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(session.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(children: [
          (session.game != null)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                      width: 64,
                      child: Placeholder(),
                    ),
                    Text(
                      session.game!.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 24),
                    )
                  ],
                )
              : IconButton(onPressed: () => {}, icon: const Icon(Icons.edit)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.access_time),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text("${session.time.hour}:${session.time.minute}"),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          "${session.time.day}:${session.time.month}:${session.time.year}")
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [Text(session.location)],
                  )
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          user: session.host,
                        )),
              )
            },
            child: Chip(
                label: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF6750A4),
                  child: Text(
                    session.host.name[0].toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(session.host.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
                Icon(Icons.king_bed),
              ],
            )),
          ),
          if (session.participants.length >= 0)
            Text(
              "Participants",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          for (var i in session.participants)
            InkWell(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            user: i,
                          )),
                )
              },
              child: Chip(
                  label: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF6750A4),
                    child: Text(
                      i.name[0].toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(i.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                  Icon(Icons.report),
                  Icon(Icons.recommend),
                ],
              )),
            ),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text("Join"))
        ]),
      ),
    ));
  }
}
