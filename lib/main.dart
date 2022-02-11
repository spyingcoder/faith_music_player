import 'package:faith_music_player/screens/home_screen.dart';
import 'package:faith_music_player/shared/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 1,
          color: Colors.blue[900],
          titleTextStyle: const TextStyle(fontFamily: "Rowdies-Bold"),
        ),
        fontFamily: "Rowdies",
      ),
      routes: {
        '/': (context) => const Home(),
        '/splash': (context) => const SplashScreen(),
      },
      initialRoute: '/splash',
    ),
  );
}
