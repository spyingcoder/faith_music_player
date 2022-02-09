import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key key}) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
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
      width: (MediaQuery.of(context).size.width) * 0.75,
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
    return Expanded(
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
    );
  }
}
