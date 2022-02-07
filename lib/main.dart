import 'package:faith_music_player/screens/home_screen.dart';
import 'package:faith_music_player/screens/music_screen.dart';
import 'package:faith_music_player/shared/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/splash': (context) => SplashScreen(),
        // '/songWidget': (context) => SongWidget(),
      },
      initialRoute: '/splash',
    ),
  );
}
