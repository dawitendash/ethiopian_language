import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class GreetingsPage extends StatefulWidget {
  @override
  _GreetingsPageState createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
  List<String> greetings = [
    "Hello",
    "Good morning.",
    "Good morning. (2)",
    "Good morning. (3)",
    "Good afternoon.",
    "Good afternoon. (2)",
    "Good afternoon. (3)",
    "Good evening.",
    "Good evening. (2)",
    "Good evening. (3)",
  ];

  Map<String, bool> favoriteMap = {};
  Map<String, bool> expandedMap = {};
  Map<String, String> translationMap = {
    "Hello": "ሰላም",
    "Good morning.": "እንደምን አደርክ",
    "Good morning. (2)": "እንደምን አደርሽ(2)",
    "Good morning. (3)": "እንደምን አደራችሁ (3)",
    "Good afternoon.": "እንደምን ዋልክ",
    "Good afternoon. (2)": "እንደምን ዋልሽ (2)",
    "Good afternoon. (3)": "እንደምን ዋላችሁ (3)",
    "Good evening.": "እንደምን አመሸህ",
    "Good evening. (2)": "እንደምን አመሸሽ (2)",
    "Good evening. (3)": "እንደምን አመሻችሁ (3)",
  };

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    for (var greeting in greetings) {
      expandedMap[greeting] = false;
    }
  }

  _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('Myfavorites') ?? [];
    setState(() {
      for (var greeting in greetings) {
        favoriteMap[greeting] = favorites.contains(greeting);
      }
    });
  }

  _toggleFavorite(String greeting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('Myfavorites') ?? [];

    setState(() {
      if (favoriteMap[greeting] == true) {
        favoriteMap[greeting] = false;
        favorites.remove(greeting);
      } else {
        favoriteMap[greeting] = true;
        favorites.add(greeting);
      }
    });

    await prefs.setStringList('Myfavorites', favorites);
  }

  void _playSound(String greeting) async {
    try {
      String soundPath = 'hello.mp3';

      await audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Greetings", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search words and phrases",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: greetings.length,
              itemBuilder: (context, index) {
                final greeting = greetings[index];
                return Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 48,
                        height: 48,
                        child: IconButton(
                          icon: Icon(
                            favoriteMap[greeting] == true
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.yellow,
                          ),
                          onPressed: () {
                            _toggleFavorite(greeting);
                          },
                        ),
                      ),
                      title: Text(greeting),
                      trailing: IconButton(
                        icon: Icon(
                          expandedMap[greeting] == true
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                        ),
                        onPressed: () {
                          setState(() {
                            expandedMap[greeting] = !expandedMap[greeting]!;
                          });
                        },
                      ),
                    ),
                    if (expandedMap[greeting] == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 68.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.book),
                                SizedBox(width: 8),
                                Text("${translationMap[greeting]}"),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.volume_up),
                                  onPressed: () {
                                    _playSound(greeting);
                                  },
                                ),
                                SizedBox(width: 8),
                                Text("helo"),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
