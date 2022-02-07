import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        child: Text("This is the landing page"),
      ),
    );
  }
}
