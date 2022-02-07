import 'package:faith_music_player/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => Home(),
    },
    initialRoute: '/',
  ),);
}
