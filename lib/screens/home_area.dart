import 'package:faith_music_player/widgets/play_music.dart';
import 'package:flutter/material.dart';

class HomeArea extends StatefulWidget {
  const HomeArea({Key key}) : super(key: key);

  @override
  _HomeAreaState createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  @override
  Widget build(BuildContext context) {
    var song = "My Life is Going On";
    var artist = "Cecilia Krull";
    // var fixedHeight = MediaQuery.of(context).size.height * 0.75;
    var fixedWidth = MediaQuery.of(context).size.width * 0.75;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Center(
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
        const SizedBox(
          height: 12.0,
        ),
        Column(
          children: [
            Text(
              song,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Text(
              artist,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
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
}
