import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MiniPlayer extends StatefulWidget {
    MiniPlayer() : super();

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
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 0.75,
      child: Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.blueGrey[300],
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
    // ignore: deprecated_member_use
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };


//this will help in moving the cursor while playing the music, asli masale sach sach
    // ignore: deprecated_member_use
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load("sound_test.mp3");
    //no need to specify the full path here, just put the music file in asset folder - best practice noted
  }


  void playPause() {
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
  }


//////////////////////----------MUSIC PLAYER FUNCTIONS ENDS
//////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: (MediaQuery.of(context).size.height) * 0.20,
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),

        //Slider and Time Duration of Music
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // startDuration,
                    '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  slider(),
                  Text(
                    '${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}',
                    // endDuration,
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),

            //Play/Pause, Previous and Next Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outlined),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 30.0,
                    // color: Colors.blue[800],
                    icon: const Icon(Icons.shuffle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 40.0,
                    // color: Colors.blue,
                    icon: const Icon(Icons.skip_previous),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 50.0,
                    // color: Colors.blue[800],
                    onPressed: playPause,
                    // () {
                    //   if (PlayButton().playPause(playing) == true) {
                    //     cache.play('sound_test.mp3');
                    //     setState(() {
                    //       playing = true;
                    //       playBtn = Icons.pause;
                    //     });
                    //   } else {
                    //     setState(() {
                    //       playing = false;
                    //       playBtn = Icons.play_arrow;
                    //     });
                    //   }
                    // },
                    icon: Icon(playBtn),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 40.0,
                    color: Colors.white,
                    // color: Colors.blue,
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    // color: Colors.blue[800],
                    icon: const Icon(Icons.loop),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.playlist_add),
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class PlayButton {
//   bool playPause(bool isPlaying) {
//     if (!isPlaying) {
//       isPlaying = true;
//       return isPlaying;
//     } else {
//       isPlaying = false;
//       return isPlaying;
//     }
//   }
// }
