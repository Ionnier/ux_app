import 'package:flutter/material.dart';
import 'package:ux_app/gamescreen/game_screen.dart';
import 'package:ux_app/main.dart';
import 'package:ux_app/sessions/session_details.dart';
import 'package:ux_app/settings/settings_screen.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

final GAME1 = Game(title: "Nume joc", description: "Descriere joc");

class _SessionsScreenState extends State<SessionsScreen> {
  int _selectedIndex = 0;
  var filterLists = [
    FilterList(
        name: "Mod de joc",
        pluralName: "moduri de joc",
        list: [Filter(false, "PVP"), Filter(false, "PVE")]),
    FilterList(
        name: "Tematica",
        pluralName: "tematici",
        list: [Filter(false, "Strategie"), Filter(false, "Aventura")]),
    FilterList(name: "Factori Aleatori", pluralName: "factori aleatori", list: [
      Filter(false, "Ridicat"),
      Filter(false, "Mediu"),
      Filter(false, "Scazut")
    ]),
    FilterList(
        name: "Participanti",
        pluralName: "numar participanti",
        list: [Filter(false, "4"), Filter(false, "8"), Filter(false, "16+")]),
  ];
  var sessions = [
    Session(DateTime.now(), "Sector 4", GAME1,
        [User(name: "asdsa"), User(name: "basdas")],
        host: User(name: "Abb"), title: "Titlu sesiune"),
  ];

  var games = [Game(title: "Nume joc", description: "Descriere joc")];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in filterLists)
                  InkWell(
                    onTap: () async {
                      await showDialog<FilterList>(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Dialog(
                                  backgroundColor: CustomColors.orangePantone,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          'Alege tematica',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: CustomColors.fluorCyan),
                                        ),
                                        for (var semi in item.list)
                                          Row(
                                            children: [
                                              Text(
                                                semi.name,
                                                style: const TextStyle(
                                                    color:
                                                        CustomColors.fluorCyan),
                                              ),
                                              Checkbox(
                                                  activeColor:
                                                      CustomColors.fluorCyan,
                                                  checkColor: CustomColors.rust,
                                                  value: semi.isSelected,
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        semi.isSelected = value;
                                                      });
                                                      rebuildAllChildren(
                                                          context);
                                                    }
                                                  })
                                            ],
                                          ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Finish'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            });
                          });
                      if (context.mounted) {
                        rebuildAllChildren(context);
                      }
                    },
                    child: Row(children: [
                      Chip(
                          label: Row(
                        children: [
                          if (item.howManySelected() >= 2)
                            const Icon(
                              Icons.waves,
                              size: 16,
                            ),
                          if (item.howManySelected() >= 2)
                            Text(item.pluralName),
                          if (item.howManySelected() == 1)
                            Text(item.getSelected().name),
                          if (item.howManySelected() == 0) Text(item.name),
                          if (item.howManySelected() >= 1)
                            InkWell(
                              child: const Icon(Icons.close, size: 16.0),
                              onTap: () {
                                setState(() {
                                  for (var element in item.list) {
                                    element.isSelected = false;
                                  }
                                });
                              },
                            ),
                        ],
                      )),
                      const SizedBox(
                        width: 8,
                      )
                    ]),
                  ),
              ],
            ),
          ),
          if (_selectedIndex == 0)
            for (var item in sessions)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SessionDetails(
                              session: item,
                            )),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFF6750A4),
                      child: Text(
                        item.host.name[0].toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${item.time.day}.${item.time.month}.${item.time.year} - ${item.location}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Spacer(),
                    const SizedBox(
                      width: 4,
                    ),
                    const Placeholder(
                      child: SizedBox(
                        height: 64,
                        width: 64,
                      ),
                    )
                  ],
                ).wrapInPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8)),
              ),
          if (_selectedIndex == 1)
            for (var item in games)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              game: item,
                            )),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: Placeholder(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          item.description,
                          style: const TextStyle(
                              fontSize: 14, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ).wrapInPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8)),
              ),
        ],
      ).wrapInPadding(padding: const EdgeInsets.symmetric(horizontal: 8)),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      floatingActionButton: (_selectedIndex == 0)
          ? FloatingActionButton(
              backgroundColor: CustomColors.rust,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.diversity_2),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Learn',
          ),
        ],
        backgroundColor: CustomColors.orangePantone,
        selectedItemColor: CustomColors.fluorCyan,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    ));
  }
}

class FilterList {
  final String name;
  final String pluralName;
  final List<Filter> list;
  FilterList(
      {required this.name, required this.list, required this.pluralName});
  int howManySelected() {
    return list.where((element) => element.isSelected).length;
  }

  Filter getSelected() {
    return list.firstWhere((element) => element.isSelected);
  }
}

class Filter {
  bool isSelected;
  String name;

  Filter(this.isSelected, this.name);
}

class Game {
  String title;
  String description;

  Game({required this.title, required this.description});
}

class Session {
  String title;
  User host;
  DateTime time;
  String location;
  Game? game;
  List<User> participants;

  Session(this.time, this.location, this.game, this.participants,
      {required this.host, required this.title});
}

class User {
  String name;

  User({required this.name});
}
