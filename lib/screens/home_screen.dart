import 'package:faith_music_player/screens/home_area.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 2,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "FAITH",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              IconButton(
                tooltip: "Know more about Music",
                icon: const Icon(
                  Icons.info,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.search,
                  semanticLabel: "Search",
                )),
                Tab(
                    icon: Icon(
                  Icons.library_music,
                  semanticLabel: "Music List",
                )),
                Tab(
                    icon: Icon(
                  Icons.play_circle,
                  semanticLabel: "Now Playing",
                )),
                Tab(
                    icon: Icon(
                  Icons.queue_music_rounded,
                  semanticLabel: "Music in Current List",
                )),
                Tab(
                    icon: Icon(
                  Icons.settings,
                  semanticLabel: "Settings",
                )),
              ],
            ),
          ),
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[800],
                  Colors.blue[200],
                ],
              ),
            ),
            child: const TabBarView(
              children: [
                //  5
                //  Child
                //  Must
                //  Be
                //  Required
                //

                //child - 1 Search Area
                Icon(Icons.search, size: 350),

                //child - 2 Music List available in device
                Icon(Icons.library_music, size: 350),

                //child - 3 HOME AREA or NOW PLAYING
                HomeArea(),

                //child - 4 Music in Current Playlist
                Icon(Icons.queue_music_rounded, size: 350),

                //child - 5 Settings
                Icon(Icons.settings, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
