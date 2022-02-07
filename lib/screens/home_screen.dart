import 'package:faith_music_player/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//Audio packages ------------------------------------------------VVVV>
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:audio_manager/audio_manager.dart';
//Audio packages ------------------------------------------------^^^^>

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var audioManagerInstance = AudioManager.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      backgroundColor: Colors.brown[200],
      body: Container(),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
      // body: Center(
      //   child: Text("This is the landing page"),
      // ),
    );
  }
}
