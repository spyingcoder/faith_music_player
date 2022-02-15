import 'package:faith_music_player/widgets/play_music.dart';
import 'package:flutter/material.dart';

class HomeArea extends StatefulWidget {
  const HomeArea({Key key}) : super(key: key);

  @override
  _HomeAreaState createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  bool valueFromGesture = false;
  String song = "La Casa De Papel SoundTrack - My Life is going on";
  String artist = "Cecilia Krull";
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
              // PlayButton().playPause(valueFromGesture);
              // miniPlayerState.playPause;
            },
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
         SizedBox(
          height: 12.0,
        ),
         MiniPlayer(), //////Player Area
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
