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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12.0,
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
          height: 12.0,
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
          height: 12.0,
        ),
        const MiniPlayer(), //////Player Area
      ],
    );
  }
}
