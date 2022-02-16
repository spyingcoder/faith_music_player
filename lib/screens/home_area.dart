import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeArea extends StatefulWidget {
  const HomeArea({Key key}) : super(key: key);

  @override
  _HomeAreaState createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  //################################################

// MUSIC PLAYER LOGIC STARTS-------->
//----------------------------------------------->
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  //music Player objects -------------------------->
  AudioPlayer _player;
  AudioCache cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

  //################################################

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
  //################################################??????????

//Will set the state of slider when dragged---->>>>
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //################################################???????????

////////////////////////////////////////

//////////////////////////////////////////////////////////////
//////////////////////----------MUSIC PLAYER FUNCTIONS STARTS

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //################################################{{{---INSIDE VOID INIT}}}

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

    //################################################{{{---INSIDE VOID INIT}}}
  }

//################################################??????????
//Will set the state of music button according to the play status---->>>>
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
  //################################################??????????

//////////////////////----------MUSIC PLAYER FUNCTIONS ENDS
//////////////////////////////////////////////////////////////
//----------------------------------------------->
//MUSIC PLAYER LOGIC ENDS-------->

  String song = "La Casa De Papel SoundTrack - My Life is going on";
  bool valueFromGesture = false;
  String artist = "Cecilia Krull";

  //MUSIC PLAYING AREA WIDGET STARTS-------->
  //-------------------------------------------------------->

  Widget miniPlayer(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Slider and Start and End Duration of Music---------->
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

            //Music Buttons Area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Favorite Icon
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outlined),
                    color: Colors.white,
                  ),
                ),
                //Shuffle Icon
                Expanded(
                  child: IconButton(
                    iconSize: 30.0,
                    // color: Colors.blue[800],
                    icon: const Icon(Icons.shuffle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                //Previous Icon
                Expanded(
                  child: IconButton(
                    iconSize: 40.0,
                    // color: Colors.blue,
                    icon: const Icon(Icons.skip_previous),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                //Play/Pause Icon
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
                //Next Icon
                Expanded(
                  child: IconButton(
                    iconSize: 40.0,
                    color: Colors.white,
                    // color: Colors.blue,
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ),
                //Loop Icon
                Expanded(
                  child: IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    // color: Colors.blue[800],
                    icon: const Icon(Icons.loop),
                    onPressed: () {},
                  ),
                ),
                //Add to Playlist Icon
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

  //-------------------------------------------------------->
  //MUSIC PLAYING AREA WIDGET ENDS-------->

  @override
  Widget build(BuildContext context) {
    var fixedHeight = MediaQuery.of(context).size.height * 0.10;
    var fixedWidth = MediaQuery.of(context).size.width * 0.70;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25.0,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              // print("PRINT ONTAP");
                            playPause(); // PlayButton().playPause(valueFromGesture);
              // miniPlayerState.playPause;
            },
            //
            // MUSIC ALBUM IMAGE
            child: Container(
              width: fixedWidth,
              height: fixedWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        //SONG NAME AND ARTIST NAME
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: fixedHeight * 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sliceString(song),
                    style: TextStyle(
                      color: Colors.amber[50],
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    artist,
                    style: TextStyle(
                      color: Colors.amber[50],
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        //////----------->
        //////PLAYER AREA
        //////----------->
        miniPlayer(context),
      ],
    );
  }

//SETTING THE STRING LENGTH WITHIN 25 LETTERS
  String sliceString(String word) {
    String slicedString = '';
    if (word.length > 25) {
      for (int i = 0; i < 25; i++) {
        slicedString = slicedString + (word[i]);
      }
      // print(slicedString);
      return slicedString + "...";
    } else {
      // print(word);
      return word;
    }
  }
}
