import 'package:faith_music_player/screens/camera_access.dart';
import 'package:faith_music_player/screens/home_screen.dart';
import 'package:faith_music_player/shared/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        elevation: 1,
        color: Colors.blue[900],
      )),
      routes: {
        '/': (context) => Home(),
        '/splash': (context) => SplashScreen(),
        '/cameraScreen': (context) => CameraAccess(),
      },
      initialRoute: '/splash',
    ),
  );
}
