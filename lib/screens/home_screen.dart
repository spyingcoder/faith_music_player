import 'package:faith_music_player/screens/home_area.dart';
import 'package:faith_music_player/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  //music Player objects -------------------------->
  AudioPlayer _player;
  AudioCache cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

  // DEFAULT APPBAR
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //Slider for music streaming
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
        activeColor: Colors.blue[800],
        inactiveColor: Colors.grey[350],
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

//////////////////////////////////////////////////////////////
//////////////////////----------MUSIC PLAYER FUNCTIONS STARTS
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //audio player time handling, will help in getting the music duration MDH MDH
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

//this will help in moving the cursor while playing the music, asli masale sach sach
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load("sound_test.mp3");
    //no need to specify the full path here, just put the music file in asset folder
  }

//////////////////////----------MUSIC PLAYER FUNCTIONS ENDS
//////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const MenuDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "FAITH",
            style: TextStyle(
              color: Colors.white,
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.library_music)),
              Tab(icon: Icon(Icons.playlist_add)),
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
          child: TabBarView(
            children: [
              //  4
              //  Child
              //  Must
              //  Be
              //  Required
              //
              //child - 1 HOME AREA or NOW PLAYING
              HomeArea(),

              //child - 2
              const Icon(Icons.directions_transit, size: 350),

              //child - 3
              const Icon(Icons.directions_car, size: 350),

              //child - 4
              const Icon(Icons.directions_car, size: 350),
            ],
          ),
        ),
        // child: Stack(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: MediaQuery.of(context).size.height,
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //           colors: [
        //             Colors.blue[800],
        //             Colors.blue[200],
        //           ],
        //         ),
        //       ),
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.only(top: 18.0, left: 12.0, right: 12.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           // crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             //
        //             //child 1 - Row containing Text "NOW PLAYING"
        //             //
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               // crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 // IconButton(
        //                 //   icon: const Icon(
        //                 //     Icons.menu,
        //                 //     size: 30,
        //                 //   ),
        //                 //   onPressed: () =>
        //                 //       scaffoldKey.currentState.openDrawer(),
        //                 // ),
        //               ],
        //             ),
        //             //
        //             //child 2 - Row which will have four Icon Buttons
        //             //
        //             Row(
        //               children: [
        //                 //child 1 - Home Icon Button
        //                 //child 2
        //                 //child 3
        //                 //child 4
        //               ],
        //             ),
        //             //child 3
        //             //child 4
        //             //child 5
        //             //child 6
        //             //child 7
        //           ],
        //         ),
        //       ),
        //     ),
        //     // Positioned(
        //     //   right: 10,
        //     //   top: 25,
        //     //   child: IconButton(
        //     //     icon: const Icon(
        //     //       Icons.menu,
        //     //       size: 30,
        //     //     ),
        //     //     onPressed: () => scaffoldKey.currentState.openDrawer(),
        //     //   ),
        //     // ),
        //   ],
        // ),

        //FOR TESTING PURPOSE
        //------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        // floatingActionButton: Center(
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed('/musicScreen');
        //     },
        //     child: const Icon(Icons.arrow_forward_ios),
        //   ),
        // ),
        //------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      ),
    );
  }
}
