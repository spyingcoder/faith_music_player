import 'package:faith_music_player/widgets/play_music.dart';
import 'package:flutter/material.dart';

class HomeArea extends StatefulWidget {
  const HomeArea({Key key}) : super(key: key);

  @override
  _HomeAreaState createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  String song =
      "La Casa De Papel SoundTrack - My Life is going on"; //Need to Prevent its overflow
  String artist = "Cecilia Krull";
  MiniPlayer miniPlayerState = const MiniPlayer();
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
            // onTap: miniPlayerState.playPause,
            ////
            ////

            // if (!playing) {
            //         //here I'll play the song
            //         cache.play('sound_test.mp3');
            //         setState(() {
            //           playBtn = Icons.pause;
            //           playing = true;
            //         });
            //       } else {
            //         _player.pause();
            //         setState(() {
            //           playBtn = Icons.play_arrow;
            //           playing = false;
            //         });
            //       }

            ////
            ////
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
        const MiniPlayer(), //////Player Area
      ],
    );
  }

//SETTING THE STRING LENGTH WITHIN 20 LETTERS
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
