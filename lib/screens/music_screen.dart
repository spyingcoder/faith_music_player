import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:faith_music_player/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  //music Player objects -------------------------->
  AudioPlayer _player;
  AudioCache cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

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

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //audio player time handling, will help in getting the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

//this will help in moving the cursor while playing the music
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load("sound_test.mp3");
    //no need to specify the full path here, just put the music file in asset folder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0, left: 12.0, right: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 32.0,
              // ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "FAITH",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "It's more than a music player",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Center(
                child: Container(
                  width: 280.0,
                  height: 280.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Center(
                child: Text(
                  "La Casa De Papel - Sound Track",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 500.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            slider(),
                            Text(
                              '${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 45.0,
                            color: Colors.blue,
                            icon: const Icon(Icons.skip_previous),
                            onPressed: () {},
                          ),
                          IconButton(
                            iconSize: 62.0,
                            color: Colors.blue[800],
                            onPressed: () {
                              if (!playing) {
                                //here I'll play the song
                                cache.play('sound_test.mp3');
                                setState(() {
                                  playBtn = Icons.pause;
                                  playing = true;
                                });
                              } else {
                                _player.pause();
                                setState(() {
                                  playBtn = Icons.play_arrow;
                                  playing = false;
                                });
                              }
                            },
                            icon: Icon(
                              playBtn,
                            ),
                          ),
                          IconButton(
                            iconSize: 45.0,
                            color: Colors.blue,
                            icon: const Icon(Icons.skip_next),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
